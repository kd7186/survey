package com.lsurvey.example.domain;

import java.util.List;

public class Answer {
	
	private List<AnswerNum> answernumlist;
	private List<AnswerString> answerstringlist;
	
	public List<AnswerNum> getAnswernumlist() {
		return answernumlist;
	}
	public void setAnswernumlist(List<AnswerNum> answernumlist) {
		this.answernumlist = answernumlist;
	}
	public List<AnswerString> getAnswerstringlist() {
		return answerstringlist;
	}
	public void setAnswerstringlist(List<AnswerString> answerstringlist) {
		this.answerstringlist = answerstringlist;
	}
}
