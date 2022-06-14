package com.lsurvey.example.domain;

public class AnswerString {
	
	private int aId;
	private int sId;
	private int qId;
	private String qType;
	private String aContent;
	
	public int getaId() {
		return aId;
	}
	public void setaId(int aId) {
		this.aId = aId;
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
	public String getqType() {
		return qType;
	}
	public void setqType(String qType) {
		this.qType = qType;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
}
