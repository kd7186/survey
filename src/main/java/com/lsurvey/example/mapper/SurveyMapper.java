package com.lsurvey.example.mapper;

import com.lsurvey.example.domain.Answer;
import com.lsurvey.example.domain.Item;
import com.lsurvey.example.domain.Question;
import com.lsurvey.example.domain.Result;
import com.lsurvey.example.domain.Survey;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SurveyMapper {
	
	public List<Survey> selectSurveyList(Survey survey);
	public void surveyInsert(Survey survey);
	public void questionInsert(Question question);
	public void itemInsert(Item item);
	public Survey surveyView(Survey survey);
	public List<Question> selectQuestionList(Question question);
	public List<Item> selectItemList(Item item);
	public void saveAnswerNum(Answer answer);
	public void saveAnswerString(Answer answer);
	public List<Result> getResultNum(Survey survey);
	public List<Result> getResultString(Survey survey);
}

