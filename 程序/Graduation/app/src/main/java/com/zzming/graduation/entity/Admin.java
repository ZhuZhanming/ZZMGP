package com.zzming.graduation.entity;

import android.widget.TextView;

import java.io.Serializable;
import java.sql.Timestamp;

public class Admin implements Serializable {
	private static final long serialVersionUID = -6155487203299394140L;
	private Integer id;
	private String name;
	private String code;
	private String password;
	private Integer power;

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

	public static String getPowerStr(int power){
		String str;
		switch (power){
			case 0:
				str = "最高管理员";
				break;
			case 1:
				str = "入库管理员";
				break;
			case 2:
				str = "出库管理员" ;
				break;
			case 3:
				str = "游客";
				break;
			default:
				str = "其他";
		}
		return str;
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
				+ "]";
	}

}
