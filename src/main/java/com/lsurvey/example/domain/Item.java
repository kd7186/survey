package com.lsurvey.example.domain;

public class Item {
	private int iId;
	private int qId;
	private int getNext;
	private String iItem;
	private int sId;

	public int getsId() {
		return sId;
	}
	public void setsId(int sId) {
		this.sId = sId;
	}
	public String getiItem() {
		return iItem;
	}
	public void setiItem(String iItem) {
		this.iItem = iItem;
	}
	public int getGetNext() {
		return getNext;
	}
	public void setGetNext(int getNext) {
		this.getNext = getNext;
	}
	public int getiId() {
		return iId;
	}
	public void setiId(int iId) {
		this.iId = iId;
	}
	public int getqId() {
		return qId;
	}
	public void setqId(int qId) {
		this.qId = qId;
	}
}
