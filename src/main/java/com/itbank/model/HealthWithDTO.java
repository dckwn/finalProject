package com.itbank.model;
//이름         널?       유형            
//---------- -------- ------------- 
//IDX        NOT NULL NUMBER        
//WITHPEOPLE NOT NULL VARCHAR2(150) 
//BOARD_ID            NUMBER     
public class HealthWithDTO {
	private int idx;
	private String withPeople;
	private int board_id;
	
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getWithPeople() {
		return withPeople;
	}
	public void setWithPeople(String withPeople) {
		this.withPeople = withPeople;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	
	
}
