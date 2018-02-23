package com.zzming.graduation.entity;

import java.io.Serializable;
/**
 * id number(6) primary key,
	name varchar2(50),
	norm varchar2(50),
	num number(6),
	price number(6,2),
	enroll Timestamp
 */
import java.util.List;

public class Product implements Serializable {

	private static final long serialVersionUID = -2881628559031959262L;
	private Integer id;
	private Integer kind;
	private String name;
	private String norm;
	private String people;
	private List<Allocation> allocations;

	private Integer num;

	public Product() {
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNorm() {
		return norm;
	}

	public void setNorm(String norm) {
		this.norm = norm;
	}

	public String getPeople() {
		return people;
	}

	public void setPeople(String people) {
		this.people = people;
	}

	public List<Allocation> getAllocations() {
		return allocations;
	}

	public void setAllocations(List<Allocation> allocations) {
		this.allocations = allocations;
	}

	public Integer getNum() {
		return num;
	}

	public Integer getAllNum() {
		int num = 0;
		for (Allocation a : allocations) {
			num += a.getNum();
		}
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public static String getKindStr(int kind){
		String str;
		switch (kind){
			case 0:
				str = "教科书";
				break;
			case 1:
				str = "杂志";
				break;
			case 2:
				str = "小说";
				break;
			case 3:
				str = "期刊";
				break;
			default:
				str = "其他";
				break;
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
		Product other = (Product) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", kind=" + kind + ", name=" + name + ", norm=" + norm + ", people=" + people
				+  ", allocations=" + allocations + ", num=" + num + "]";
	}
}
