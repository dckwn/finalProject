package com.itbank.model;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.socket.WebSocketSession;

public class MemberDTO {
	private int idx;
	private int isAdmin;
	private String userid;
	private String userpw;
	private String username;
	private String profile_image;
	private String phone_num;
	private Date birth;
	private String email;
	private String gender;
	
	
	private MultipartFile profile_Upload;
	private String strbirth;
	private Set<WebSocketSession> sessions = new HashSet<>();
	

	
	

	public Set<WebSocketSession> getSessions() {
		return sessions;
	}


	public void setSessions(Set<WebSocketSession> sessions) {
		this.sessions = sessions;
	}


	public Date getBirth() {
		return birth;
	}


	public void setBirth(Date birth) {
		this.birth = birth;
	}


	public String getStrbirth() {
		return strbirth;
	}


	public void setStrbirth(String strbirth) {
		this.strbirth = strbirth;
	}


	public String getPhone_num() {
		return phone_num;
	}


	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}


	public int getIdx() {
		return idx;
	}


	public void setIdx(int idx) {
		this.idx = idx;
	}


	public int getIsAdmin() {
		return isAdmin;
	}


	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getUserpw() {
		return userpw;
	}


	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getProfile_image() {
		return profile_image;
	}


	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public MultipartFile getProfile_Upload() {
		return profile_Upload;
	}


	public void setProfile_Upload(MultipartFile profile_Upload) {
		this.profile_Upload = profile_Upload;
	}
	
	
}

