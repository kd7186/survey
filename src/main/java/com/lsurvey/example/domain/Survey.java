package com.lsurvey.example.domain;

import java.util.List;

public class Survey {
	private int sId;
	private String sTitle;
	private String sDescription;
	private int getNext;
	private List<Question> questions;
	
	public List<Question> getQuestions() {
		return questions;
	}
	public void setQuestions(List<Question> questions) {
		this.questions = questions;
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
	public String getsTitle() {
		return sTitle;
	}
	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}
	public String getsDescription() {
		return sDescription;
	}
	public void setsDescription(String sDescription) {
		this.sDescription = sDescription;
	}
}
