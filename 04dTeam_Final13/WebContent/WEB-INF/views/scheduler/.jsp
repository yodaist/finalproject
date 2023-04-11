<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}/resources" />
<c:set var="ctrpath" value="${pageContext.request.contextPath}" />

<style>
.center {
	text-align: center;
}

th {
	background-color: aliceblue;
}

h3 {
	color: #6495ed;
}

table {
	border-collapse: collapse;
	width: 70%;
}
</style>

<!-- ================================================== -->

<div>
	<h3 align="center">${sessionScope.sessionName}���� �����ٷ�</h3>
	<table class="table">
		<tr>
			<th>��ȣ</th>
			<th>����</th>
			<th>�������</th>

		</tr>
		<c:forEach var="e" items="${list }">
			<tr>
				<td>${e.scno}</td>
				<td>${e.sclist }</td>
				<td>${e.scdate }</td>

			</tr>
		</c:forEach>
	</table>
</div>

<br>

