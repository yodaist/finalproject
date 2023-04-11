<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- 2023. 1. 19. / Kosmo -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#frame {
	max-width: 1500px;
	min-height: 300px;
	margin: 0 auto;
}
</style>
<article>
	<header>
		<h1>공지</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div id="frame">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="e" items="${list}">
					<tr>
						<td>${e.nnum }</td>
						<td>${e.nsub }</td>
						<td>${e.nwriter }</td>
						<!-- <td>1000</td> -->
						<td>${e.ndate}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="5" style="text-align: center;">
						<ul class="pagination" style="margin: 0 auto; width: 35%">
							<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
							<li class="page-item active"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a></li>
						</ul>
					</th>
				</tr>
				<tr>
					<th colspan="5">
						<form class="d-flex">
							<select class="form-control btn-mini" id="sel1"
								style="margin-left: 120px;">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
							</select> <input class="form-control me-2" type="text"
								placeholder="Search.." style="width: 300px">
							<button class="btn btn-outline-secondary" type="button">Search</button>
						</form>
					</th>
				</tr>
				<tr>
					<td colspan="5" style="text-align: right;">
						<!-- 
      jQuery로 글작성 폼으로 이동시키기
      id를 부여하여 선택자로 selector를 사용해서 이동시키기
      footer.jsp에서 작성.
       --> <%-- <button type="button" class="btn btn-outline-secondary" id="wbtn">글작성</button> --%>
						<a href="form">글작성</a>
					</td>
				</tr>

			</tfoot>
		</table>
	</div>

</article>