package com.xaut.zzmgp.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Admin implements Serializable {
	private static final long serialVersionUID = -6155487203299394140L;
	private Integer id;
	private String name;
	private String code;
	private String password;
	private Integer power;
	private Timestamp enroll;

	public Admin() {
	}

	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getPower() {
		return power;
	}

	public void setPower(Integer power) {
		this.power = power;
	}

	public Timestamp getEnroll() {
		return enroll;
	}

	public void setEnroll(Timestamp enroll) {
		this.enroll = enroll;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Admin other = (Admin) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Admin [id=" + id + ", name=" + name + ", code=" + code + ", password=" + password + ", power=" + power
				+ ", enroll=" + enroll + "]";
	}

}
