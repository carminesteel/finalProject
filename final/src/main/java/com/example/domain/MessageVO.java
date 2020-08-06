package com.example.domain;




import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MessageVO {

	private int m_no;
	private String title;
	private String content;
	private String sender;
	@JsonFormat(pattern="yyyy-MM-dd kk:mm:ss", timezone="Asia/Seoul")
	private Date sendDate;
	@JsonFormat(pattern="yyyy-MM-dd kk:mm:ss", timezone="Asia/Seoul")
	private Date receiveDate;
	private String receiver;
	private int rdel;
	private int p_no;
	
	
	public int getrdel() {
		return rdel;
	}
	public void setrdel(int rdel) {
		this.rdel = rdel;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
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
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	public Date getReceiveDate() {
		return receiveDate;
	}
	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	
	@Override
	public String toString() {
		return "MessageVO [m_no=" + m_no + ", title=" + title + ", content=" + content + ", sender=" + sender
				+ ", sendDate=" + sendDate + ", receiveDate=" + receiveDate + ", receiver=" + receiver + ", rdel="
				+ rdel + ", p_no=" + p_no + "]";
	}
}
