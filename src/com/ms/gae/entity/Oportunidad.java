package com.ms.gae.entity;

import java.io.Serializable;
import java.util.Date;

public class Oportunidad implements Serializable{
	private static final long serialVersionUID = -3851287994765274095L;
	private Integer id_oportunidad;
	private String nombre_oportunidad;
	private String organizacion;
	private double monto;
	private Date fecha_cierre;
	private String probabilidad;
	private double monto_cast;
	private String descripcion;
	private Contacto asiganado_a;
	public Oportunidad() {
	}
	
	public Oportunidad(String nombre_oportunidad, double monto,
			Date fecha_cierre, String probabilidad, double monto_cast,
			String descripcion) {
		super();
		this.nombre_oportunidad = nombre_oportunidad;
		this.monto = monto;
		this.fecha_cierre = fecha_cierre;
		this.probabilidad = probabilidad;
		this.monto_cast = monto_cast;
		this.descripcion = descripcion;
	}
	

	public Oportunidad(String nombre_oportunidad, String organizacion,
			double monto, Date fecha_cierre, String probabilidad,
			double monto_cast, String descripcion, Contacto asiganado_a) {
		super();
		this.nombre_oportunidad = nombre_oportunidad;
		this.organizacion = organizacion;
		this.monto = monto;
		this.fecha_cierre = fecha_cierre;
		this.probabilidad = probabilidad;
		this.monto_cast = monto_cast;
		this.descripcion = descripcion;
		this.asiganado_a = asiganado_a;
	}

	public void setNombre_oportunidad(String nombre_oportunidad) {
		this.nombre_oportunidad = nombre_oportunidad;
	}

	public String getNombre_oportunidad() {
		return nombre_oportunidad;
	}
	public double getMonto() {
		return monto;
	}
	public void setMonto(double monto) {
		this.monto = monto;
	}
	public Date getFecha_cierre() {
		return fecha_cierre;
	}
	public void setFecha_cierre(Date fecha_cierre) {
		this.fecha_cierre = fecha_cierre;
	}
	public String getProbabilidad() {
		return probabilidad;
	}
	public void setProbabilidad(String probabilidad) {
		this.probabilidad = probabilidad;
	}
	public double getMonto_cast() {
		return monto_cast;
	}
	public void setMonto_cast(double monto_cast) {
		this.monto_cast = monto_cast;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Integer getId_oportunidad() {
		return id_oportunidad;
	}
	public void setId_oportunidad(Integer id_oportunidad) {
		this.id_oportunidad = id_oportunidad;
	}
	
	public Contacto getAsiganado_a() {
		return asiganado_a;
	}

	public void setAsiganado_a(Contacto asiganado_a) {
		this.asiganado_a = asiganado_a;
	}
	public String getOrganizacion() {
		return organizacion;
	}

	public void setOrganizacion(String organizacion) {
		this.organizacion = organizacion;
	}

	@Override
	public String toString() {
		return id_oportunidad + " " + nombre_oportunidad;
	}
	
	
	
}