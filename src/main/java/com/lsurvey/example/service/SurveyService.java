package com.lsurvey.example.service;


import java.util.List;

import com.lsurvey.example.domain.Answer;
import com.lsurvey.example.domain.Item;
import com.lsurvey.example.domain.Question;
import com.lsurvey.example.domain.Result;
import com.lsurvey.example.domain.Survey;
import com.lsurvey.example.service.SurveyService;

public interface SurveyService {
	static SurveyService service= null; 
	
	public List<Survey> selectSurveyList(Survey survey);
	public void surveyInsert(Survey survey);
	public Survey surveyView(Survey survey);
	public List<Question> selectQuestionList(Question question);
	public List<Item> selectItemList(Item item);
	public void surveyAction(Answer answer);
	public List<Result> getResult(Survey survey);
	public List<Result> getResultChart(Survey survey);
}
