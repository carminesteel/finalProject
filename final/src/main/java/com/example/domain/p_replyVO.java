package com.example.domain;

import java.sql.Date;

public class p_replyVO extends ProductVO{

	private int r_no;
	private String replyer;
	private String content;
	private Date date;
	private int p_no;
	private int cnt;

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

	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "p_replyVO [r_no=" + r_no + ", replyer=" + replyer + ", content=" + content + ", date=" + date
				+ ", p_no=" + p_no + ", cnt=" + cnt + ", getR_no()=" + getR_no() + ", getReplyer()=" + getReplyer()
				+ ", getContent()=" + getContent() + ", getDate()=" + getDate() + ", getP_no()=" + getP_no()
				+ ", getCnt()=" + getCnt() + ", getP_id()=" + getP_id() + ", getName()=" + getName()
				+ ", getP_images()=" + getP_images() + ", getDetail_images()=" + getDetail_images() + ", getQuantity()="
				+ getQuantity() + ", getImages()=" + getImages() + ", getId()=" + getId() + ", getTitle()=" + getTitle()
				+ ", getImage()=" + getImage() + ", getPrice()=" + getPrice() + ", getView()=" + getView()
				+ ", getP_like()=" + getP_like() + ", getReport()=" + getReport() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	

	

}
