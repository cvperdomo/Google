package com.ms.gae.entity;

import java.io.Serializable;

public class Organizacion implements Serializable{
	
	private static final long serialVersionUID = 4203409131376634219L;
	
	private Integer id_organizacion;
	private String nombre_organizacion;
	private String sitio_web;
	private Integer telefono;
	private String empleado;
	private String correo_p;
	private String correo_s;
	private double ingreso_anual;
	private String descripcion;
	private Direccion direccion;
	private Contacto asignado_a;
	public Organizacion() {
	}
	
	public Organizacion(String nombre_organizacion, String sitio_web,
			Integer telefono, String empleado, String correo_p,
			String correo_s, double ingreso_anual, String descripcion,
			Direccion direccion) {
		super();
		this.nombre_organizacion = nombre_organizacion;
		this.sitio_web = sitio_web;
		this.telefono = telefono;
		this.empleado = empleado;
		this.correo_p = correo_p;
		this.correo_s = correo_s;
		this.ingreso_anual = ingreso_anual;
		this.descripcion = descripcion;
		this.direccion = direccion;
	}
	
	
	

	public Organizacion(String nombre_organizacion, String sitio_web,
			Integer telefono, String empleado, String correo_p,
			String correo_s, double ingreso_anual, String descripcion,
			Direccion direccion, Contacto asignado_a) {
		super();
		this.nombre_organizacion = nombre_organizacion;
		this.sitio_web = sitio_web;
		this.telefono = telefono;
		this.empleado = empleado;
		this.correo_p = correo_p;
		this.correo_s = correo_s;
		this.ingreso_anual = ingreso_anual;
		this.descripcion = descripcion;
		this.direccion = direccion;
		this.asignado_a = asignado_a;
	}

	public Integer getId_organizacion() {
		return id_organizacion;
	}
	public void setId_organizacion(Integer id_organizacion) {
		this.id_organizacion = id_organizacion;
	}
	

	public String getNombre_organizacion() {
		return nombre_organizacion;
	}

	public void setNombre_organizacion(String nombre_organizacion) {
		this.nombre_organizacion = nombre_organizacion;
	}

	public String getSitio_web() {
		return sitio_web;
	}
	public void setSitio_web(String sitio_web) {
		this.sitio_web = sitio_web;
	}
	public Integer getTelefono() {
		return telefono;
	}
	public void setTelefono(Integer telefono) {
		this.telefono = telefono;
	}
	public String getEmpleado() {
		return empleado;
	}
	public void setEmpleado(String empleado) {
		this.empleado = empleado;
	}
	public String getCorreo_p() {
		return correo_p;
	}
	public void setCorreo_p(String correo_p) {
		this.correo_p = correo_p;
	}
	public String getCorreo_s() {
		return correo_s;
	}
	public void setCorreo_s(String correo_s) {
		this.correo_s = correo_s;
	}
	public double getIngreso_anual() {
		return ingreso_anual;
	}
	public void setIngreso_anual(double ingreso_anual) {
		this.ingreso_anual = ingreso_anual;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Direccion getDireccion() {
		return direccion;
	}
	public void setDireccion(Direccion direccion) {
		this.direccion = direccion;
	}
	public Contacto getAsignado_a() {
		return asignado_a;
	}

	public void setAsignado_a(Contacto asignado_a) {
		this.asignado_a = asignado_a;
	}

	@Override
	public String toString() {
		return id_organizacion + "_" + nombre_organizacion;
	}
	
	
	
}
