<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>

<html>
    <head>
        <title>Envío de correos</title>
    </head>
    <body>
        <%

        if (request.getMethod().equals("POST")) {

            Connection conn = null;
            Statement stm = null;

            String User = request.getParameter("txtUser");
            String Pass1 = request.getParameter("txtPass1");
            String Pass2 = request.getParameter("txtPass2");
            String Email = request.getParameter("txtEmail");

            Class.forName("com.mysql.jdbc.Driver").newInstance();

            conn = DriverManager.getConnection("jdbc:mysql://localhost/usuarios", "root", "root");

            stm = conn.createStatement();

            String sql;

            if(!Pass1.equals(Pass2)){

                out.println("Las contraseñas no coinciden.<a href='nuevoUsuario.jsp'>Volver<a/>");

            }else {

                sql = "SELECT COUNT(usuario) as count from usuarios where usuario='" + User + "'";

                ResultSet rst = stm.executeQuery(sql);

                rst.next();

                if (rst.getString("count").equals("1")) {

                    out.println("Ese usuario ya existe.<a href='nuevoUsuarioCorreo.jsp'>Volver<a/>");

                } else {

                    boolean status = true;

            // enter here the smtp mail server address
            // ask your ISP to get the proper name
            String mailServer ="smtp.gmail.com";
            String username="correo@gmail.com";
            String password="password1234";

            //Obtener ID
             sql = "INSERT into usuarios (usuario, password, confirm, email) values ('" + User + "', '" + Pass1 + "','no','" + Email + "')";

            int total  = stm.executeUpdate(sql);

            String sqlId = "SELECT idusuario from usuarios where usuario='" + User + "' and password='" + Pass1 + "'";
            rst = null;
            rst = stm.executeQuery(sqlId);
            rst.next();

            String Pass = rst.getString(1);

            String fromEmail = username;

            String messageEnter = "Bienvenido Nuevo usuario =). Para validar su correo, haga click aquí: <a href='http://localhost:8080/Listado2Ejercicio5/activaUsuario.jsp?id=" + Pass +"'>VALIDAR</a>";

            String toEmail = request.getParameter("txtEmail");

            if (toEmail.equals("")) {
                toEmail = "unknown";
            }

            try {

                Properties props = new Properties();
                props.put("mail.smtps.host", mailServer);
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtps.port", "465");
                props.put("mail.smtps.STARTTLS.enable", true);

                Session s = Session.getInstance(props, null);

                MimeMessage message = new MimeMessage(s);

                InternetAddress from = new InternetAddress(fromEmail);
                message.setFrom(from);

                InternetAddress to = new InternetAddress(toEmail);

                message.addRecipient(Message.RecipientType.TO, to);

                message.setSubject("[Bienvenido Usuario]");
                //message.setText(messageEnter);
                message.setContent(messageEnter, "text/html");

                Transport tr = s.getTransport("smtps");
                tr.connect(mailServer, username, password);

                message.saveChanges(); // don't forget this
                tr.sendMessage(message, message.getAllRecipients());
                tr.close();

            } catch (NullPointerException n) {
                System.out.println(n.getMessage());
                out.println("¡ERROR!");
                status = false;

            } catch (Exception e) {
                System.out.println(e.getMessage());
                out.println("ERROR, NO se envió mensaje para " + toEmail + ", la razon es: " + e);
                status = false;
            }

            if (status == true) {
                out.println("Su Mensaje para " + toEmail + " se envió correctamente.");
            }

                    if ( total != 0){

                         out.println("Usuario nuevo creado.Recibirá un correo de confirmación para activar la cuenta.<br><a href='index.jsp'>Volver<a/> ");

                    }else {

                        out.println("Error al crear usuario.<br><a href='index.jsp'>Volver<a/> ");
                    }

                }

                stm.close();             

            }

        } else {

        %>

        <h1>Nuevo usuario</h1>
        <form action="nuevoUsuarioCorreo.jsp" method="post">
            <table>
                <tr>
                    <td>Nombre:</td><td><input type="text" name="txtUser" id="txtUser"></td>
                </tr>
                <tr>
                    <td>Contraseña:</td><td><input type="password" name="txtPass1" id="txtPass"></td>
                </tr>
                <tr>
                    <td>Repetir Contraseña:</td><td><input type="password" name="txtPass2" id="txtPass"></td>
                </tr>
                <tr>
                    <td>E-mail:</td><td><input type="text" name="txtEmail" id="txtEmail"></td>
                </tr>
                <tr>
                    <td><a href="index.jsp">Volver</a></td><td><input type="submit" value="Crear"></td>
                </tr>
            </table>            
        </form>

        <%        }
        %>

    </body>
</html>