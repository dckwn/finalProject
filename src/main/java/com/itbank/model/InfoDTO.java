package com.itbank.model;


//IDX      NOT NULL NUMBER        
//USERID            VARCHAR2(150) 
//HEIGHT   NOT NULL NUMBER        
//WEIGHT   NOT NULL NUMBER        
//ACTIVITY NOT NULL NUMBER        
//INTAKE   NOT NULL NUMBER  
public class InfoDTO {

	private int idx;
	private String userid;
	private double height;
	private double weight;
	private int activity;
	private int intake;
	
	private int userTan;
	private int userDan;
	private int userJi;
	
	
	
	public int getUserTan() {
		return userTan;
	}
	public void setUserTan(int userTan) {
		this.userTan = userTan;
	}
	public int getUserDan() {
		return userDan;
	}
	public void setUserDan(int userDan) {
		this.userDan = userDan;
	}
	public int getUserJi() {
		return userJi;
	}
	public void setUserJi(int userJi) {
		this.userJi = userJi;
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
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public int getActivity() {
		return activity;
	}
	public void setActivity(int activity) {
		this.activity = activity;
	}
	public int getIntake() {
		return intake;
	}
	public void setIntake(int intake) {
		this.intake = intake;
	}
	
	
	
}
