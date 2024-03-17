package com.itbank.component;

import org.springframework.stereotype.Component;

@Component
public class CalenderComponent {
	
	public int getStartDayOfWeek(int month) {
		java.util.Calendar cal = new java.util.GregorianCalendar(2024, month-1, 1);
		return cal.get(java.util.Calendar.DAY_OF_WEEK);
	}
	
	public int getLastDay(int month) {
		java.util.Calendar cal = new java.util.GregorianCalendar(2024, month-1, 1);
		return cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);	
	}
	
	public String getMonth(int num) {
		String month = "";
		switch(num) {
		case 1: month ="January"; break;
		case 2: month ="February";break;
		case 3: month ="March";break;
		case 4: month ="April";break;
		case 5: month ="May";break;
		case 6: month ="June";break;
		case 7: month ="July";break;
		case 8: month ="August";break;
		case 9: month ="September";break;
		case 10: month ="October";break;
		case 11: month ="November";break;
		case 12: month ="December";
		}
		return month;
	}
	
}
