<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources" />
<c:set var="ctrpath" value="${pageContext.request.contextPath}" />

<!-- Timer SessionOut Script Start! -->
<script>
	$(function() {
		clearTime(15); // 세션 만료 적용 시간 
		setTimer(); // 문서 로드시 타이머 시작

	});
	
	var initMinute; // 최초 설정할 시간(min)
	var remainSecond; // 남은시간(sec)

	function clearTime(min) { // 타이머 초기화 함수
		initMinute = min;
		remainSecond = min * 60;
	}
	
	function setTimer() { // 1초 간격으로 호출할 타이머 함수 

		// hh : mm 으로 남은시간 표기하기 위한 변수 
		remainMinute_ = parseInt(remainSecond / 60);
		remainSecond_ = remainSecond % 60;

		if (remainSecond > 0) {
			$("#timer").empty();
			$("#timer").append(
					'<a>' + Lpad(remainMinute_, 2) + ":"
							+ Lpad(remainSecond_, 2) + ' 남음</a>'); // hh:mm 표기
			remainSecond--;
			setTimeout("setTimer()", 1000); //1초간격으로 호출
		} else {
			/*세션 종료시 작동할 이벤트*/
			if (${sessionScope.sessionID != undefined}) {
				location = "${ctrpath}/login/logoutProcess";
			}
			//location = "${pageContext.request.contextPath}/web/main";
		}
	}

	function Lpad(str, len) { // hh mm형식으로 표기하기 위한 함수
		str = str + "";
		while (str.length < len) {
			str = "0" + str;
		}
		return str;
	}
</script>
<!-- Timer SessionOut Script End! -->

