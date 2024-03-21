package com.itbank.model;

import java.sql.Date;

public class AbscentDTO {

//	IDX       NOT NULL NUMBER        
//	USERID    NOT NULL VARCHAR2(150) 
//	CHECKDATE          DATE  
	
	private int idx;
	private String userid;
	private Date checkDate;
	
	private Date day;
	
	public Date getDay() {
		return day;
	}
	public void setDay(Date day) {
		this.day = day;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}
}
