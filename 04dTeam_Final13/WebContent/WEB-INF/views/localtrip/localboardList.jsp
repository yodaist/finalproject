<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 2023. 1. 19. / Kosmo -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}/resources" />
<c:set var="ctrpath" value="${pageContext.request.contextPath}" />

<script>
	$.ajaxSetup({
		cache : false
	});

	$.ajax({
	url: "../reviewRest/getavg?recode="+${vo.lno},
	success: function (json) {
		console.log("별점: " + json);
		if(json !== null){
			$('#starAvg').html(json +"점");
		} else if(json === null) {
			$('#starAvg').html("아직 평가가 없어요!");
		}
		
		}
	});
</script>

<!-- carousel : 이벤트/기획.. -->
<div class="slider_area">
	<div class="slider_active owl-carousel">
		<div
			class="single_slider  d-flex align-items-center slider_bg_1 overlay">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-xl-12 col-md-12">
						<div class="slider_text text-center">
							<c:choose>
								<c:when test="${sessionScope.sessionID == null }">
									<h3>welcome!</h3>
								</c:when>
								<c:when test="${sessionScope.sessionID != null }">
									<h3>FOR YOU!</h3>
									<br>
									<p>[${sessionScope.sessionName}]님, 설문조사에 참여하면 포인트를 적립해
										드립니다!</p>
									<a href="${ctrpath}/survey/surveyList" class="boxed-btn3">설문조사
										바로가기</a>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div
			class="single_slider  d-flex align-items-center slider_bg_2 overlay">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-xl-12 col-md-12">
						<div class="slider_text text-center">
							<c:choose>
								<c:when test="${sessionScope.sessionID == null }">
									<h3>Local Trip</h3>
								</c:when>
								<c:when test="${sessionScope.sessionID != null }">
									<h3>Local Trip</h3>
									<br>
									<p>[${sessionScope.sessionName}]님, MBTI 테스트 해보셨나요? 지금 바로 참여해보세요!</p>
									<a href="${ctrpath}/survey/surveyList" class="boxed-btn3">여행 MBTI 테스트</a>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div
			class="single_slider  d-flex align-items-center slider_bg_3 overlay">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-xl-12 col-md-12">
						<div class="slider_text text-center">
							<c:choose>
								<c:when test="${sessionScope.sessionID == null }">
									<h3>Enjoyment</h3>
								</c:when>
								<c:when test="${sessionScope.sessionID != null }">
									<h3>Enjoyment</h3>
									<br>
									<p>[${sessionScope.sessionName}]님, 설문조사에 참여하면 포인트를 적립해
										드립니다!</p>
									<a href="${ctrpath}/survey/surveyList" class="boxed-btn3">설문조사
										바로가기</a>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<!-- carousel : slider_area_end -->
<!-- recommen -->
<div class="popular_places_area">
	<div class="container">
		<div class="row">

			<c:forEach var="e" items="${list}">
				<div class="col-lg-4 col-md-6">
					<div class="single_place">
						<div class="thumb">
							<img src="${path}/imgfile/${e.limg}" height="300" width="200">
							<a href="#" class="prise">$<fmt:formatNumber value="${e.lprice}" pattern="###,###" /></a>
						</div>
						<div class="place_info">
							<a href="localdetail?num=${e.lno}"><h3>${e.ltitle}</h3></a>
							<p>${e.lcontent}</p>
							<div class="rating_days d-flex justify-content-between">
								<span class="d-flex justify-content-center align-items-center">
									<!-- 별점(평균) id="starAvg" --> <i
									class="fa fa-star"></i>
									<a href="#">${e.starAvg}/5</a>
								</span>
								<div class="days">
									<!-- 리뷰(개수) id="reviewCnt" --> <a
									href="#">(${e.renoCnt} Review)</a>
								</div>
								<!--  
								<div class="days">
									<i class="fa fa-clock-o"></i> <a href="#">5 Days</a>
								</div>
								-->
							</div>
						</div>
					</div>
				</div>
			</c:forEach>



		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="more_place_btn text-center">
					<a class="boxed-btn4" href="#">More Places</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- recommen -->

<!-- reviewDetail : recent_trip_area  -->
<div class="recent_trip_area">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<div class="section_title text-center mb_70">
					<h3>Recent Trips</h3>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="single_trip">
					<div class="thumb">
						<img src="${path}/img/trip/1.png" alt="">
					</div>
					<div class="info">
						<div class="date">
							<span>Oct 12, 2019</span>
						</div>
						<a href="#">
							<h3>Journeys Are Best Measured In New Friends</h3>
						</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="single_trip">
					<div class="thumb">
						<img src="${path}/img/trip/2.png" alt="">
					</div>
					<div class="info">
						<div class="date">
							<span>Oct 12, 2019</span>
						</div>
						<a href="#">
							<h3>Journeys Are Best Measured In New Friends</h3>
						</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="single_trip">
					<div class="thumb">
						<img src="${path}/img/trip/3.png" alt="">
					</div>
					<div class="info">
						<div class="date">
							<span>Oct 12, 2019</span>
						</div>
						<a href="#">
							<h3>Journeys Are Best Measured In New Friends</h3>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- reviewDetail : recent_trip_area  -->