package com.xaut.zzmgp.entity;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class WhereOfProduct {
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	private int kind;
	private String name;
	private String norm;
	private Integer minNum;
	private Integer maxNum;
	private String begin;
	private String end;
	private Integer page;
	private Integer size;

	
	public Integer getKind() {
		return kind;
	}
	public void setKind(Integer kind) {
		this.kind = kind;
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

	public String getNorm() {
		return norm;
	}
	public String getLikeNorm(){
		return "%"+norm+"%";
	}
	public void setNorm(String norm) {
		this.norm = norm;
	}

	public Integer getMinNum() {
		return minNum;
	}

	public void setMinNum(Integer minNum) {
		this.minNum = minNum;
	}

	public Integer getMaxNum() {
		return maxNum;
	}

	public void setMaxNum(Integer maxNum) {
		this.maxNum = maxNum;
	}

	public String getBegin() {
		return begin;
	}

	public void setBegin(String begin) {
		this.begin = begin;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public Timestamp getTimeBegin() throws ParseException {
		return new Timestamp(sdf.parse(begin).getTime());
	}

	public Timestamp getTimeEnd() throws ParseException {
		return new Timestamp(sdf.parse(end).getTime());
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
		return "WhereOfProduct [kind=" + kind + ", name=" + name + ", norm=" + norm + ", minNum=" + minNum + ", maxNum="
				+ maxNum + ", begin=" + begin + ", end=" + end + ", page=" + page + ", size=" + size + "]";
	}

}
