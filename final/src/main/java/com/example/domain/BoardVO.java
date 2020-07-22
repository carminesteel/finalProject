package com.example.domain;

import java.util.ArrayList;
import java.util.Date;

public class BoardVO {
 private int b_no;
 private String id;
 private String title;
 private String content;
 private String image;
 private int view;
 private int like;
 private int report;
 private Date date;
 private ArrayList<String> images;
 

public ArrayList<String> getImages() {
	return images;
}
public void setImages(ArrayList<String> images) {
	this.images = images;
}
public int getB_no() {
	return b_no;
}
public void setB_no(int b_no) {
	this.b_no = b_no;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
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
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
public int getView() {
	return view;
}
public void setView(int view) {
	this.view = view;
}
public int getLike() {
	return like;
}
public void setLike(int like) {
	this.like = like;
}
public int getReport() {
	return report;
}
public void setReport(int report) {
	this.report = report;
}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}
@Override
public String toString() {
	return "BoardVO [b_no=" + b_no + ", id=" + id + ", title=" + title + ", content=" + content + ", image=" + image
			+ ", view=" + view + ", like=" + like + ", report=" + report + ", date=" + date + ", images=" + images
			+ ", getImages()=" + getImages() + ", getB_no()=" + getB_no() + ", getId()=" + getId() + ", getTitle()="
			+ getTitle() + ", getContent()=" + getContent() + ", getImage()=" + getImage() + ", getView()=" + getView()
			+ ", getLike()=" + getLike() + ", getReport()=" + getReport() + ", getDate()=" + getDate() + ", getClass()="
			+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
}

 
}
