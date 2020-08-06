package com.example.domain;



import java.sql.Date;

public class B_replyVO extends BoardVO{
 private int r_no;
 private String replyer;
 private String content;
 private Date date;
 private int replyCount;
 private String u_image;
 
 
public String getU_image() {
	return u_image;
}
public void setU_image(String u_image) {
	this.u_image = u_image;
}
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
public int getReplyCount() {
	return replyCount;
}
public void setReplyCount(int replyCount) {
	this.replyCount = replyCount;
}

}