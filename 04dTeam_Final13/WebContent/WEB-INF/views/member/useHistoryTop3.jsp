<%@page import="kr.co.kosmo.mvc.vo.BookVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
			<div class="green name">${sessionScope.sessionName}�� �̿볻��</div>
		</div>
		<div class="modify"></div>
	</div>
	<!-- ================================================== -->
	<div class="shippingStatusContainer">
		<div class="status">
			<div class="item">
				<div>
					<div class="green number">${bvo.bookcnt }</div>
					<div class="text">�� ���� Ƚ��</div>
				</div>
				<div class="icon">></div>
			</div>
			<div class="item">
				<div>
					<div class="green number"><fmt:formatNumber value="${bvo.charge.total }" pattern="###,###" /></div>
					<div class="text">�� �̿� �ݾ�</div>
				</div>
				<div class="icon">></div>
			</div>
			<div class="item">
				<div>
					<div class="number"><fmt:formatNumber value="${bvo.charge.maxpay}" pattern="###,###" /></div>
					<div class="text">�ִ� �̿� �ݾ�</div>
				</div>
				<div class="icon">></div>
			</div>
			<div class="item">
				<div>
					<div class="number">����</div>
					<div class="text">�ִ� �湮 ����</div>
				</div>
				<div class="icon">></div>
			</div>
		</div>

	</div>
	<!-- ================================================== -->
	<div class="shippingStatusContainer">
		<div class="title">�ֱ� �̿� ����</div>
		<table border="1" align="center"
			style="width: 100%; text-align: center;">
			<tr>
				<th>���� �Ͻ�</th>
				<th>���� �Ͻ�</th>
				<th>���� ����</th>
				<th>�̿� ����</th>
				<th>���� ���</th>
			</tr>
			<c:forEach var="e" items="${blist}">
				<tr>
					<td>${e.bdate }</td>
					<td>${e.sdate }~${e.edate }</td>
					<td>${e.local.larea }</td>
					<td>${e.local.ltitle }</td>
					<td>${e.charge.chtype }</td>
				</tr>
			</c:forEach>
		</table>
		<div class="container mt-3" align="center">
			<a href="UseHistoryList?mnum=${sessionScope.sessionNum}&chk=2"><button
					type="button">�� ����</button></a>
		</div>
	</div>

	<!-- ================================================== -->
</div>