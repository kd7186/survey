package com.lsurvey.example.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lsurvey.example.domain.Answer;
import com.lsurvey.example.domain.Item;
import com.lsurvey.example.domain.Question;
import com.lsurvey.example.domain.Result;
import com.lsurvey.example.domain.Survey;
import com.lsurvey.example.mapper.SurveyMapper;


@Service("SurveyServiceImpl")
public class SurveyServiceImpl implements SurveyService {
	@Autowired SurveyMapper surveymapper;
	
	@Override
	public List<Survey> selectSurveyList(Survey survey) {
		return surveymapper.selectSurveyList(survey);
	}
	
	@Override
	public void surveyInsert(Survey survey) {
		surveymapper.surveyInsert(survey);
		for (Question q : survey.getQuestions()) {
			q.setsId(survey.getGetNext());
			surveymapper.questionInsert(q);
			for (Item i : q.getItems()) {
				i.setsId(q.getsId());
				i.setqId(q.getGetNext());
				surveymapper.itemInsert(i);
			}
		}
	}
	
	@Override
	public Survey surveyView(Survey survey) {
		return surveymapper.surveyView(survey);
	}
	
	@Override
	public List<Question> selectQuestionList(Question question) {
		return surveymapper.selectQuestionList(question);
	}
	
	@Override
	public List<Item> selectItemList(Item item) {
		return surveymapper.selectItemList(item);
	}
	
	@Override
	public void surveyAction(Answer answer) {
		if(answer.getAnswernumlist().size() !=0 ) {
			surveymapper.saveAnswerNum(answer);
		}
		
		if(answer.getAnswerstringlist().size() !=0 ) {
			surveymapper.saveAnswerString(answer);
		}
	}
	
	@Override
	public List<Result> getResult(Survey survey) {
		List<Result> tmpList =new ArrayList <>(surveymapper.getResultNum(survey));
		tmpList.addAll(surveymapper.getResultString(survey));
		
		return tmpList;
	}
	
	@Override
	public List<Result> getResultChart(Survey survey) {
		List<Result> tmpList =new ArrayList <>(surveymapper.getResultNum(survey));
		return tmpList;
	}
}