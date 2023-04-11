<%@page import="kr.co.kosmo.mvc.vo.BookVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}/resources" />
<c:set var="ctrpath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/css/myPageUI.css" rel="stylesheet" />
<link rel="stylesheet" href="${path}/css/buttonEff.css" rel="stylesheet" />
<link rel="stylesheet" href="${path}/css/myPageRankHover.css" rel="stylesheet" />
<div class="wrap" style="max-width: 1000px; margin: 0 auto;">

	<!-- ================================================== -->
	<!-- ��Ʈ -->
	<!-- Load c3.css -->
	<link href="${path }/css/c3.css" rel="stylesheet">
	<!-- Load d3.js and c3.js -->
	<script src="${path }/js/d3-5.8.2.min.js" charset="utf-8"></script>
	<script src="${path }/js/c3.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- ================================================== -->

	<div class="pinkContainer">
		<div>
			<div class="grade">
				<figure>
					<img src="${path}/rankimg/boltstone.png" height="40px" width="45px" id="gradeimg">
				</figure>
			</div>
			<div class="green name">${sessionScope.sessionName}�Ը���������</div>

		</div>

		<!-- ================================================== -->
		<!-- ���+����� : name ���(����/ResultMap) -->
		<div class="modify"></div>
	</div>
	<c:forEach var="e" items="${mbsvo.member }">
		<div class="summaryContainer">
			<div class="item">
				<div class="rank">${mbsvo.mbsname }</div>
				<div>���</div>
			</div>
			<div class="item">
				<div class="number">${rcnt }</div>
				<div>����</div>
			</div>
			<div class="item">
				<div class="number">
					<fmt:formatNumber value="${e.mpoint }" pattern="###,###" />
					point
				</div>
				<div>����Ʈ</div>
			</div>
		</div>
		<!-- ================================================== -->
		<div class="shippingStatusContainer">
			<div class="title">���</div>
			<div class="status">
				<div class="item">
					<div>
						<div id="membershipGauge"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- ================================================== -->
		<div class="shippingStatusContainer">
			<div class="title">����</div>
			<div class="status">
				<div class="item">
					<div>
						<div class="green number">6</div>
						<div class="text">���ƿ�</div>
					</div>
					<div class="icon">></div>
				</div>
				<div class="item">
					<div>
						<div class="number">0</div>
						<div class="text">�غ���</div>
					</div>
					<div class="icon">></div>
				</div>
				<div class="item">
					<div>
						<div class="green number">1</div>
						<div class="text">�����Ϸ�</div>
					</div>
					<div class="icon">></div>
				</div>
				<div class="item">
					<div>
						<div class="green number">3</div>
						<div class="text">����Ȯ��</div>
					</div>
					<div class="icon">></div>
				</div>
			</div>

		</div>
		<!-- ================================================== -->
		<div class="listContainer">
			<a href="UseHistoryList?mnum=${sessionScope.sessionNum}&chk=1" class="item">
				<div class="icon"></div>
				<div class="text">
					�̿볻��<span class="circle"></span>
				</div>
				<div class="right">></div>
			</a> <a href="myReviewList?mid=${sessionScope.sessionID}" class="item">
				<div class="icon"></div>
				<div class="text">���䳻��</div>
				<div class="right">></div>
			</a> <a href="#" class="item">
				<div class="icon"></div>
				<div class="text">���ǳ���</div>
				<div class="right">></div>
			</a> <a href="${ctrpath}/interest/listCart" class="item">
				<div class="icon"></div>
				<div class="text">���ѿ���</div>
				<div class="right">></div>
			</a> <a href="${ctrpath}/survey/surveyList" class="item">
				<div class="icon"></div>
				<div class="text">��������</div>
				<div class="right">></div>
			</a>
		</div>
		<!-- ================================================== -->
		<div class="listContainer">
			<a href="mypageDetail?mnum=${sessionScope.sessionNum}" class="item">
				<div class="icon"></div>
				<div class="text">ȸ������</div>
				<div class="right">></div>
			</a> <a href="mypageChart?mnum=${sessionScope.sessionNum}" class="item">
				<div class="icon"></div>
				<div class="text">���� �׷���</div>
				<div class="right">></div>
			</a> 
			<a href="../scheduler/scheduleList?scmem=${sessionScope.sessionID}" class="item">
				<div class="icon"></div>
				<div class="text">���� �����ٷ�</div>
				<div class="right">></div>
			</a>
		</div>
	</c:forEach>
	<!-- ================================================== -->
	<div class="infoContainer">

		<a class="item">
			<div>
				<i class="fa-regular fa-chess-queen"></i>
			</div>
			<button onclick="history.back()">���� ������</button>
		</a> <a href="delmem?mnum=${sessionScope.sessionNum}" class="item">
			<div>
				<i class="fa-solid fa-skull " style="color: #C60B02"></i>
			</div>
			<button type="button" id="delBtn">ȸ��Ż��</button>
		</a> <a href="../customernotice/noticeSearch?searchType=&searchValue=&cPage=1" class="item">
			<div>
				<i class="fa-solid fa-chess-queen"></i>
			</div>
			<button type="button">��������</button>
		</a> <a href="#" class="item">
			<div>
				<i class="fa-solid fa-chess-queen"></i>
			</div>
			<button type="button">Q & A</button>
		</a>
	</div>
