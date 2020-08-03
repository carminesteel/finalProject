package com.example.domain;

import java.util.ArrayList;

public class ExhibitionVO {
	
	private int e_no;
	private String title;
	private String content;
	private String date;
	private String date2;
	private String image;
	private ArrayList<String> images;
	private String addr;
	private String addr_detail;
	private String tel;
	private String id;
	private int replyCount;
	
	
	
	
	public ArrayList<String> getImages() {
		return images;
	}
	public void setImages(ArrayList<String> images) {
		this.images = images;
	}
	public String getDate2() {
		return date2;
	}
	public void setDate2(String date2) {
		this.date2 = date2;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public int getE_no() {
		return e_no;
	}
	public void setE_no(int e_no) {
		this.e_no = e_no;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr_detail() {
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "ExhibitionVO [e_no=" + e_no + ", title=" + title + ", content=" + content + ", date=" + date
				+ ", date2=" + date2 + ", image=" + image + ", images=" + images + ", addr=" + addr + ", addr_detail="
				+ addr_detail + ", tel=" + tel + ", id=" + id + ", replyCount=" + replyCount + "]";
	}
	
}
