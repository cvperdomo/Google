package com.ms.gae.entity;

import java.io.Serializable;

public class User implements Serializable {
	private static final long serialVersionUID = -2786610927072641933L;
	private Integer id_user;
	private String nombre;
	private String primer_apellido;
	private String segundo_apellido;
	private String password;
	public User() {
	}
	
	
	public User(String nombre, String primer_apellido, String segundo_apellido,
			String password) {
		super();
		this.nombre = nombre;
		this.primer_apellido = primer_apellido;
		this.segundo_apellido = segundo_apellido;
		this.password = password;
	}


	public Integer getId_user() {
		return id_user;
	}
	public void setId_user(Integer id_user) {
		this.id_user = id_user;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getPrimer_apellido() {
		return primer_apellido;
	}
	public void setPrimer_apellido(String primer_apellido) {
		this.primer_apellido = primer_apellido;
	}
	public String getSegundo_apellido() {
		return segundo_apellido;
	}
	public void setSegundo_apellido(String segundo_apellido) {
		this.segundo_apellido = segundo_apellido;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [id_user=" + id_user + ", nombre=" + nombre + "]";
	}
}
