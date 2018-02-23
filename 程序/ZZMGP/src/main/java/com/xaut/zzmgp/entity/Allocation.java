package com.xaut.zzmgp.entity;

import java.io.Serializable;

public class Allocation implements Serializable {

	private static final long serialVersionUID = 7604261760977466499L;
	private Integer allocation_id;
	private String allocation_name;
	private Integer product_id;
	private Integer num;
	private Integer remainder;
	
	private String product_name;

	public Allocation() {
	}

	public Integer getAllocation_id() {
		return allocation_id;
	}

	public void setAllocation_id(Integer allocation_id) {
		this.allocation_id = allocation_id;
	}

	public String getAllocation_name() {
		return allocation_name;
	}

	public void setAllocation_name(String allocation_name) {
		this.allocation_name = allocation_name;
	}

	public Integer getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Integer getRemainder() {
		return remainder;
	}

	public void setRemainder(Integer remainder) {
		this.remainder = remainder;
	}
	
	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((allocation_id == null) ? 0 : allocation_id.hashCode());
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
		Allocation other = (Allocation) obj;
		if (allocation_id == null) {
			if (other.allocation_id != null)
				return false;
		} else if (!allocation_id.equals(other.allocation_id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return allocation_name + ":" + num;
	}
}
