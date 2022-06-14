package com.lsurvey.example.domain;

import java.util.List;

public class Question {
	private int sId;
	private int qId;
	private String qQuestion;
	private String qType;
	private int getNext;
	private List<Item> items;
	
	
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}
	public int getGetNext() {
		return getNext;
	}
	public void setGetNext(int getNext) {
		this.getNext = getNext;
	}
	public int getsId() {
		return sId;
	}
	public void setsId(int sId) {
		this.sId = sId;
	}
	public int getqId() {
		return qId;
	}
	public void setqId(int qId) {
		this.qId = qId;
	}
	public String getqQuestion() {
		return qQuestion;
	}
	public void setqQuestion(String qQuestion) {
		this.qQuestion = qQuestion;
	}
	public String getqType() {
		return qType;
	}
	public void setqType(String qType) {
		this.qType = qType;
	}
}
