package com.example.domain;

import java.sql.Date;

public class p_replyVO extends ProductVO{

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
		return "p_replyVO [r_no=" + r_no + ", replyer=" + replyer + ", content=" + content + ", date=" + date
				+ ", getR_no()=" + getR_no() + ", getReplyer()=" + getReplyer() + ", getContent()=" + getContent()
				+ ", getDate()=" + getDate() + ", getP_no()=" + getP_no() + "]";
	}
	

	

}
