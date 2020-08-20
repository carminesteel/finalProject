package com.example.domain;

import java.sql.Date;

public class Qna_replyVO{
private int qr_no;
private String replyer;
private String content;
private Date writedate;
private String nickname;
private String u_image;
private int p_no;
private Integer q_no;
private int cnt;



public String getNickname() {
	return nickname;
}
public void setNickname(String nickname) {
	this.nickname = nickname;
}
public String getU_image() {
	return u_image;
}
public void setU_image(String u_image) {
	this.u_image = u_image;
}
public int getQr_no() {
	return qr_no;
}
public void setQr_no(int qr_no) {
	this.qr_no = qr_no;
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
public Date getWritedate() {
	return writedate;
}
public void setWritedate(Date writedate) {
	this.writedate = writedate;
}
public int getP_no() {
	return p_no;
}
public void setP_no(int p_no) {
	this.p_no = p_no;
}
public Integer getQ_no() {
	return q_no;
}
public void setQ_no(Integer q_no) {
	this.q_no = q_no;
}

public int getCnt() {
	return cnt;
}
public void setCnt(int cnt) {
	this.cnt = cnt;
}
@Override
public String toString() {
	return "Qna_replyVO [qr_no=" + qr_no + ", replyer=" + replyer + ", content=" + content + ", writedate=" + writedate
			+ ", p_no=" + p_no + ", q_no=" + q_no + ", cnt=" + cnt + ", getQr_no()=" + getQr_no() + ", getReplyer()="
			+ getReplyer() + ", getContent()=" + getContent() + ", getWritedate()=" + getWritedate() + ", getP_no()="
			+ getP_no() + ", getQ_no()=" + getQ_no() + ", getCnt()=" + getCnt() + ", getClass()=" + getClass()
			+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
}




}
