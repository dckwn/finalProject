package com.itbank.model;

public class CalenderDTO {
	private int startDayOfWeek;
	private int lastDay;
	private String month;
	
	
	
	public int getStartDayOfWeek() {
		return startDayOfWeek;
	}
	public void setStartDayOfWeek(int startDayOfWeek) {
		this.startDayOfWeek = startDayOfWeek;
	}
	public int getLastDay() {
		return lastDay;
	}
	public void setLastDay(int lastDay) {
		this.lastDay = lastDay;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
}
