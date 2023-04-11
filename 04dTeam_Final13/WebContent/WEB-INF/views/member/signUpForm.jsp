<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- 2023. 1. 19. / Kosmo -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctrpath" value="${pageContext.request.contextPath}" />

<ul class="list-unstyled">
	<li class="border-top my-3"></li>
</ul>
<div class="container">
	<h3>ȸ������</h3>
	<form action="signUpProcess" method="post" id="signUpInfo">
		<!--
		<input type="hidden" name="reip" value="<%=request.getRemoteAddr()%>">
	-->
		<div class="form-group">
			<label for="mname">�̸�</label> <input type="text" class="form-control"
				id="mname" placeholder="�̸� �Է�" name="mname" maxlength="10"
				required="required" pattern=".{2,10}">
		</div>
		<div class="form-group">
			<label for="mid">ID</label> <input type="text" class="form-control"
				id="mid" placeholder="���̵� �Է�" name="mid" maxlength="10"
				required="required" pattern=".{2,10}">
			<button type="button" class="btn btn-primary" id="idchk">�ߺ�Ȯ��</button>
			<div id="target"></div>

		</div>
		<div class="form-group">
			<label for="mpwd">PWD</label> <input type="password"
				class="form-control" id="mpwd" placeholder="******" name="mpwd"
				maxlength="10" required="required" pattern=".{2,10}">
		</div>
		<div class="form-group">
			<label>��ȭ��ȣ</label>
			<div class="form-con-select">
				<select class="form-control" required="required" name="mphone"
					style="line-height: inherit; line-height: 40px;">
					<option value="010">010</option>
					<option value="070">070</option>
					<option value="02">02</option>
					<option value="031">031</option>
					<option value="032">032</option>
					<option value="033">033</option>
					<option value="041">041</option>
				</select>
			</div>
			<a style="padding: 5px" tabindex="0"> - </a><input type="text"
				name="mphone" class="input1" maxlength="4"><a
				style="padding: 5px" tabindex="0"> - </a><input type="text"
				name="mphone" maxlength="4" class="input1">
		</div>

		<div class="form-group">
			<label for="mcall">��󿬶���</label> <input type="text"
				class="form-control" id="mcall" placeholder="��󿬶��� �Է�" name="mcall"
				maxlength="15" required="required">
		</div>
		<div class="form-group">
			<label for="mjumin">�ֹι�ȣ</label> <input type="text"
				class="form-control" id="mjumin" placeholder="�ֹι�ȣ �Է�" name="mjumin"
				required="required">
		</div>
		<div class="form-group">
			<label for="maddr">�ּ�</label> <input type="text" class="form-control"
				id="maddr" placeholder="�ּ� �Է�" name="maddr" required="required">
		</div>
		<div class="form-group">
			<label for="memail">�̸���</label> <input type="text"
				class="form-control" id="memail" placeholder="�̸��� �Է�" name="memail"
				required="required">
		</div>

		<input type="hidden" id="mgrade" name="mgrade" value="10"> <input
			type="hidden" id="mpoint" name="mpoint" value="1000"> <input
			type="hidden" id="mno" name="mno" value="1"> <input
			type="hidden" id="mmbti" name="mmbti" value="0">
		<div class="form-group" style="text-align: right; margin-top: 10px;">
			<button type="submit" class="btn btn-primary">���</button>
			&nbsp; <a href="${ctrpath}/login/idpwdSearch">
				<button type="button" class="btn btn-primary" id="idpwdBtn">���̵�/���ã��</button>
			</a>
		</div>
	</form>

</div>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
	/*
	 $(function() {
	 $('#idpwdBtn').click(function() {
	 location="/login/idpwdSearch";
	 });
	 });
	 */

	$(function() {
		$('#idchk').click(
				function() {
					let param = $('#mid').val();
					$.ajax({
						url : "../idcheck?mid=" + param,
						success : function(data) {
							console.log(data);
							if (data == 1) {
								$('#target').css('background-color', 'red')
										.css('color', 'white').html(
												'������� ���̵� �Դϴ�.');
							} else {
								$('#target').css('background-color', 'blue')
										.css('color', 'white').html(
												'��� ������ ���̵� �Դϴ�.');
							}
						}
					});
				});
	});
</script>