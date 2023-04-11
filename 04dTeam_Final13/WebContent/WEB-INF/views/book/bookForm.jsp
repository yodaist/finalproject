<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- 2023. 1. 19. / Kosmo -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="ctrpath" value="${pageContext.request.contextPath}" />

<style>
.cardsize {
	width: 15rem;
	height: 20rem;
}
.isize {
	width: 235px;
	height: 160px;
	margin: auto;
}
</style>

<ul class="list-unstyled">
	<li class="border-top my-3"></li>
</ul>
<div class="container">
	<form action="bookProcess" method="post" enctype="multipart/form-data"
		id="localupform">
		<input type="hidden" name="mid" value="${sessionScope.sessionNum }">
		<input type="hidden" name="lid" value="${vo.lno }">
		<input type="hidden" name="sdate">
		<input type="hidden" name="edate">
		<input type="hidden" name="memail" value="${sessionScope.sessionEmail}">
		
		<div class="form-group">
			<label for="larea">Area</label> <input type="text"
				class="form-control" id="larea" value="${vo.larea }"
				readonly="readonly">
		</div>

		<div class="form-group">
			<label for="ltitle">Title</label> <input type="text"
				class="form-control" id="ltitle" value="${vo.ltitle }"
				readonly="readonly">
		</div>



		<div class="form-group">
			<label for="lcontent">Content</label> <input type="text"
				class="form-control" id="lcontent" value="${vo.lcontent }"
				readonly="readonly">
		</div>



		<div class="row mb-3">
			<label class="col-sm-2 col-form-label">*�̹���</label>
			<div class="col-sm-10">
				<img id="imgx" src="${ctrpath}/resources/imgfile/${vo.limg }">
			</div>
		</div>


		<!--  
		<div class="form-group">
			<label for="htcode">htcode</label> <input type="number" class="form-control"
				id="htcode" placeholder="htcode �Է�" name="htcode" maxlength="15"
				required="required">
		</div>
	-->


		<div class="form-group">
			<label for="lprice">Price</label> <input type="text"
				class="form-control" id="lprice" value="<fmt:formatNumber value="${vo.lprice }" pattern="###,###" />"
				readonly="readonly">
			<hr>
		</div>

		<div class="form-group">
			<label for="sdate">StartDate</label> <input type="date"
				class="form-control" id="sdate" placeholder="sdate �Է�">
		</div>

		<div id="target" class="form-group"></div>

		<div class="form-group">
			<input type="hidden" name="index" id="index">
			<table>
				<thead>
					<tr>
						<th colspan="3">Room</th>
					</tr>
				</thead>
				<tbody id="item" class="hcenter">
					<tr>
						<c:forEach var="e" items="${vo.item }">
							<td><input type="hidden" value="${e.iprice }" class="iprice">
								<div class="card cardsize">
									<img src="${ctrpath}/resources/imgfile/${e.iimg }"
										class="card-img-top isize" alt="..." >
									<div class="card-body">
										<h5 class="card-title">${e.iname }</h5>
										<p class="card-text">Contents</p>
										<p style="text-align: right;"><fmt:formatNumber value="${e.iprice }" pattern="###,###" />��</p>
										<div style="display: flex; justify-content: flex-end;">
											<input type="button" value="�����ϱ�"
												class="btn btn-primary item" style="width: 100px;" />
										</div>
									</div>
								</div></td>
						</c:forEach>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="3"></td>
					</tr>
				</tfoot>
			</table>
		</div>

		<!--		
		<div class="form-group">
			<label for="tsort">tsort</label> <input type="number" class="form-control"
				id="tsort" placeholder="tsort �Է�" name="tsort"
				required="required">
		</div>
