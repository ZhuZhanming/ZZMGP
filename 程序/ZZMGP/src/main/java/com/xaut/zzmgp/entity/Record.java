package com.xaut.zzmgp.entity;

import java.io.Serializable;
import java.sql.Timestamp;


public class Record implements Serializable {

	private static final long serialVersionUID = -149531871312876385L;
	public static final int IN = 0;
	public static final int OUT = 1;
	
	
	private Integer id;
	/**
	 * 1:出库,0:入库
	 */
	private Integer kind;
	private Integer product_id;
	private String product_name;
	private Integer admin_id;
	private String admin_name;
	private String people;
	private Integer num;
	private String info;
	private String oname;
	private Timestamp enroll;

	public Record() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getKind() {
		return kind;
	}

	public void setKind(Integer kind) {
		this.kind = kind;
	}

	public Integer getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}

	public Integer getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}
	

	public String getPeople() {
		return people;
	}

	public void setPeople(String people) {
		this.people = people;
	}

	public Timestamp getEnroll() {
		return enroll;
	}

	public void setEnroll(Timestamp enroll) {
		this.enroll = enroll;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public Integer getNum() {
		return num;
	}
	
	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public void setNum(Integer num) {
		this.num = num;
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
		Record other = (Record) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Record [id=" + id + ", kind=" + kind + ", product_id=" + product_id + ", product_name=" + product_name
				+ ", admin_id=" + admin_id + ", admin_name=" + admin_name + ", num=" + num + ", info=" + info
				+ ", oname=" + oname + ", enroll=" + enroll + "]";
	}

}
