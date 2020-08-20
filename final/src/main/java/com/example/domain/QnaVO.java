package com.example.domain;

import java.sql.Date;

public class QnaVO {
private int p_no;
private String nickname;
private String u_image;
private String id;
private String title;
private String content;
private Date date;
private int q_no;
private int cnt;



public String getU_image() {
	return u_image;
}
public void setU_image(String u_image) {
	this.u_image = u_image;
}
public String getNickname() {
	return nickname;
}
public void setNickname(String nickname) {
	this.nickname = nickname;
}
public int getP_no() {
	return p_no;
}
public void setP_no(int p_no) {
	this.p_no = p_no;
}

public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}
public int getQ_no() {
	return q_no;
}
public void setQ_no(int q_no) {
	this.q_no = q_no;
}


public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public int getCnt() {
	return cnt;
}
public void setCnt(int cnt) {
	this.cnt = cnt;
}
@Override
public String toString() {
	return "QnaVO [p_no=" + p_no + ", id=" + id + ", title=" + title + ", content=" + content + ", date=" + date
			+ ", q_no=" + q_no + ", cnt=" + cnt + ", getP_no()=" + getP_no() + ", getTitle()=" + getTitle()
			+ ", getContent()=" + getContent() + ", getDate()=" + getDate() + ", getQ_no()=" + getQ_no() + ", getId()="
			+ getId() + ", getCnt()=" + getCnt() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
			+ ", toString()=" + super.toString() + "]";
}




}
