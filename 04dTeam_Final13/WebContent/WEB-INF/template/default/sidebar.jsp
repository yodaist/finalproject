<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources" />
<c:set var="ctrpath" value="${pageContext.request.contextPath}" />

<div class="side_menu">
	<div>
		<ul>
			<li><a href="${ctrpath}/main"> <img
					src="${path}/img/tour_logo1.png" alt=""
					onmouseover="this.src='${path}/img/tour_logo2.png'"
					onmouseout="this.src='${path}/img/tour_logo1.png'">
			</a></li>
			<li><a href="${ctrpath}/popupTest"
				title="GPT3�� �̿��� AI������ �����̵� �������!"
				onclick="window.open(this.href,'_blank','width=800,height=600,toolbars=no,scrollbars=yes'); return false;">AI
					ê��</a></li>
			<li><a href="${ctrpath}/popupMemo"
				onclick="window.open(this.href,'_blank','width=800,height=600,toolbars=no,scrollbars=yes'); return false;">�޸���</a></li>
			<li><a href="#">�޴�4</a></li>
			<li><a href="#">�޴�5</a></li>
		</ul>
	</div>
</div>
