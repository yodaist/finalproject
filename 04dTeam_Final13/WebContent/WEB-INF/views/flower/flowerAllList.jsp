<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="path" value="${pageContext.request.contextPath}/resources" />
<c:set var="ctrpath" value="${pageContext.request.contextPath}" />


<style>
.center {
	text-align: center;
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
	background-color: #FFB2AF;
	height: 60px;
}

.first{
width: 30px;
}
</style>

<!-- ================================================== -->
<div class="wrap" style="max-width: 1000px; margin: 0 auto;">
	<div class="modify"></div>
	<!-- ================================================== -->
	<div class="shippingStatusContainer">
		<table class="table">
			<thead>
				<tr>
					<th class="first">번호</th>
					<th>축제 이름</th>
					<th>사진</th>
					<th>장소</th>
					<th>일시</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="e" items="${list }">
					<tr>
						<td>${e.fno}</td>
						<td>${e.ftitle }</td>
						<td>${e.fimg }</td>
						<td>${e.flocation }</td>
						<td>${e.fstart }~ ${e.fend }</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>

	</div>
</div>

<br>

