<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style></style>

</head>
<body>
<h3>MBTI �׽�Ʈ</h3>
<!--
<div>
<tbody>
<c:forEach begin="0" end="3" step="1" var="e">
<tr>
<td><img src="${path}/img/mbti/mbti${e}.PNG" height="300" width="200"></td>
<td></td>
</tr>
</c:forEach>
</tbody>

</div>-->

<div><img id="imgtarget" src="${path}/img/mbtitest/mbti0.PNG" height="300" width="200"></div>
����
<div id="text">E : ģ������ �� ���� , I : �������� �� ����</div>
<hr>
<div id="target2">��ư�� �����ּ���!</div>
<div style="width: 200px; border: 1px dotted; height: 50px;" id="target" ></div>
<input id="btn1" type="button" value="E" onclick="btn1()">
<input id="btn2" type="button" value="I" onclick="btn2()">
<input type="button" value="���" onclick="btn3()">

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
let type1=["E","E","E","N","N","N","F","F","F","J","J","J"];
let type2=["I","I","I","S","S","S","T","T","T","P","P","P"];
let k=0;
let i=0;
let e=0;
let n=0;
let f=0;
let j=0;
let s=0;
let t=0;
let p=0;
let orderMsg ="";
let text=["E : �������� �� ������ʹ� , I : ���� ���� �� ���",
	"E : ��ٱ� ���� �ݰ��� �ƴ�ô�Ѵ�, I : ��ٱ� ���� ��ô�Ѵ�","N : �̷��� ����Ѵ� , S : ���簡 �߿���",
	"N : ���࿡��� ����� ������, S : ���� �׷������ ? ���ɾ�?","N : �̷����� ����� ������, S : ����� �ִ� ����",
			"F : ���� ��ó����, T:���� ��¼���","F : ���� �ٸ� ���� �ִ��� �����ؼ�, T:�� �״�� �޾Ƶ帲",
			"F : ���ľ �߿�, T : ����� �߿�","J : ������ ��ȹ, P : �����ο� ��ȥ",
			"J : ���͸��� �׻� ����, P : �����ο� ��ȥ","J : ������ ������ ã�ƺ�, P : �����ο� ��ȥ"];
let targetDiv = document.getElementById("target");

function btn1() {
	if(k>11){
		$('#target2').text("�������縦 �Ϸ��߽��ϴ� ������⸦ �����ּ���!");
	}
	else{
		if(type1[k]=="E"){
			e++;
		};
		if(type1[k]=="N"){
			n++;
		};
		if(type1[k]=="F"){
			f++;
		};
		if(type1[k]=="J"){
			j++;
		};
		console.log(type1[k]);
		$('#target2').text(type1[k]+"�����ϼ̽��ϴ�.")
		$('#text').text(text[k]);
		k++;
		$('#btn1').attr("value",type1[k]);
		$('#btn2').attr("value",type2[k]);
		document.getElementById("imgtarget").src="${path}/img/mbtitest/mbti"+k+".PNG";
	}
	
}
function btn2() {
	if(k>11){
		$('#target2').text("�������縦 �Ϸ��߽��ϴ� ������⸦ �����ּ���!");
	}
	else{
		if(type2[k]=="I"){
			i++;
		};
		if(type2[k]=="S"){
			s++;
		};
		if(type2[k]=="T"){
			t++;
		};
		if(type2[k]=="P"){
			p++;
		};
		console.log(type2[k]);
		console.log(type2[k]);
		$('#target2').text(type2[k]+"�����ϼ̽��ϴ�.")
		$('#text').text(text[k]);
		k++;
		$('#btn1').attr("value",type1[k]);
		$('#btn2').attr("value",type2[k]);
		document.getElementById("imgtarget").src="${path}/img/mbtitest/mbti"+k+".PNG";
	}
	
	
}
function btn3() {
	
	if(e>=2){
		orderMsg+="E";
	}else{
		orderMsg+="I";
	}
	if(n>=2){
		orderMsg+="N";
	}else{
		orderMsg+="S";
	}
	if(f>=2){
		orderMsg+="F";
	}else{
		orderMsg+="T";
	}
	if(j>=2){
		orderMsg+="J";
	}else{
		orderMsg+="P";
	}
	console.log("e : "+e);
	console.log("n : "+n);
	console.log("f : "+f);
	console.log("j : "+j);
	console.log("i : "+i);
	console.log("s : "+s);
	console.log("t : "+t);
	console.log("p : "+p);
	targetDiv.innerHTML="����� MBTI�� "+orderMsg+"�Դϴ�";
}
</script>
</html>




