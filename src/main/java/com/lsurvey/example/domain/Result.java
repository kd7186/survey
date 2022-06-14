package com.lsurvey.example.domain;

public class Result {
	private int rIdx;
	private int rQidx;
	private int rIidx;
	private String rKind;
	private String rQuestion;
	private String rItem1;
	private String rItem2;
	private int rCount;
	
	public int getrIdx() {
		return rIdx;
	}
	public void setrIdx(int rIdx) {
		this.rIdx = rIdx;
	}
	public int getrQidx() {
		return rQidx;
	}
	public void setrQidx(int rQidx) {
		this.rQidx = rQidx;
	}
	public String getrKind() {
		return rKind;
	}
	public void setrKind(String rKind) {
		this.rKind = rKind;
	}
	public String getrQuestion() {
		return rQuestion;
	}
	public void setrQuestion(String rQuestion) {
		this.rQuestion = rQuestion;
	}
	public String getrItem1() {
		return rItem1;
	}
	public void setrItem1(String rItem1) {
		this.rItem1 = rItem1;
	}
	public String getrItem2() {
		return rItem2;
	}
	public void setrItem2(String rItem2) {
		this.rItem2 = rItem2;
	}
	public int getrCount() {
		return rCount;
	}
	public void setrCount(int rCount) {
		this.rCount = rCount;
	}
	@Override
	public String toString() {
		return "Result [rKind=" + rKind+ ", rQidx=" + rQidx+ ", rQuestion=" + rQuestion + ", rItem1=" + rItem1 + ", rCount=" + rCount + ", rItem2="
				+ rItem2 + "]";
	}
}
