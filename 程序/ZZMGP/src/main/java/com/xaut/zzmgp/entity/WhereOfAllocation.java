package com.xaut.zzmgp.entity;

public class WhereOfAllocation {
	// 存取货物的条件
	private Integer kind;
	private Integer product_id;
	// 查询仓库情况的条件
	private Integer area_id;
	private Integer frame_id;
	private Integer size;
	private Integer page;

	public WhereOfAllocation() {
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

	public Integer getArea_id() {
		return area_id;
	}

	public void setArea_id(Integer area_id) {
		this.area_id = area_id;
	}

	public Integer getFrame_id() {
		return frame_id;
	}

	public void setFrame_id(Integer frame_id) {
		this.frame_id = frame_id;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

}
