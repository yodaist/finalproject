<%@page import="kr.co.kosmo.mvc.vo.BookVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources" />
<c:set var="ctrpath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/css/myPageUI.css" rel="stylesheet" />
<link rel="stylesheet" href="${path}/css/buttonEff.css" rel="stylesheet" />
<link rel="stylesheet" href="${path}/css/myPageRankHover.css"
	rel="stylesheet" />
<div class="wrap" style="max-width: 1000px; margin: 0 auto;">

	<!-- ================================================== -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- ================================================== -->

	<div class="pinkContainer">
		<div>
			<div class="grade">
				<figure>
					<img src="${path}/rankimg/boltstone.png" height="40px" width="45px"
						id="gradeimg">
				</figure>
			</div>
			<div class="green name">${sessionScope.sessionName}�� ȸ������</div>

		</div>

		<!-- ================================================== -->
		<!-- ��� ���(ResultMap) -->
		<div class="modify"></div>
	</div>
	<c:forEach var="e" items="${mbsvo.member }">
		<div class="summaryContainer">
			<div class="item">
				<div class="rank">${mbsvo.mbsname }</div>
				<div>���</div>
			</div>
			<div class="item">
				<div class="number">${e.mid }</div>
				<div>���̵�</div>
			</div>
			<div class="item">
				<div class="number">${e.mname }</div>
				<div>MBTI</div>
			</div>
		</div>
		<!-- ================================================== -->
		<div class="listContainer">
			<div class="item">
				<div class="icon"></div>
				<div class="text">����</div>
				<div class="right">${e.gender }</div>
			</div>
			<div class="item">
				<div class="icon"></div>
				<div class="text">(��) ����</div>
				<div class="right">${e.mage }</div>
			</div>
			<div class="item">
				<div class="icon"></div>
				<div class="text">��ȭ��ȣ</div>
				<div class="right">${e.mphone }</div>
			</div>
			<div class="item">
				<div class="icon"></div>
				<div class="text">�̸��� �ּ�</div>
				<div class="right">${e.memail }</div>
			</div>
			<div class="item">
				<div class="icon"></div>
				<div class="text">�ּ�</div>
				<div class="right">${e.maddr }</div>
			</div>
			<div class="item">
				<div class="icon"></div>
				<div class="text">��������</div>
				<div class="right">${e.mdate }</div>
			</div>
		</div>
	</c:forEach>
	<!-- ================================================== -->
	<div class="infoContainer">
		<a href="upmemForm" class="item">
			<div>
				<i class="fa-regular fa-chess-queen"></i>
			</div>
			<button type="button">��������</button>
		</a> <a href="delmem?mnum=${sessionScope.sessionNum}" class="item">
			<div>
				<i class="fa-solid fa-skull " style="color: #C60B02"></i>
			</div>
			<button type="button" id="delBtn">ȸ��Ż��</button>
		</a> <a
			href="../customernotice/noticeSearch?searchType=&searchValue=&cPage=1"
			class="item">
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
		//�����͸� �ְ���� ���� �ּ� �Է�
		url : "../tourCountJson2?mnum=${sessionScope.sessionNum}",
		//�۾��� ���������� �߻����� ���
		success : function(data) {
			$('#tourCountChart2').html(""); //����
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
				bindto : '#tourCountChart2', //��Ʈ ǥ�õ� �κ�(id)
				data : {
					columns : [ [ gradename, percentage ] ],
					type : 'gauge',
				},
				gauge : {
				//        label: {
				//            format: function(value, ratio) {
				//                return value;
				//            },
				//            show: false // to turn off the min/max labels.
				//        },
				//    min: 0, // 0 is default, //can handle negative min e.g. vacuum / voltage / current flow / rate of change
				//    max: 100, // 100 is default
				//    units: ' %',
				//    width: 39 // for adjusting arc thickness
				},
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