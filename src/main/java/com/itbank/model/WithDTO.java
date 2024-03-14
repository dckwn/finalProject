package com.itbank.model;

import java.sql.Date;

//이름         널?       유형             
//---------- -------- -------------- 
//IDX        NOT NULL NUMBER         
//TITLE      NOT NULL VARCHAR2(200)  
//WRITER     NOT NULL VARCHAR2(150)  
//MAINTEXT   NOT NULL VARCHAR2(4000) 
//IMAGE               VARCHAR2(2000) 
//CATEGORY            VARCHAR2(100)  
//CHOICE              VARCHAR2(100)  
//WRITE_DATE          DATE           
//START_DATE NOT NULL DATE           
//END_DATE   NOT NULL DATE           
//PEOPLENUM  NOT NULL NUMBER        

public class WithDTO {
	
	private int idx;
	private String title;
	private String writer;
	private String maintext;
	private String image;
	private String category;
	private String choice;
	private Date write_date;
	private Date start_date;
	private Date end_date;
	private int peopleNum;
	
	private int withNum; //몇 명의 인원이 참여하는지를 담는 변수

	
	
	public int getWithNum() {
		return withNum;
	}
	public void setWithNum(int withNum) {
		this.withNum = withNum;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getMaintext() {
		return maintext;
	}
	public void setMaintext(String maintext) {
		this.maintext = maintext;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getChoice() {
		return choice;
	}
	public void setChoice(String choice) {
		this.choice = choice;
	}
	
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public int getPeopleNum() {
		return peopleNum;
	}
	public void setPeopleNum(int peopleNum) {
		this.peopleNum = peopleNum;
	}

	
}
