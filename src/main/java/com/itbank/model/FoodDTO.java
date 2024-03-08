package com.itbank.model;

public class FoodDTO {
//	IDX        NOT NULL NUMBER        
//	GROUP_NAME          VARCHAR2(100) 
//	FOOD_NAME  NOT NULL VARCHAR2(300) 
//	CAPACITY            NUMBER        
//	KCAL                NUMBER        
//	TAN                 NUMBER        
//	DAN                 NUMBER        
//	JI                  NUMBER        
//	DANG                NUMBER        
//	NA                  NUMBER  
	
	private int idx;
	private String group_name;
	private String food_name;
	private int capacity;
	private int kcal;
	private int tan;
	private int dan;
	private int ji;
	private int dang;
	private int na;
	
	
	public int getKcal() {
		return kcal;
	}
	public void setKcal(int kcal) {
		this.kcal = kcal;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public int getTan() {
		return tan;
	}
	public void setTan(int tan) {
		this.tan = tan;
	}
	public int getDan() {
		return dan;
	}
	public void setDan(int dan) {
		this.dan = dan;
	}
	public int getJi() {
		return ji;
	}
	public void setJi(int ji) {
		this.ji = ji;
	}
	public int getDang() {
		return dang;
	}
	public void setDang(int dang) {
		this.dang = dang;
	}
	public int getNa() {
		return na;
	}
	public void setNa(int na) {
		this.na = na;
	}

}
