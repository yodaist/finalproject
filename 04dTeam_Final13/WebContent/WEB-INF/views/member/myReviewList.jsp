<%@page import="kr.co.kosmo.mvc.vo.BookVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources" />
<c:set var="ctrpath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/css/myPageUI.css" rel="stylesheet" />
<link rel="stylesheet" href="${path}/css/buttonEff.css" rel="stylesheet" />
<link rel="stylesheet" href="${path}/css/myPageRankHover.css"
	rel="stylesheet" />
<div class="wrap" style="max-width: 1000px; margin: 0 auto;">

	<!-- ================================================== -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- ================================================== -->

	<div class="pinkContainer">
		<div>
			<div class="grade">
				<figure>
					<img src="${path}/rankimg/boltstone.png" height="40px" width="45px"
						id="gradeimg">
				</figure>
			</div>
			<div class="green name">${sessionScope.sessionName}�� ���䳻��</div>
		</div>
		<div class="modify"></div>
	</div>
	<!-- ================================================== -->
	<div class="shippingStatusContainer">
		<div class="status">
			<div class="item">
				<div>
					<div class="green number">${rcnt }</div>
					<div class="text">���� ����</div>
				</div>
				<div class="icon">></div>
			</div>
			<div class="item">
				<div></div>
			</div>
			<div class="item">
				<div></div>
			</div>
		</div>

	</div>
	<!-- ================================================== -->
	<div class="shippingStatusContainer">
		<div class="title">���� ���</div>
		<table border="1" align="center"
			style="width: 100%; text-align: center;">
			<tr>
				<th>��ȣ</th>
				<th>�� ����</th>
				<th>����</th>
				<th>�ۼ���¥</th>
				<th>����</th>
				<th colspan="2">����</th>
			</tr>
			<c:forEach var="e" items="${listReview}">
				<c:set var="index" value="${index + 1}" />
				<tr>
					<td>${index}</td>
					<td>${e.retitle}</td>
					<td>${e.recontent}</td>
					<td>${e.redate}</td>
					<td>${e.star}��</td>
					<td><a href="#">
							<button type="button">����</button>
					</a></td>
					<td><a href="#">
							<button type="button">����</button>
					</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!-- ================================================== -->
</div>