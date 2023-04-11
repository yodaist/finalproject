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
	<!-- ��Ʈ -->
	<!-- Load c3.css -->
	<link href="${path }/css/c3.css" rel="stylesheet">
	<!-- Load d3.js and c3.js -->
	<script src="${path }/js/d3-5.8.2.min.js" charset="utf-8"></script>
	<script src="${path }/js/c3.min.js"></script>
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
			<div class="green name">${sessionScope.sessionName}�� �׷���</div>

		</div>
		<!-- ================================================== -->
		<div class="modify"></div>
	</div>
	<div class="summaryContainer">
		<div class="container mt-3" align="center">
			<button class="chartBtn" type="button" id="default">���� ���� ����</button>
		</div>
		<div class="container mt-3" align="center">
			<button class="chartBtn" type="button" id="visitSpot">�湮 ������</button>
		</div>
		<div class="container mt-3" align="center">
			<button class="chartBtn" type="button" id="periodMax">�ִ� ����
				�Ⱓ</button>
		</div>
		<div class="container mt-3" align="center">
			<button class="chartBtn" type="button" id="costType">�� ���� ���</button>
		</div>
		<div class="container mt-3" align="center">
			<button class="chartBtn" type="button" id="costTotal">���� ����
				���</button>
		</div>		
	</div>
	<!-- ================================================== -->
	<div class="shippingStatusContainer">
		<div class="title" id="chartTitle"></div>
		<div class="status">
			<div class="item">
				<div>
					<div id="tourCountChart"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- ================================================== -->
</div>
<!-- ================================================== -->

<script>
	$(function() {
		// ���� ���õ� ��ư ��ü
		let currentBtn = null;

		$('.chartBtn').click(function() {
			// ������ ���õ� ��ư ��ü�� ��Ÿ�� �ʱ�ȭ
			if (currentBtn) {
				currentBtn.css({
					'background-color' : '',
					'color' : '',
					'font-size' : ''
				});
			}

			// ���� ���õ� ��ư ��ü�� ��Ÿ�� ����
			$(this).css({
				'background-color' : 'aliceblue',
				'color' : 'black',
				'font-size' : '17px'
			});

			// ���� ���õ� ��ư ��ü ����
			currentBtn = $(this);

			let btnID = currentBtn.attr('id');
			let url;
			let chartType; //1:���� / 2:���� / 3:������
			//alert(id);
			if (btnID == 'default') {
				//�� �� ���� Ƚ�� => BookRestController���� �ڵ鸵
				chartType = 1;
				url = "../tourMonthCount?mnum=${sessionScope.sessionNum}";
			} else if (btnID == 'visitSpot') {
				//�湮 ������ => "visitSpot"
				chartType = 1;
				url = "../visitSpotCount?mnum=${sessionScope.sessionNum}";
			} else if (btnID == 'periodMax') {
				//�ִ� ���� �Ⱓ => 
				chartType = 2;
				url = "../periodMaxChart?mnum=${sessionScope.sessionNum}";
			} else if (btnID == 'costType') {
				//�� ���� ��� => costType
				chartType = 2;
				url = "../costTypeChart?mnum=${sessionScope.sessionNum}";
			} else if (btnID == 'costTotal') {
				//���� ���� ��� => 
				chartType = 3;
				url = "../costTotalChart?mnum=${sessionScope.sessionNum}";
			} 
			
			$.ajaxSetup({
				cache : false
			//ĳ�û���
			});

			$.ajax({
				//�����͸� �ְ���� ���� �ּ� �Է�
				url : url,
				//�۾��� ���������� �߻����� ���
				success : function(jsondata) {
					$('#tourCountChart').html(""); //����
					console.log(jsondata);
					//====================================
					$('#chartTitle').html(jsondata[0].sub);
					if (chartType == 1) { //������Ʈ
						var chart = c3.generate({
							bindto : '#tourCountChart', //��Ʈ ǥ�õ� �κ�(id)
							data : { //success�ؼ� �޾ƿ� jsondata������ �ڵ鸵
								json : [ jsondata[1] ], //1���� => key_��,val_cnt
								keys : {
									value : Object.keys(jsondata[1]),
								},
								type : 'donut'
							},
							donut : {
								title : jsondata[0].sub, //0����
							},
						});
					} else if (chartType == 2) { //���� ��Ʈ
						var chart = c3.generate({
							bindto : '#tourCountChart', //��Ʈ ǥ�õ� �κ�(id)
							data : { //success�ؼ� �޾ƿ� jsondata������ �ڵ鸵
								json : [ jsondata[1] ], //1���� => key_��,val_cnt
								keys : {
									value : Object.keys(jsondata[1]).sort(),
								},
						        type: 'bar'
						    },
						    bar: {
						        width: {
						            ratio: 0.5 // this makes bar width 50% of length between ticks
						        }
						    }
						});
					} else if (chartType == 3) { //������ ��Ʈ
						// x�� ������ ��¥
						let datax = JSON.parse(jsondata[1].datelist.replace(/'/g, "\""));
						// y�� ������ ���� ��
						let datay = JSON.parse(jsondata[2].sumlist.replace(/'/g, "\""));
						
						// �迭 ���·� ����
						let columns = [];
						columns.push(datax);
						columns.push(datay);
						//TEST----------
						//alert(datax);
						//alert(datay);
						//alert(columns);
						//--------------
						var chart = c3.generate({
							bindto : '#tourCountChart', //��Ʈ ǥ�õ� �κ�(id)
							data: {
						        x: 'x',
						        columns: columns,
						        type: 'line'
						    },
						    axis: {
						    	 x: {
						             type: 'timeseries',
						             tick: {
						                 format: '%y/%m/%d'
						             }
						         }
						    }
						});
					}

					//====================================
				},
				//������ ���� ��� �����ų �ڵ�
				error : function(e) {
					console.log("error:" + e);
				}
			});
		});
		$('#default').click();
	});
</script>