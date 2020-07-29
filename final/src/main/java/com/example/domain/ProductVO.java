package com.example.domain;

import java.util.ArrayList;
import java.util.Date;

public class ProductVO{
	private int p_no;
	private String id;
	private String title;
	private String content;
	private String image;
	private int price;
	private int view;
	private int p_like;
	private int report;
	private Date date;
	private ArrayList<String> images;
	private String p_images;
	private String detail_images;
	
	public String getP_images() {
		return p_images;
	}
	public void setP_images(String p_images) {
		this.p_images = p_images;
	}
	public String getDetail_images() {
		return detail_images;
	}
	public void setDetail_images(String detail_images) {
		this.detail_images = detail_images;
	}
	private int quantity;
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public ArrayList<String> getImages() {
		return images;
	}
	public void setImages(ArrayList<String> images) {
		this.images = images;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public int getP_like() {
		return p_like;
	}
	public void setP_like(int p_like) {
		this.p_like = p_like;
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
		return "ProductVO [p_no=" + p_no + ", id=" + id + ", title=" + title + ", content=" + content + ", image="
				+ image + ", price=" + price + ", view=" + view + ", p_like=" + p_like + ", report=" + report
				+ ", date=" + date + ", images=" + images + ", p_images=" + p_images + ", detail_images="
				+ detail_images + ", quantity=" + quantity + "]";
	}
}