-->

		<div class="form-group">
			<label for="chtype">����Ÿ��</label>
			<p>
				<input type="radio" id="chtype" name="chtype" required="required"
					value="ī��">ī��
			<p>
				<input type="radio" id="chtype" name="chtype" required="required"
					value="�������Ա�">�������Ա�
			<p>
				<input type="radio" id="chtype" name="chtype" required="required"
					value="�������">�������
			<p>
		</div>

		<div class="form-group">
			<label for="chpay">�����ݾ�</label> 
			<input type="text" class="form-control" id="chpayView" name="chpayView" required="required" readonly="readonly">
			<input type="hidden"
				class="form-control" id="chpay" name="chpay" required="required">
		</div>

		<div class="form-group" style="text-align: right; margin-top: 10px;">
			<button type="submit" class="btn btn-primary">���</button>
		</div>
	</form>

</div>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	let html = '';
	let range = 3; // td ������

	$('#item > tr > td').each(
			function(i, element) {
				if (i % range == 0) {
					if (i == $('#item > tr > td').length - 1) {
						html += '<tr><td>' + $('#item > tr > td').eq(i).html()
								+ '</td></tr>';
					} else {
						html += '<tr><td>' + $('#item > tr > td').eq(i).html()
								+ '</td>';
					}
				} else if (i % range == range - 1) {
					html += '<td>' + $('#item > tr > td').eq(i).html()
							+ '</td></tr>';
				} else {
					if (i == $('#item > tr > td').length - 1) {
						html += '<td>' + $('#item > tr > td').eq(i).html()
								+ '</td></tr>';
					} else {
						html += '<td>' + $('#item > tr > td').eq(i).html()
								+ '</td>';
					}
				}
			})
	$('#item').html(html);
	
	$(function() {
		$('.item').click(function() {
			let c = this;
			let addIndex = 0;
			let deleteIndex = -1;

			$('.item').each(function(i, element) {
				if (this == c) {
					addIndex = i;

					$('#index').attr('value', i); // #index ***

					// #chpay				
					let chpayValue = $('.iprice').eq(i).val() * bookCnt;
					$('#chpayView').val(chpayValue.toLocaleString());
					$('#chpay').val(chpayValue);
					
				} else if ($('.item').eq(i).val() == '���õ�') {
					deleteIndex = i;
				}
			})
			if ($('.item').eq(deleteIndex).val() == '���õ�') {
				// delete
				$('.item').eq(deleteIndex).val('�����ϱ�');
				$('.item').eq(deleteIndex).attr('disabled', false);
			}
			// add
			$('.item').eq(addIndex).val('���õ�');
			$('.item').eq(addIndex).attr('disabled', true);
		})
	})
	
	let bookCnt = 0; // �����ϼ�
	
	$(function() {
		$('#sdate').change(function() {
			if($('#sdate').val() != '') {
				let html = '<label for="edate">EndDate</label>';
				html += '<input type="date" class="form-control bdate" id="edate" placeholder="edate �Է�">';
				
				$('#target').html(html);
				$('input[name=sdate]').val($('#sdate').val());
			}
			
			$('#edate').change(function() {
				$.ajax({
					url: '../listLocalBook?lid='+${vo.lno}+'&sdate='+$('#sdate').val()+'&edate='+$('#edate').val(),
					success: function(data) {
						let jsObject = JSON.parse(data);
						$.each(jsObject[0].cntList, function(i, elt) {
							if(elt > 0) {
								$('.item').eq(i).addClass('btn-danger');
								$('.item').eq(i).attr('value', '�ǸſϷ�');
								$('.item').eq(i).attr('disabled', true);
							} else {
								$('.item').eq(i).removeClass('btn-danger');
								$('.item').eq(i).attr('value', '�����ϱ�');
								$('.item').eq(i).attr('disabled', false);
							}
						})
						bookCnt = jsObject[1].bookCnt;
					}
				})
				
				let sdate = $('#sdate').val();
				let edate = $('#edate').val();
				
				$('#sdate').val('');
				$('input[name=edate]').val($('#edate').val());
				$('#target').empty();
				$('#target').html('<p>'+sdate+' ~ '+edate+'</p>');
			})
		})
	})
</script>