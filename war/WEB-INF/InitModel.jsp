<%
String BASEURL=request.getContextPath();
String CONTROLLER=BASEURL+"/servlet";
String ABSOLUTEURL=application.getInitParameter("ABSOLUTEURL");
String IMGSFOLDER="/";
 
application.setAttribute("CONTROLLER",CONTROLLER);
application.setAttribute("BASEURL",BASEURL);
application.setAttribute("ABSOLUTEURL",ABSOLUTEURL);
application.setAttribute("IMGSFOLDER",IMGSFOLDER);
%>