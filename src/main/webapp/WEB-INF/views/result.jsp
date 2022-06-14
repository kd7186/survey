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
<title>설문 결과</title>
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
						<c:forEach items="${questionList}" var="question" varStatus="status">
								<input type="hidden" name="qId" value="${question.qId}">
								<tr>
									<td style="width: 20%" align="left"><strong>${question.qQuestion}</strong></td>
								</tr>
							<c:forEach items="${resultlist}" var="result" varStatus="status">
								<c:if test="${question.qId == result.rQidx}">
									<c:choose>
										<c:when test="${result.rKind == 'textbox'}">
											<p>${result.rItem2}</p>
										</c:when>
										<c:when test="${result.rKind == 'radio' ||  result.rKind == 'checkbox' || result.rKind == 'dropdown'}">
											<p>${result.rItem1} : ${result.rCount} 명</p>
										</c:when>
									</c:choose>
								</c:if>
							</c:forEach>
							<c:if test="${question.qType =! 'textbox'}">
							<div id="chart_div${question.qId}" style="width: 800px; height: 500px;"></div>
							</c:if>
					</c:forEach>
				</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
	
function drawChart() {
	
		 $.ajax({
			type : "GET",
			url : "/get/chart/data",
			data : {
				sId : ${survey.sId}
			},
			success: function (data) {
				
			let index = 0;	
	
			for(var key in data) {
					console.dir(data);
					var data2 = new google.visualization.DataTable();
				    data2.addColumn('string', 'Answer');
				    data2.addColumn('number', 'Count');
				    
					let tmpData = null;
					for (itemInfo of data[key]) {
							itemInfo[1] = Number(itemInfo[1]); 
						}
						tmpData = data[key];
						console.dir(tmpData);

						
					data2.addRows(
							tmpData
					);
					
					var options = {
					  	title: 'RESULT'
					};
					
					console.log(key);
					
					var chart = new google.visualization.PieChart(document.getElementById("chart_div"+key));	
					chart.draw(data2, options);
				}
			}
	}); 
}
</script>
</body>
</html>