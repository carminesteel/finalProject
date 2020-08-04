package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CartVO {
   private String id;
   private int p_no;
   
   @JsonFormat(pattern="yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
   private Date buydate;
   private String p_image;
   private String title;
   private int price;
   private int quantity;
   private int sum;
   
   
   public int getSum() {
	return sum;
}
public void setSum(int price, int quantity) {
	this.sum = price*quantity;
}

public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public int getP_no() {
      return p_no;
   }
   public void setP_no(int p_no) {
      this.p_no = p_no;
   }
   public Date getBuydate() {
      return buydate;
   }
   public void setBuydate(Date buydate) {
      this.buydate = buydate;
   }
   public String getP_image() {
      return p_image;
   }
   public void setP_image(String p_image) {
      this.p_image = p_image;
   }
   public int getPrice() {
      return price;
   }
   public void setPrice(int price) {
      this.price = price;
   }
   public int getQuantity() {
      return quantity;
   }
   public void setQuantity(int quantity) {
      this.quantity = quantity;
   }
}