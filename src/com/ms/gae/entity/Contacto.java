package com.ms.gae.entity;

import java.io.Serializable;

public class Contacto implements Serializable{

	private static final long serialVersionUID = 7498333430113943802L;
	private Integer id_contacto;
	private String nombre_contacto;
	private String apellido;
	private String telefono_oficina;
	private String telefono_celular;
	private String puesto;
	private String correo_primario;
	private String reportar_a;
	private String asignado_a;
	private String comentario;
	
	public Contacto() {
		super();
	}
	

	public Contacto(String nombre_contacto,
			String apellido, String telefono_oficina, String telefono_celular,
			String puesto, String correo_primario, String reportar_a,
			String asignado_a, String comentario) {
		super();
		this.nombre_contacto = nombre_contacto;
		this.apellido = apellido;
		this.telefono_oficina = telefono_oficina;
		this.telefono_celular = telefono_celular;
		this.puesto = puesto;
		this.correo_primario = correo_primario;
		this.reportar_a = reportar_a;
		this.asignado_a = asignado_a;
		this.comentario = comentario;
	}


	public Integer getId_contacto() {
		return id_contacto;
	}

	public void setId_contacto(Integer id_contacto) {
		this.id_contacto = id_contacto;
	}

	public String getNombre_contacto() {
		return nombre_contacto;
	}

	public void setNombre_contacto(String nombre_contacto) {
		this.nombre_contacto = nombre_contacto;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getTelefono_oficina() {
		return telefono_oficina;
	}

	public void setTelefono_oficina(String telefono_oficina) {
		this.telefono_oficina = telefono_oficina;
	}

	public String getTelefono_celular() {
		return telefono_celular;
	}

	public void setTelefono_celular(String telefono_celular) {
		this.telefono_celular = telefono_celular;
	}

	public String getPuesto() {
		return puesto;
	}

	public void setPuesto(String puesto) {
		this.puesto = puesto;
	}

	public String getCorreo_primario() {
		return correo_primario;
	}

	public void setCorreo_primario(String correo_primario) {
		this.correo_primario = correo_primario;
	}

	public String getReportar_a() {
		return reportar_a;
	}

	public void setReportar_a(String reportar_a) {
		this.reportar_a = reportar_a;
	}

	public String getAsignado_a() {
		return asignado_a;
	}

	public void setAsignado_a(String asignado_a) {
		this.asignado_a = asignado_a;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}


	@Override
	public String toString() {
		return  id_contacto + " " + nombre_contacto;
	}
	
	
}