<header>
	<div class="header-area ">
		<div id="sticky-header" class="main-header-area">
			<div class="container-fluid">
				<div class="header_bottom_border">
					<div class="row align-items-center">
						<div class="col-xl-2 col-lg-2">
							<div class="logo">
								<!-- 멤버or호스트별로 메인홈 적용 -->
								<c:choose>
									<c:when test="${sessionScope.sessionHID != null }">
										<a href="${ctrpath}/hostmain"> <img
											src="${path}/img/tour_logo1.png" alt=""
											onmouseover="this.src='${path}/img/tour_logo2.png'"
											onmouseout="this.src='${path}/img/tour_logo1.png'">
										</a>
									</c:when>
									<c:otherwise>
										<a href="${ctrpath}/main"> <img
											src="${path}/img/tour_logo1.png" alt=""
											onmouseover="this.src='${path}/img/tour_logo2.png'"
											onmouseout="this.src='${path}/img/tour_logo1.png'">
										</a>
									</c:otherwise>
								</c:choose>

							</div>
						</div>
						<div class="col-xl-6 col-lg-6">
							<div class="main-menu  d-none d-lg-block">
								<nav>
									<ul id="navigation">
										<!-- 멤버or호스트별 로그인 => 세션적용 시 -->
										<c:choose>
											<c:when
												test="${sessionScope.sessionID == null && sessionScope.sessionHID == null}">
												<li><a class="active"
													href="${ctrpath}/local/localboardList">국내여행</a></li>
												<li><a href="#">추천여행지 <i class="ti-angle-down"></i></a>
													<ul class="submenu">
														<li><a href="${ctrpath}/recommend/home">연령대 별 여행지</a></li>
														<li><a href="${ctrpath}/recommend/home">지역 별 여행지</a></li>
														<li><a href="${ctrpath}/recommend/home">테마 별 여행지</a></li>
														<li><a href="${ctrpath}/recommend/home">mbti 별
																여행지</a></li>
													</ul></li>
												<li><a href="#">여행후기 <i class="ti-angle-down"></i></a>
													<ul class="submenu">
														<li><a href="${ctrpath}/survey/surveyForm">국내여행</a></li>
														<li><a href="${ctrpath}/survey/surveyList">..</a></li>
													</ul></li>
												<li><a class="active"
													href="${ctrpath}/customernotice/listNo">공지사항</a></li>
											</c:when>
											<c:when test="${sessionScope.sessionID != null}">
												<li><a class="active"
													href="${ctrpath}/local/localboardList">국내여행</a></li>
												<li><a href="#">추천여행지 <i class="ti-angle-down"></i></a>
													<ul class="submenu">
														<li><a href="${ctrpath}/recommend/home">연령대 별 여행지</a></li>
														<li><a href="${ctrpath}/recommend/home">지역 별 여행지</a></li>
														<li><a href="${ctrpath}/recommend/home">테마 별 여행지</a></li>
														<li><a href="${ctrpath}/recommend/home">mbti 별
																여행지</a></li>
													</ul></li>
												<li><a class="active"
													href="${ctrpath}/customernotice/listNo">공지사항</a></li>
												<li><a href="#">이벤트 <i class="ti-angle-down"></i></a>
													<ul class="submenu">
														<li><a href="${ctrpath}/survey/surveyForm">설문조사</a></li>
														<li><a href="${ctrpath}/survey/surveyList">MBTI</a></li>
													</ul></li>
												<li><a href="#">[ ${sessionScope.sessionName} ]님의
														contents <i class="ti-angle-down"></i>
												</a>
													<ul class="submenu">
														<li><a href="${ctrpath}/scheduler/schePath">여행
																스케줄러</a></li>
														<li><a
															href="${ctrpath}/diary/diaryList?dwriter=${sessionScope.sessionID}">다이어리</a></li>
														<li><a href="${ctrpath}/member/mbti">mbti테스트</a></li>
													</ul></li>
											</c:when>
											<c:when test="${sessionScope.sessionHID != null }">
												<li><a href="#">객실관리 <i class="ti-angle-down"></i></a>
													<ul class="submenu">
														<li><a href="${ctrpath}/recommend/home">객실등록</a></li>
														<li><a href="${ctrpath}/recommend/home">객실수정/삭제</a></li>
														<li><a href="${ctrpath}/recommend/home">객실리스트</a></li>
													</ul></li>
												<li><a class="active"
													href="${ctrpath}/local/localboardList">예약내역</a></li>
												<li><a class="active"
													href="${ctrpath}/local/localboardList">매출</a></li>
												<li><a class="active"
													href="${ctrpath}/local/localboardList">리뷰관리</a></li>
											</c:when>
										</c:choose>
										<!-- 관리자 
										<li><a href="#">설문조사 <i class="ti-angle-down"></i></a>
											<ul class="submenu">
												<li><a href="${ctrpath}/survey/surveyForm">설문조사 등록</a></li>
												<li><a href="${ctrpath}/survey/surveyList">설문 리스트</a></li>
												<li><a href="${ctrpath}/tchart/preference">차트preference</a></li>
												<li><a href="${ctrpath}/tchart/gender">차트gender</a></li>
											</ul></li>
										<li><a class="active" href="${ctrpath}/mail/emailForm">메일전송</a></li>
										-->
									</ul>
								</nav>
							</div>
						</div>
						<div class="col-xl-4 col-lg-4 d-none d-lg-block">
							<div
								class="social_wrap d-flex align-items-center justify-content-end">
								<link rel="stylesheet" href="${path}/css/headerLineW.css">
								<div class="loader">
									<span class="l">W</span> <span class="o">E</span> <span
										class="a">L</span> <span class="d">C</span> <span class="i">O</span>
									<span class="n">M</span> <span class="g">E</span>
								</div>
								&nbsp;&nbsp;&nbsp;

								<div class="social_links d-none d-xl-block">
									<ul>
										<c:choose>
											<c:when
												test="${sessionScope.sessionID == null && sessionScope.sessionHID == null}">
												<li><a href="${ctrpath}/chooseLogin">LogIn</a></li>
												<li><a href="${ctrpath}/chooseSignup">SignUp</a></li>
											</c:when>
											<c:when test="${sessionScope.sessionID != null }">
												<!-- 예약내역 -->
												<li><a href="${ctrpath}/calendar/calendarList"><i
														class="fa-regular fa-calendar-check fa-xl"></i></a></li>
												<!-- 찜목록 -->
												<li><a href="${ctrpath}/interest/listCart"><i
														class="fa-solid fa-heart fa-bounce fa-xl"
														style="color: #F775A0;"></i></a></li>
												<!-- 마이페이지 -->
												<li><a
													href="${ctrpath}/member/mypage?mnum=${sessionScope.sessionNum}"><i
														class="fa-solid fa-user fa-xl"></i></a></li>
												<!-- LogOut -->
												<li><a href="${ctrpath}/login/logoutProcess"><i
														class="fa-solid fa-right-from-bracket fa-xl"></i></a></li>
												<!-- 로그인연장 -->
												<li class="nav-item" id="timer"></li>
												<li class="nav-item"><input type="button"
													class="btn btn_line time_ss" style="text-align: right"
													value="연장" onclick="clearTime(15)"></li>
											</c:when>
											<c:when test="${sessionScope.sessionHID != null }">
												<!-- 예약확인하기 -->
												<li><a href="${ctrpath}/calendar/calendarList"><i
														class="fa-regular fa-calendar-check fa-xl"></i></a></li>
												<!-- 호스트페이지 -->
												<li><a
													href="${ctrpath}/host/hostpage?hid=${sessionScope.sessionHID}"><i
														class="fa-solid fa-user fa-xl"></i></a></li>
												<!-- LogOut -->
												<li><a href="${ctrpath}/hlogin/hlogoutProcess"><i
														class="fa-solid fa-right-from-bracket fa-xl"></i></a></li>
											</c:when>
										</c:choose>


									</ul>
								</div>
							</div>
						</div>
						<div class="col-12">
							<div class="mobile_menu d-block d-lg-none"></div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</header>