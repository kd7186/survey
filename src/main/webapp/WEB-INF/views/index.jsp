<%@page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문 조사</title>
<style>
.controller {
	padding: 25px 0;
	margin : auto;
	width : 840px;
	text-align: center;
	}
table {
	width: 840px
	padding : 10px 0;
	border-collapse: collapse;
	}
	th {
	background-color : rgb(100,100,100);
	color : white;
	}
	button {
	margin : 4px 0;
	padding: 10px 0;
	width: 100px;
	background-color: #1595a3;
	color : white;
	border: none;
}
	a{
	text-decoration: none;
	color: black;
	}
	a:hover {
		color: #000000;
		text-decoration-line: underline;
		}
		
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
	<table>
	<tr>
	<th width="100px">#</th>
	<th width="540px">Title</th>
	<th width="150px">Result</th>
	</tr>
		<c:forEach items="${list}" var="item">
			<tr style="border-bottom:1px solid gray;">
			<td>${item.sId}</td>
			<td>
				<b><a href="/survey/${item.sId}">${item.sTitle}</a></b>
			</td>
			<td>
				<a href="/result/${item.sId}"><button style="background-color:#808080">결과</button></a>
			</tr>
		</c:forEach>
	</table>
	</div>
	<div align="center">
		<p>
		  <a href="/write"><button style="background-color:#202020">설문지 작성</button></a><br />
		</p>
	</div>
</body>
</html>