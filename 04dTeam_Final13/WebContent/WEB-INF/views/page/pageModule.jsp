<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%-- Start! --%>
	<c:set var="pageurl" value="?nowPage" />
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:choose>
				<c:when test="${endPage <= pagePerBlock }">
					<li class="page-item disabled"><a class="page-link">Previous</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item active"><a class="page-link"
						href="${pageurl }=${startPage - 1 }">Previous</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach varStatus="i" begin="${startPage }" end="${endPage }"
				step="1">
				<c:choose>
					<c:when test="${i.index == nowPage }">
						<li class="page-item active"><a class="page-link" href="">${i.index }</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="${pageurl }=${i.index }">${i.index }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${endPage >= totalPage }">
					<li class="page-item disabled"><a class="page-link">Next</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item active"><a class="page-link"
						href="${pageurl }=${endPage + 1 }">Next</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
	<%-- End ! --%>
</body>
</html>