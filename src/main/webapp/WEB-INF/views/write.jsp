<%@page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta charset="UTF-8">
<title>설문 조사</title>
<style>
*{margin 4px 0;}
.controller { padding:25px 0; margin: auto; width:840px;}
#wriTitle{text-align: center; background-color: #2b2b2b; width:850px; height: 25px; padding:12px 0; color: white;}
table { width:840px; margin:25px 0; padding:25px; border-collapse:collapse;}
#title{width : 700px; height: 25px; font-size: 20px;}
textarea{width: 700px; height: 20px; font-size: 15px;}
.button {margin : 4px 0; padding: 10px 0; width: 100px; background-color: #000000; color : white; border: none;}
button {align: center; margin : 4px 0; padding: 10px 0; width: 100px; background-color: #a34654; color : white; border: none;}
textarea {resize:none;}
	nav {
  display: flex;
 justify-content: space-around;
  align-items: center;
  background-color: #404040;
  color: white;
  margin : 0;
  padding : 0;
}

	nav ul li{
		display : inline-block;
	}
	
	.logo {
	letter-spacing:2px;
	font-size : 15px;
	text-align : left;
	float : center;
	}
	
	.logo a {
	color:white;
	padding : 16px 16px;
	}
	
	.dropdown {
		position : relative;
	}
	
	.dropdown-menu {
		color : white;
		font-size: 16px;
	}
	
	.dropdown-content {
			position: absolute;
   			 background-color: #f9f9f9;
    		min-width: 160px;
    		box-shadow: 0px 8px 24px 0px rgba(0,0,0,0.2);
    		display: none;
	}
	
	.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}   

	.dropdown-menu:hover:not(.home){
    background-color:#7a7a7a ;
    color: white;
}

	.dropdown:hover .dropdown-content {
    display: block;
}

	.dropdown-content a:hover {background-color: #f1f1f1}
</style>
</head>
<body>
			<nav>
			<div class="logo">
				<h3><a href="/">SURVEY</a></h3>
			</div>
				<ul>
					<li class="dropdown">
						<div class="dropdown-menu">MENU</div>
						<div class="dropdown-content">
							<a href="/">설문지</a>
						</div>
					</li>
				</ul>
		</nav>
	<div class="controller">
		<div id="wriTitle" ><b>설문지 작성</b></div>
	<div>
		<div class="survey">
			<textarea id="sTitle" placeholder="제목" required id = "title" style= "width : 840px; height: 40px; font-size: 35px;"></textarea>
			<textarea rows="12" cols="50" style= "width : 840px; height: 150px; font-size: 20px;" placeholder="내용" id="sDescription" required></textarea>
			<div class="question">
				<hr width = "100%" color = "black">
				<input type="text" class="qQuestion" placeholder="질문을 입력하세요" required id = "title" />
				<select class="sType" name="qType" id="qType" style="height : 30px; font-size : 20px">
						<option value = "radio" label = "객관식질문"></option>
						<option value = "textbox" label = "주관식질문"></option>
						<option value = "checkbox" label = "체크박스"></option>
						<option value = "dropdown" label = "드롭박스"></option>
				</select>
				<div class="itemList">
					<div class="itemA">
						<textarea rows="12" cols="50" placeholder="내용을 입력하세요" class="iItem" required></textarea>
						<input type="button" style="width: 20px; height:20px; border: none; background-color: #b00000; color : white;" class="btn-primary pull btnDelete" value="X">
						<input type="button" style="width: 20px; height:20px; border: none; background-color: #000000; color : white;" class="btn-primary pull btnAdd" value="+">
					</div>
				</div>
				<div class="buttonList">
					<input type="button" style="width: 100px; height:50px; border: none; background-color: #000000; color : white;" class="btn-primary pull btnQadd" value="질문추가">
					<input type="button" style="width: 100px; height:50px; border: none; background-color: #000000; color : white;" class="btn-primary pull btnQdelete" value="질문삭제">
				</div>
			</div>
		</div>
		<button type="button" style="width: 100px; height:50px; border: none; background-color: #000000; color : white;" class="submit">설문등록</button>
	</div>
</div>
	<script>
	$(document).on('change', '.sType', function() {
			var result = $(this).val();
			if (result != 'textbox') {
				$(this).next().show();
			} else {
				$(this).next().hide();
			}
		});
	$(document).on('click', '.btnAdd', function () {
		$(this).parent().after('<div class="itemA"><textarea rows="12" cols="50" placeholder="내용을 입력하세요" class="iItem" required></textarea> <input type="button" style="width: 20px; height:20px; border: none; background-color: #b00000; color : white;" class="btn-primary pull btnDelete" value="X"> <input type="button" style="width: 20px; height:20px; border: none; background-color: #000000; color : white;" class="btn-primary pull btnAdd" value="+"></div>');
	});
	$(document).on('click','.btnDelete', function () {
		if ($('.itemA').length > 1) {
			$(this).parent().remove();
			console.log('삭제');
		}
	});
	$(document).on('click', '.btnQadd', function () {
		$(this).parent().before('<div class="question"> <hr width = "100%" color = "black"> <input type="text" class="qQuestion" placeholder="질문을 입력하세요" required id = "title" /> <select class="sType" name="qType" id="qType" style="height : 30px; font-size : 20px"><option value = "radio" label = "객관식질문" selected></option><option value = "textbox" label = "주관식질문"></option> <option value = "checkbox" label = "체크박스"></option> <option value = "dropdown" label = "드롭박스"></option> </select> <div class="itemList"> <div class="itemA"> <textarea rows="12" cols="50" placeholder="내용을 입력하세요" class="iItem" required></textarea> <input type="button" style="width: 20px; height:20px; border: none; background-color: #b00000; color : white;" class="btn-primary pull btnDelete" value="X"><input type="button" style="width: 20px; height:20px; border: none; background-color: #000000; color : white;" class="btn-primary pull btnAdd" value="+"></div></div>');
	});
	$(document).on('click', '.btnQdelete', function () {
		if ($('.question').length > 1) {
			$(this).parent().prev().remove();
			console.log('삭제');
		}
	});
	
	$(document).on('click', '.submit', function () {
		let sTitle = $("textarea#sTitle").val();
		let sDescription = $("textarea#sDescription").val();
		let questions = [];
		$('.question').each(function (){
			let qQuestion = $(this).find('.qQuestion').val();
			let qType = $(this).find("select[name=qType]").val();
			let items = [];
			$(this).children('.itemList').find('.itemA').each(function() {
				let iItem = $(this).find('.iItem').val();
				let itemList = {
					iItem : iItem
				}
				items.push(itemList);
			});
			let q = {
					qQuestion : qQuestion,
					qType : qType,
					items : items
			}
			questions.push(q);
		});
		let survey = {
				sTitle : sTitle,
				sDescription : sDescription,
				questions : questions
			};
		let surveyresult = JSON.stringify(survey);
		console.dir(survey);
		$.ajax({
				method : "POST",
				contentType: 'application/json',
				url : "/writeaction",
				data: surveyresult,
				success: function(data) {
						let url = "/";
						location.replace(url);
				}
		})
	});
	</script>
</body>
</html>