</div>
<!-- ================================================== -->

<script>
	$.ajaxSetup({
		cache : false
	//ĳ�û���
	});
	$.ajax({
		//�����͸� �ְ���� ���� �ּ� �Է� => MemberRestController���� �ڵ鸵
		url : "../membershipGauge?mnum=${sessionScope.sessionNum}",
		//�۾��� ���������� �߻����� ���
		success : function(data) {
			$('#membershipGauge').html(""); //����
			let grade = data[0].grade; //���
			let percentage = data[1].percentage; //����
			let gradename = data[2].gradename; //����̸�
			let gradeimg;
			let colorPattern = [ '#FFEAB6', '#FFCE55' ];

			//#96ffa1 / #60B044 Green
			//#96ceff / #0022ff Blue
			//#ff9696 /#FF0000 Red
			//#909091 / #000000 Black
			if (grade == 10) {
				//���޶���
				gradeimg = 'tostone.png';
				colorPattern = [ '#96ffa1', '#60B044' ];
			} else if (grade == 20) {
				//�����̾�
				gradeimg = 'sapphire.png';
				colorPattern = [ '#96ceff', '#0022ff' ];
			} else if (grade == 30) {
				//���
				gradeimg = 'crystals.png';
				colorPattern = [ '#ff9696', '#FF0000' ];
			} else if (grade == 40) {
				//���̾�
				gradeimg = 'diamond.png';
				colorPattern = [ '#909091', '#000000' ];
			}
			//====================================
			//�̹��� ����
			$('#gradeimg').attr('src', '${path}/rankimg/' + gradeimg);
			//====================================
			//��Ʈ
			var chart = c3.generate({
				bindto : '#membershipGauge', //��Ʈ ǥ�õ� �κ�(id)
				data : {
					columns : [ [ gradename, 0 ] ],
					type : 'gauge',
				},
				gauge : {},
				color : {
					pattern : colorPattern,
					threshold : {
						values : [ 50, 100 ]
					}
				},
				size : {
					height : 180
				}
			});
			setTimeout(function() {
				chart.load({
					columns : [ [ gradename, percentage ] ]
				});
			}, 200);
			//====================================
		},
		//������ ���� ��� �����ų �ڵ�
		error : function(e) {
			console.log("error:" + e);
		}
	});
	$(function() {
		$('#delBtn').click(function() {
			alert('Ż�� �Ǿ����ϴ�!');
		});
	});
</script>