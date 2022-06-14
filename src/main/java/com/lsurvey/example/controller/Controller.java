package com.lsurvey.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;



import com.lsurvey.example.service.SurveyService;
import com.lsurvey.example.domain.Survey;
import com.lsurvey.example.domain.Answer;
import com.lsurvey.example.domain.Item;
import com.lsurvey.example.domain.Question;
import com.lsurvey.example.domain.Result;

@org.springframework.stereotype.Controller
public class Controller {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired SurveyService surveyservice;
	
	@RequestMapping("/")
	public String home(Model model, Authentication authentication, Survey survey) throws Exception {
		logger.debug("debug");
	    logger.info("info");
	    logger.error("error");
	    
	   List<Survey> list = surveyservice.selectSurveyList(survey);
	    model.addAttribute("list", list);
		return "/index";
	}
	
	@RequestMapping("/write")
	public String write(Model model,Authentication authentication) {
		return "/write";
	}
	
	@PostMapping("/writeaction")
	public String writeAction(Model model, Authentication authentication, @RequestBody Survey survey) throws Exception {
		surveyservice.surveyInsert(survey);
		return "/index";
	}
	
	@RequestMapping("/survey/{sId}")
	public String survey(Model model, Authentication authentication, Survey survey, Question question, Item item, @PathVariable int sId) throws Exception {
		Survey surveyView = surveyservice.surveyView(survey);
		model.addAttribute("surveyView", surveyView);
		List<Question> questionList = surveyservice.selectQuestionList(question);
		model.addAttribute("questionList", questionList);
		List<Item> itemList = surveyservice.selectItemList(item);
		model.addAttribute("itemList", itemList);
		return"/survey";
	}
	
	@PostMapping("/surveyaction")
	public String surveyAction(Model model, Authentication authentication, @RequestBody Answer answer) throws Exception {
		surveyservice.surveyAction(answer);
		return "/index";
	}
	
	@RequestMapping("/result/{sId}")
	public String result(Model model, Authentication authentication, Survey survey, Question question, Answer answer, Result result, @PathVariable int sId) throws Exception {
		Survey surveyView = surveyservice.surveyView(survey);
		List<Question> questionList = surveyservice.selectQuestionList(question);
		model.addAttribute("questionList", questionList);
		model.addAttribute("surveyView", surveyView);
		List<Result> resultlist = surveyservice.getResult(survey);
		int tmp = resultlist.get(0).getrIdx();
		for(int i = 1; i < resultlist.size(); i++) {	
			  if(tmp == resultlist.get(i).getrIdx()) {
				  resultlist.remove(i);
				  i--;
			  } else {
				  tmp = resultlist.get(i).getrIdx();
			  }	  
		  }
		
		model.addAttribute("resultlist", resultlist);
		return "/result"; 
	}
	
		
	@RequestMapping("/get/chart/data")
	@ResponseBody
	   public Map<Integer, List<List<String>>> getChartData(Model model, Survey survey,Question question) { 
		   /* List<HashMap<Integer, ArrayList<Result>>> list2 = new ArrayList<>(); */
		   List<Result> resultlist = surveyservice.getResultChart(survey);
		  /* List<Result> resultlist2 = surveyservice.getResult(survey);
		   ArrayList<Result> list;
		   Result result; */
		   
		   Map<Integer, List<List<String>>> map = new HashMap<Integer, List<List<String>>>();
		   for (Result rs : resultlist) {
			   if (map.get(rs.getrQidx()) != null) {
				   List<List<String>> qList = (List<List<String>>)map.get(rs.getrQidx());
				   
				   List<String> rList = new ArrayList<String>();
				   rList.add(rs.getrItem1());
				   rList.add(Integer.toString(rs.getrCount()));
				   
				   qList.add(rList);
				   map.put(rs.getrQidx(), qList);
			   } else {
				   // 안쪽리스트
				   List<String> rList = new ArrayList<String>();
				   rList.add(rs.getrItem1());
				   rList.add(Integer.toString(rs.getrCount()));
				   
				   // 바깥쪽리스트
				   List<List<String>> qList = new ArrayList<List<String>>();
				   qList.add(rList);
				   
				   // 맵
				   map.put(rs.getrQidx(), qList);
			   }
		   }
		   return map;
	}

		 /*  int tmp = resultlist2.get(0).getrIdx();
	   	   for(int i = 1; i < resultlist2.size(); i++) {	
			  if(tmp == resultlist2.get(i).getrIdx()) {
				  resultlist2.remove(i);
				  i--;
			  } else {
				  tmp = resultlist2.get(i).getrIdx();
			  }	  
		  }
	   	   
	   	   for(int j = 0; j < resultlist2.size(); j++) {   		
	   		   if(resultlist2.get(j).getrKind().equals("textbox")) {
	   			   resultlist2.remove(j);
	   			   j--;
	   		   }  
		   }

	   	   for(int i = 0; i < resultlist2.size(); i++) {
	   		   list = new ArrayList<>();
	   		   for(int j = 0; j < resultlist.size(); j++) {
	   			   if(resultlist2.get(i).getrIdx() == resultlist.get(j).getrIdx()) {
	   				   HashMap<Integer, ArrayList<Result>> map = new HashMap<>();
	   				   result = new Result();   				  
	   				   result.setrCount(resultlist.get(j).getrCount());
	   				   result.setrItem1(resultlist.get(j).getrItem1());
	   				   list.add(result);
	   				   map.put(resultlist2.get(i).getrQidx(), list);
	   				   list2.add(map);
	   		   		}
	   		   }  
	   	   }   	   
	       return list2;
	   } */
}
