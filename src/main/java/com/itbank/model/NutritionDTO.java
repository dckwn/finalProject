package com.itbank.model;

import java.sql.Date;

//IDX       NOT NULL NUMBER        
//USERID    NOT NULL VARCHAR2(150) 
//FOOD_IDX           NUMBER        
//ADD_DATE           DATE          
//MEAL_TIME          VARCHAR2(100) 

public class NutritionDTO {
	private int idx;
	private String userid;
	private int food_idx;
	private Date add_date;
	private String meal_time;
	
	private double user_kcal;
	private double user_tan;
	private double user_dan;
	private double user_ji;
	private double user_dang;
	private double user_na;
	
	
	public double getUser_kcal() {
		return user_kcal;
	}
	public void setUser_kcal(double user_kcal) {
		this.user_kcal = user_kcal;
	}
	public double getUser_tan() {
		return user_tan;
	}
	public void setUser_tan(double user_tan) {
		this.user_tan = user_tan;
	}
	public double getUser_dan() {
		return user_dan;
	}
	public void setUser_dan(double user_dan) {
		this.user_dan = user_dan;
	}
	public double getUser_ji() {
		return user_ji;
	}
	public void setUser_ji(double user_ji) {
		this.user_ji = user_ji;
	}
	public double getUser_dang() {
		return user_dang;
	}
	public void setUser_dang(double user_dang) {
		this.user_dang = user_dang;
	}
	public double getUser_na() {
		return user_na;
	}
	public void setUser_na(double user_na) {
		this.user_na = user_na;
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
	public int getFood_idx() {
		return food_idx;
	}
	public void setFood_idx(int food_idx) {
		this.food_idx = food_idx;
	}
	public Date getAdd_date() {
		return add_date;
	}
	public void setAdd_date(Date add_date) {
		this.add_date = add_date;
	}
	public String getMeal_time() {
		return meal_time;
	}
	public void setMeal_time(String meal_time) {
		this.meal_time = meal_time;
	}
	
	
}
