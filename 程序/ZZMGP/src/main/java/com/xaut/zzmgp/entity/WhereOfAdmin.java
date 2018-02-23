package com.xaut.zzmgp.entity;

public class WhereOfAdmin {
	private Integer power;
	private String name;
	private Integer page;
	private Integer size;

	public WhereOfAdmin() {
	}

	public Integer getPower() {
		return power;
	}

	public void setPower(Integer power) {
		this.power = power;
	}

	public String getName() {
		return name;
	}
	public String getLikeName(){
		return "%"+name+"%";
	}
	public void setName(String name) {
		this.name = name;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	@Override
	public String toString() {
		return "WhereOfAdmin [power=" + power + ", name=" + name + ", page=" + page + ", size=" + size + "]";
	}
	
}
