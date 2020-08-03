package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class B_replyVO extends BoardVO{
 private int r_no;
 private String replyer;
 private String content;
 private Date date;
public int getR_no() {
	return r_no;
}
public void setR_no(int r_no) {
	this.r_no = r_no;
}
public String getReplyer() {
	return replyer;
}
public void setReplyer(String replyer) {
	this.replyer = replyer;
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
@Override
public String toString() {
	return "B_replyVO [r_no=" + r_no + ", replyer=" + replyer + ", content=" + content + ", date="
			+ date + ", getR_no()=" + getR_no() + ", getB_no()=" + getB_no() + ", getReplyer()=" + getReplyer()
			+ ", getContent()=" + getContent() + ", getDate()=" + getDate() + ", getClass()=" + getClass()
			+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
}

}