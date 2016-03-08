package com.ms.gae.entity;

import java.io.Serializable;

public class Industria implements Serializable {
	private static final long serialVersionUID = 700950448440565182L;
	
	private Integer id_industria;
	private String nombre;
	private String tipo;
	
	public Industria(){
		super();
	}
	
	public Industria( String nombre, String tipo) {
		super();
		this.nombre = nombre;
		this.tipo = tipo;
	}
	public Integer getId_industria() {
		return id_industria;
	}
	public void setId_industria(Integer id_industria) {
		this.id_industria = id_industria;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	@Override
	public String toString() {
		return  id_industria + " " + nombre;
	}
	
	

}
