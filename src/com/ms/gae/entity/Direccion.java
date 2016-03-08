package com.ms.gae.entity;

import java.io.Serializable;

public class Direccion implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6796580283088100296L;
	private Integer id_direccion;
	private String direccion_f;
	private String cuidad_f;
	private String estado_f;
	private Integer cp_f;
	private String pais_f;
	private String direccion_e;
	private String cuidad_e;
	private String estado_e;
	private Integer cp_e;
	private String pais_e;
	
	public Direccion() {
		super();
	}


	public Direccion(String direccion_f, String cuidad_f, String estado_f,
			Integer cp_f, String pais_f, String direccion_e, String cuidad_e,
			String estado_e, Integer cp_e, String pais_e) {
		super();
		this.direccion_f = direccion_f;
		this.cuidad_f = cuidad_f;
		this.estado_f = estado_f;
		this.cp_f = cp_f;
		this.pais_f = pais_f;
		this.direccion_e = direccion_e;
		this.cuidad_e = cuidad_e;
		this.estado_e = estado_e;
		this.cp_e = cp_e;
		this.pais_e = pais_e;
	}


	public Direccion(String direccion_e, String cuidad_e, String estado_e,
			Integer cp_e, String pais_e) {
		super();
		this.direccion_e = direccion_e;
		this.cuidad_e = cuidad_e;
		this.estado_e = estado_e;
		this.cp_e = cp_e;
		this.pais_e = pais_e;
	}


	public Integer getId_direccion() {
		return id_direccion;
	}

	public void setId_direccion(Integer id_direccion) {
		this.id_direccion = id_direccion;
	}

	

	public String getDireccion_f() {
		return direccion_f;
	}



	public void setDireccion_f(String direccion_f) {
		this.direccion_f = direccion_f;
	}



	public String getDireccion_e() {
		return direccion_e;
	}



	public void setDireccion_e(String direccion_e) {
		this.direccion_e = direccion_e;
	}



	public String getCuidad_f() {
		return cuidad_f;
	}

	public void setCuidad_f(String cuidad_f) {
		this.cuidad_f = cuidad_f;
	}

	public String getEstado_f() {
		return estado_f;
	}

	public void setEstado_f(String estado_f) {
		this.estado_f = estado_f;
	}

	public Integer getCp_f() {
		return cp_f;
	}

	public void setCp_f(Integer cp_f) {
		this.cp_f = cp_f;
	}

	public String getPais_f() {
		return pais_f;
	}

	public void setPais_f(String pais_f) {
		this.pais_f = pais_f;
	}

	

	public String getCuidad_e() {
		return cuidad_e;
	}

	public void setCuidad_e(String cuidad_e) {
		this.cuidad_e = cuidad_e;
	}

	public String getEstado_e() {
		return estado_e;
	}

	public void setEstado_e(String estado_e) {
		this.estado_e = estado_e;
	}

	public Integer getCp_e() {
		return cp_e;
	}

	public void setCp_e(Integer cp_e) {
		this.cp_e = cp_e;
	}

	public String getPais_e() {
		return pais_e;
	}

	public void setPais_e(String pais_e) {
		this.pais_e = pais_e;
	}


	@Override
	public String toString() {
		return "Direccion [id_direccion=" + id_direccion + ", direccion_f="
				+ direccion_f + ", cuidad_f=" + cuidad_f + "]";
	}

	
	
	

}
