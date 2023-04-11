<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 2023. 1. 19. / Kosmo -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctrpath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/loginDetailForm.css" />

<ul class="list-unstyled">
    <li class="border-top my-3"></li>
</ul>
<div class="wrap">
    <div class="login" style="margin-bottom: 300px;">
        <h3>·Î±×ÀÎ</h3>
        <form action="hloginProcess" method="post" id="loginInfo">
        <!--
            <input type="hidden" name="reip" value="<%=request.getRemoteAddr()%>">
        -->
            <div class="login_sns">
				<div class="login_id" style="width: 300px;">
                    <h4>ID</h4>
                    <input type="text" name="hid" id="hid" required="required"
                        placeholder="ID">
                </div>
            </div>
            <div class="login_sns">
				<div class="login_pw" style="width: 300px;">
                    <h4>Password</h4>
                    <input type="password" id="hpwd" placeholder="**" name="hpwd">
                </div>
            </div>
            <div class="login_etc">
                <div class="forgot_pw">
                    <a href="${ctrpath}/login/idpwdSearch">Forgot Password?</a>
                </div>
                <div class="submit">
                    <input type="submit" value="submit">
                </div>

            </div>
        </form>
    </div>
</div>

<script>
    /*
     $(function() {
     $('#idpwdBtn').click(function() {
     location="/login/idpwdSearch";
     });
     });
     */
</script>