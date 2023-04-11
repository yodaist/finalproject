<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources" />
<c:set var="ctrpath" value="${pageContext.request.contextPath}" />

<!-- Timer SessionOut Script Start! -->
<script>
	$(function() {
		clearTime(15); // ���� ���� ���� �ð� 
		setTimer(); // ���� �ε�� Ÿ�̸� ����

	});
	
	var initMinute; // ���� ������ �ð�(min)
	var remainSecond; // �����ð�(sec)

	function clearTime(min) { // Ÿ�̸� �ʱ�ȭ �Լ�
		initMinute = min;
		remainSecond = min * 60;
	}
	
	function setTimer() { // 1�� �������� ȣ���� Ÿ�̸� �Լ� 

		// hh : mm ���� �����ð� ǥ���ϱ� ���� ���� 
		remainMinute_ = parseInt(remainSecond / 60);
		remainSecond_ = remainSecond % 60;

		if (remainSecond > 0) {
			$("#timer").empty();
			$("#timer").append(
					'<a>' + Lpad(remainMinute_, 2) + ":"
							+ Lpad(remainSecond_, 2) + ' ����</a>'); // hh:mm ǥ��
			remainSecond--;
			setTimeout("setTimer()", 1000); //1�ʰ������� ȣ��
		} else {
			/*���� ����� �۵��� �̺�Ʈ*/
			if (${sessionScope.sessionID != undefined}) {
				location = "${ctrpath}/login/logoutProcess";
			}
			//location = "${pageContext.request.contextPath}/web/main";
		}
	}

	function Lpad(str, len) { // hh mm�������� ǥ���ϱ� ���� �Լ�
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
								<!-- ���orȣ��Ʈ���� ����Ȩ ���� -->
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
										<!-- ���orȣ��Ʈ�� �α��� => �������� �� -->
										<c:choose>
											<c:when
												test="${sessionScope.sessionID == null && sessionScope.sessionHID == null}">
												<li><a class="active"
													href="${ctrpath}/local/localboardList">��������</a></li>
												<li><a href="#">��õ������ <i class="ti-angle-down"></i></a>
													<ul class="submenu">
														<li><a href="${ctrpath}/recommend/home">���ɴ� �� ������</a></li>
														<li><a href="${ctrpath}/recommend/home">���� �� ������</a></li>
														<li><a href="${ctrpath}/recommend/home">�׸� �� ������</a></li>
														<li><a href="${ctrpath}/recommend/home">mbti ��
																������</a></li>
													</ul></li>
												<li><a href="#">�����ı� <i class="ti-angle-down"></i></a>
													<ul class="submenu">
														<li><a href="${ctrpath}/survey/surveyForm">��������</a></li>
														<li><a href="${ctrpath}/survey/surveyList">..</a></li>
													</ul></li>
												<li><a class="active"
													href="${ctrpath}/customernotice/listNo">��������</a></li>
											</c:when>
											<c:when test="${sessionScope.sessionID != null}">
												<li><a class="active"
													href="${ctrpath}/local/localboardList">��������</a></li>
												<li><a href="#">��õ������ <i class="ti-angle-down"></i></a>
													<ul class="submenu">
														<li><a href="${ctrpath}/recommend/home">���ɴ� �� ������</a></li>
														<li><a href="${ctrpath}/recommend/home">���� �� ������</a></li>
														<li><a href="${ctrpath}/recommend/home">�׸� �� ������</a></li>
														<li><a href="${ctrpath}/recommend/home">mbti ��
																������</a></li>
													</ul></li>
												<li><a class="active"
													href="${ctrpath}/customernotice/listNo">��������</a></li>
												<li><a href="#">�̺�Ʈ <i class="ti-angle-down"></i></a>
													<ul class="submenu">
														<li><a href="${ctrpath}/survey/surveyForm">��������</a></li>
														<li><a href="${ctrpath}/survey/surveyList">MBTI</a></li>
													</ul></li>
												<li><a href="#">[ ${sessionScope.sessionName} ]����
														contents <i class="ti-angle-down"></i>
												</a>
													<ul class="submenu">
														<li><a href="${ctrpath}/scheduler/schePath">����
																�����ٷ�</a></li>
														<li><a
															href="${ctrpath}/diary/diaryList?dwriter=${sessionScope.sessionID}">���̾</a></li>
														<li><a href="${ctrpath}/member/mbti">mbti�׽�Ʈ</a></li>
													</ul></li>
											</c:when>
											<c:when test="${sessionScope.sessionHID != null }">
												<li><a href="#">���ǰ��� <i class="ti-angle-down"></i></a>
													<ul class="submenu">
														<li><a href="${ctrpath}/recommend/home">���ǵ��</a></li>
														<li><a href="${ctrpath}/recommend/home">���Ǽ���/����</a></li>
														<li><a href="${ctrpath}/recommend/home">���Ǹ���Ʈ</a></li>
													</ul></li>
												<li><a class="active"
													href="${ctrpath}/local/localboardList">���೻��</a></li>
												<li><a class="active"
													href="${ctrpath}/local/localboardList">����</a></li>
												<li><a class="active"
													href="${ctrpath}/local/localboardList">�������</a></li>
											</c:when>
										</c:choose>
										<!-- ������ 
										<li><a href="#">�������� <i class="ti-angle-down"></i></a>
											<ul class="submenu">
												<li><a href="${ctrpath}/survey/surveyForm">�������� ���</a></li>
												<li><a href="${ctrpath}/survey/surveyList">���� ����Ʈ</a></li>
												<li><a href="${ctrpath}/tchart/preference">��Ʈpreference</a></li>
												<li><a href="${ctrpath}/tchart/gender">��Ʈgender</a></li>
											</ul></li>
										<li><a class="active" href="${ctrpath}/mail/emailForm">��������</a></li>
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
												<!-- ���೻�� -->
												<li><a href="${ctrpath}/calendar/calendarList"><i
														class="fa-regular fa-calendar-check fa-xl"></i></a></li>
												<!-- ���� -->
												<li><a href="${ctrpath}/interest/listCart"><i
														class="fa-solid fa-heart fa-bounce fa-xl"
														style="color: #F775A0;"></i></a></li>
												<!-- ���������� -->
												<li><a
													href="${ctrpath}/member/mypage?mnum=${sessionScope.sessionNum}"><i
														class="fa-solid fa-user fa-xl"></i></a></li>
												<!-- LogOut -->
												<li><a href="${ctrpath}/login/logoutProcess"><i
														class="fa-solid fa-right-from-bracket fa-xl"></i></a></li>
												<!-- �α��ο��� -->
												<li class="nav-item" id="timer"></li>
												<li class="nav-item"><input type="button"
													class="btn btn_line time_ss" style="text-align: right"
													value="����" onclick="clearTime(15)"></li>
											</c:when>
											<c:when test="${sessionScope.sessionHID != null }">
												<!-- ����Ȯ���ϱ� -->
												<li><a href="${ctrpath}/calendar/calendarList"><i
														class="fa-regular fa-calendar-check fa-xl"></i></a></li>
												<!-- ȣ��Ʈ������ -->
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