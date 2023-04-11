<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources" />

<style>
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 120;
	font-style: normal;
}

@font-face {
	font-family: 'TTTtangsbudaejjigaeB';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/TTTtangsbudaejjigaeB.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

#frame {
	max-width: 1000px;
	min-height: 300px;
	margin: 0 auto;
}

body {
	font-family: 'Pretendard-Regular';
}

.container {
	justify-content: center;
}

#showimg {
	width: 150px;
	height: 90px;
	border-radius: 15px;
}

h2 {
	font-family: 'TTTtangsbudaejjigaeB';
	font-size: 22px;
	margin-bottom: -60px;
	font-weight: bold;
	color: #3c3c3c;
	font-weight: bold;
}

.btngroup {
	float: right;
	padding-right: 30px;
	margin-bottom: 50px;
}

table {
	width: 90%;
	table-layout: fixed;
	border-radius: 16px;
	border-spacing: 1;
	border-collapse: collapse;
	background: white;
	overflow: hidden;
	text-align: center;
}

thead {
	height: 60px;
	background: #FFED86;
	font-size: 16px;
}

.num {
	width: 100px;
}

/* =============제목============== */
.eight h1 {
	text-align: center;
	text-transform: uppercase;
	font-size: 26px;
	letter-spacing: 1px;
	display: grid;
	grid-template-columns: 1fr auto 1fr;
	grid-template-rows: 16px 0;
	grid-gap: 22px;
}

.eight h1:after, .eight h1:before {
	content: " ";
	display: block;
	border-bottom: 2px solid #ccc;
	background-color: #f8f8f8;
}

h1 {
	position: relative;
	padding: 0;
	margin: 0;
	font-family: "Raleway", sans-serif;
	font-weight: 300;
	font-size: 40px;
	color: #080808;
	-webkit-transition: all 0.4s ease 0s;
	-o-transition: all 0.4s ease 0s;
	transition: all 0.4s ease 0s;
}

h1 span {
	display: block;
	font-size: 0.5em;
	line-height: 1.3;
}

h1 em {
	font-style: normal;
	font-weight: 600;
}

.two h1 {
	text-transform: capitalize;
}

.two h1:before {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 60px;
	height: 2px;
	content: "";
	background-color: #FF9B00;
}

.two h1 span {
	font-size: 13px;
	font-weight: 500;
	text-transform: uppercase;
	letter-spacing: 4px;
	line-height: 3em;
	padding-left: 0.25em;
	color: rgba(0, 0, 0, 0.4);
	padding-bottom: 10px;
}

.alt-two h1 {
	text-align: center;
	margin-bottom: 10px;
}

.alt-two h1:before {
	left: 50%;
	margin-left: -30px;
	margin-bottom: 10px;
}

</style>

<div id="frame">

	<div class="two alt-two">
		<h1>
			My Travel Diary <span>Keep your own diary</span>
		</h1>
	</div>
	<div class="container">

		<table class="table table-borderless">
			<thead>
				<tr>
					<th scope="col" class="num">넘버</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">사진</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="e" items="${list}">
					<tr>
						<td>${e.dno }</td>
						<td><a href="diaryDetail?num=${e.dno}">${e.dtitle }</a></td>
						<td>${e.dwriter }</td>
						<td><img src="${path}/imgfile/${e.dimg }" id="showimg"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="btngroup">
		<a href="../diary/diaryForm"><button type="button" class="btn btn-secondary">글 작성</button></a>
	</div>
</div>

<br>
<br>
<br>