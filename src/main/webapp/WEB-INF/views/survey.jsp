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
<title>${surveyView.sTitle}</title>
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
	<div class = "controller">
		<div class ="row">
		<div id = "survey">
			<table class="table table-striped" style="text-align:left; width:840px">
				<thead>
					<tr>
						<td style="height:50px; font-size:25px;"><STRONG>${surveyView.sTitle}</STRONG>
					</tr>
					<tr>
						<th colspan="2" align="center" style="height: 1px; background-color : rgb(0,0,0);" ></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th colspan="2" align="center" style="height: 20px; background-color : rgb(255,255,255); color:white;" ></th>
					</tr>
					<tr id="content" valign="top" style="border-top-color: rgb(100, 100, 100); border-top-width: 15px">
						<td colspan="3">${surveyView.sDescription }</td>
					</tr>
					<tr>
						<th colspan="2" align="center" style="height: 0.25px; background-color : rgb(0,0,0);"></th>
					</tr>
				</table>
					<div class="row">
						<table class="table table-striped" style="text-align :center; border: 1px solid #dddddd">
							<tbody>
								<c:forEach items="${questionList}" var="question">
								<input type="hidden" name="qId" value="${question.qId}">
								<tr>
									<td style="width: 20%" align="left"><strong>${question.qQuestion}</strong></td>
								</tr>
									<c:choose>
									<c:when test="${question.qType == 'radio'}">
											<tr>
											<td>
										<c:forEach items="${itemList}" var="item">
											<c:if test="${question.qId == item.qId}">
											<input type="radio" name="${item.qId}" value="${item.iId}" class="answernum">${item.iItem}
											<input type="hidden" value="${question.qType}">
											<input type="hidden" value="${question.sId}">
											<input type="hidden" value="${question.qId}">
											</c:if>
										</c:forEach>
											</td>
											</tr>
									</c:when>
									<c:when test="${question.qType == 'checkbox'}">
										<tr>
										<td>
										<c:forEach items="${itemList}" var="item">
											<c:if test="${question.qId == item.qId}">
											 <input type="checkbox" value="${item.iId}" class="answernum">${item.iItem}
											 <input type="hidden" value="${question.qType}">
											 <input type="hidden" value="${question.sId}">
											 <input type="hidden" value="${question.qId}">
											</c:if>
										</c:forEach>
										</td>
										</tr>
									</c:when>
									<c:when test="${question.qType == 'dropdown'}">
										<tr>
										<td>
										<select id="${question.qId}" name="${question.qId}">
										<c:forEach items="${itemList}" var="item">
										<c:if test="${question.qId == item.qId}">
												<option value = "${item.iId}" label = "${item.iItem}" class="answernum"></option>
												<option value="${question.qType}" hidden></option>
												<option value="${question.sId}" hidden></option>
												<option value="${question.qId}" hidden></option>
										</c:if>
										</c:forEach>
										</select>
										</td>
										</tr>
									</c:when>
									<c:when test="${question.qType == 'textbox'}">
										<tr>
										<td>
											<input type="text" style="width: 700px; height: 20px; font-size: 15px;" placeholder="답변 입력" name = "aContent" class="answerstring">
											<input type="hidden" value="${question.qType}">
											<input type="hidden" value="${question.sId}">
											<input type="hidden" value="${question.qId}">
										</td>
										</tr>
									</c:when>
									</c:choose>
								</c:forEach>
						</tbody>
					</table>
				<input type="submit" class="submit" value="등록">
			</div>
		</div>
	</div>
</div>
<script>
$(document).on('click', '.submit', function () {
	let answer = {
			answernumlist : [],
			answerstringlist : []
	}
	
	$(".answerstring").each(function(index) {
		let answerstring = {};
		
		answerstring.qType = $(this).next().val();
		answerstring.sId = $(this).next().next().val();
		answerstring.qId = $(this).next().next().next().val();
		answerstring.aContent = $(this).val();
		
		answer.answerstringlist.push(answerstring);
	});
	
	$("input.answernum:checked").each(function(index) {
		let answernum = {};
		
		answernum.qType = $(this).next().val();
		answernum.sId = $(this).next().next().val();
		answernum.qId = $(this).next().next().next().val();
		answernum.aContent = $(this).val();
		
		answer.answernumlist.push(answernum);
	});
	
	$("option.answernum:selected").each(function(index) {
		let answernum = {};
		
		answernum.qType = $(this).next().val();
		answernum.sId = $(this).next().next().val();
		answernum.qId = $(this).next().next().next().val();
		answernum.aContent = $(this).val();
		
		answer.answernumlist.push(answernum);
	});
	let answerresult = JSON.stringify(answer);
	console.dir(answer);
	
	$.ajax({
		method: "POST",
		contentType: 'application/json',
		url : "/surveyaction",
		data: answerresult,
		success: function(data) {
			let url = "/";
			location.replace(url);
		}
	})
});
</script>
</body>
</html>