<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<style>
#frame {
	max-width: 1500px;
	min-height: 300px;
	margin: 0 auto;
}
</style>

<article>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div id="frame">
		<table class="table">
			<thead>
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>항목</th>
					<th>투표수</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="e" items="${list }">
					<tr>
						<th>${e.num }</th>
						<th><a href="surveyDetail?num=${e.num }">${e.sub }</a></th>
						<th>${e.code }</th>
						<th>${e.surveytotal }</th>
						<th>${e.sdate }</th>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>

				<tr>
					<td colspan="5">
						<%-- Start! --%> <c:set var="pageurl"
							value="?searchType=${searchType}&searchValue=${searchValue}&cPage" />
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<c:choose>
									<c:when test="${startPage <= pagePerBlock }">
										<li class="page-item disabled"><a class="page-link"
											href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item active"><a class="page-link"
											href="${pageurl }=${startPage -1 }" tabindex="-1">Previous</a></li>
									</c:otherwise>
								</c:choose>
								<c:forEach varStatus="i" begin="${startPage }" end="${endPage }"
									step="1">
									<c:choose>
										<c:when test="${i.index == nowPage }">
											<li class="page-item active"><a class="page-link"
												href="#">${i.index}</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item "><a class="page-link"
												href="${pageurl }=${i.index }">${i.index}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<%-- NextPage --%>
								<c:choose>
									<c:when test="${endPage >= totalPage }">
										<li class="page-item"><a href="" class="page-link"
											aria-disabled="true">Next</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item active"><a class="page-link"
											href="${pageurl }=${endPage + 1 }">Next</a></li>
									</c:otherwise>
								</c:choose>

							</ul>
						</nav> <%-- End ! --%>
					</td>
				</tr>










				<tr>
					<th colspan="5">
						<form class="d-flex" method="post" action="upboardList">
							<select class="form-control btn-mini" name="searchType"
								id="searchType" style="margin-left: 120px;">
								<option value="">검색</option>
								<option value="1">제목</option>
								<option value="2">이름</option>
							</select> <input class="form-control me-2" type="text"
								style="width: 300px" name="searchValue" id="searchValue">
							<button class="btn btn-outline-secondary" type="submit">Search</button>
						</form>
					</th>
				</tr>
				<tr>
					<td colspan="5" style="text-align: right;"><c:if
							test="${searchType == 1 or searchType == 2}">
						${totalRecord}개의  게시물에서 <b>${searchValue}</b> 가 검색 되었습니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</c:if></td>
				</tr>



				<tr>
					<th colspan="5">

						<button type="button" class="btn btn-primary" id="writeBtn"
							onclick="location='surveyForm'">등록폼</button>
						<button type="button" class="btn btn-secondary" id="surveyClient">설문참여하기</button>


					</th>
				</tr>
			</tfoot>
		</table>
	</div>
</article>
