<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources" />
<c:set var="ctrpath" value="${pageContext.request.contextPath}" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<<link rel="stylesheet" href="${path}/css/surveyForm.css" rel="stylesheet" />
<div class="header-line">���� ����</div>
<div class="section_form">
  <form id="consultation-form" class="feed-form" method="post" action="addsurvey">
    
    <input required="required" placeholder="����" type="text" name="sub" id="sub">
    <input name="code" type="number" id="code" min="2" max="5" value="" onchange="increTitle()" required="required" placeholder="���׼�">
    <input name="surveytitle" required="required" placeholder="����1" type="text">
    <input name="surveytitle" required="required" placeholder="����2" type="text">
    

   <div class="button_options">
    <button class="button_submit" type="submit">�ۼ�</button>
    <button class="button_submit" type="button" onclick="location="'surveyList'>���</button>
    </div>
  </form>
</div>

<div class="floating-container">
  <div class="floating-button">Ȩ</div>
  <div class="element-container">
  </div>
</div>

<script>/*
	function increTitle() {
		var code = document.getElementById("code").value;
		var html = "<table style=\"border-collapse: collapse; width: 100%; margin: auto\">";
		for (var i = 1; i < code - 1; i++) {
			html += "<tr><th>��������" + (i + 2) + "</th>";
			html += "<td><input type=\"text\" name=\"surveytitle\"></td></tr>";
		}
		html += "</table>";
		document.getElementById("target").innerHTML = html;
	} */
</script>