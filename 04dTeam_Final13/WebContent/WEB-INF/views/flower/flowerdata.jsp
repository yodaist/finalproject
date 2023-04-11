<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctrpath" value="${pageContext.request.contextPath}" />
<style>
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 500;
	font-style: normal;
}

@font-face {
	font-family: 'TTTtangsbudaejjigaeB';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/TTTtangsbudaejjigaeB.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

body {
	font-family: 'Pretendard-Regular';
}

.container {
	width: 750px;
	padding: 30px 35px 35px;
	background: #fff;
	border-radius: 10px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
	margin-bottom: 150px;
}

.container.disable .editor-panel, .container.disable .btnspace .reset-filter,
	.container.disable .btnspace .save-img {
	opacity: 0.5;
	pointer-events: none;
}

.container h2 {
	font-family: 'TTTtangsbudaejjigaeB';
	margin-top: -10px;
	font-size: 22px;
	font-weight: bold;
	color: #3c3c3c;
}

.container .wrapper {
	display: flex;
	margin: 20px auto;
	min-height: 335px;
}

.wrapper {
	justify-content: center;
	width: 500px;
}

input[type=text] {
	width: 100%;
	padding: 5px 20px;
	margin: 8px 0;
	box-sizing: border-box;
	border: none;
	border-bottom: 2px solid gray;
}

input[type=text]:focus {
	width: 100%;
	padding: 12px 20px 10px;
	margin: 8px 0;
	outline: none;
	box-sizing: border-box;
	border: none;
	border-bottom: 2px solid #2EE59D;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
	box-sizing: border-box;
}

textarea {
	width: 100%;
	height: 6.25em;
	border: none;
	border-bottom: 2px solid gray;
}

textarea:focus {
	width: 100%;
	height: 6.25em;
	outline: none;
	border: none;
	border-bottom: 2px solid #2EE59D;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.options, .btnspace {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

button {
	margin-right: 10px;
}

.button_submit {
	width: 140px;
	height: 45px;
	font-family: 'Roboto', sans-serif;
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 2.5px;
	font-weight: 500;
	color: #000;
	background-color: #fff;
	border: none;
	border-radius: 45px;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease 0s;
	cursor: pointer;
	outline: none;
	margin-top: 15px;
}

.button_submit:hover {
	background-color: #2EE59D;
	box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
	color: #fff;
	transform: translateY(-7px);
}

#imgx {
	width: 390px;
	height: 270px;
	border-radius: 25px;
	margin-top: 10px;
	box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.1);
}

#flowerimg {
	width: 390px;
	height: 270px;
	border-radius: 25px;
	margin-top: 10px;
	box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.1);
	margin-bottom: 10px;
	margin-top: -10px;
}

#imgfilter {
	width: 380px;
	height: 50px;
	border-radius: 15px;
	opacity: 0.9;
	color: #fff;
	font-weight: bold;
	transform: translateY(-7px);
	text-align: center;
	line-height: 3;
	margin-top: 20px;
	border: 1px solid #2EE59D;
	background-color: #2EE59D;
	box-shadow: 0px 5px 5px rgba(46, 229, 157, 0.4);
}

img {
	text-align: center;
}

h2 {
	text-align: center;
}

.input-box {
	text-align: center;
}
</style>

<div class="container">
	<h2>내가 찍은 꽃으로 축제 찾기</h2>
	<div class="wrapper">


		<%--------------- 이미지 시작 ---------------%>
		<div class="options">
			<input class="btn btn-light" type="file" id="file1" name="file1">

			<div id="imgfilter">
				<a href="../diary/photo"> 나만의 여행 사진 필터 적용하기 </a>
			</div>

			<img id="imgx" src="${ctrpath}/resources/img/preview-available.png">


		</div>
		<%--------------- 이미지 끝! ---------------%>

		<div class="btnspace">
			<%-- https://devdevout.com/css/css-round-buttons --%>
			<button class="button_submit">Submit</button>
		</div>

	</div>
	<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@fat" style="justify-content: center;">꽃 정보보기</button>
	<%--------------------모달----------------------%>
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">&#127803;꽃 축제 정보&#127803;</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<div class="input-box">
						<label>${sessionScope.sessionID}님이 찍은 꽃은</label> <img id="flowerimg" src="${ctrpath}/resources/img/preview-available.png">
						<div class="flowername">XX일 가능성이 높습니다!&#127803;</div>
						<button class="button_submit">Show</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%--------------------모달----------------------%>
</div>


<script>
	// ---------------이미지 뜨게 하기 시작!---------------
	function readURL(element) {
		//input type = "file"의 주소를 가져옴.
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#imgx').attr('src', e.target.result); //setter
		}
		reader.readAsDataURL(element.files[0]);
	}

	$(function() {
		$('#file1').change(function() {
			if ($(this).val().length != 0) {
				//함수 호출
				readURL(this);
			} else {
				console.log("이미지 없습니다.");
			}
		});
	});
	// ---------------이미지 뜨게 하기 끝!---------------

	// ---------------jsonp 받아오기 시작!---------------
	$('.button_submit').click(function() {
		var fileInput = $('#file1')[0];
		console.log("fileInput: ", fileInput.files)
		var file = fileInput.files[0];
		var formData = new FormData();
		formData.append('image', file);
		console.log(formData);
		$.ajax({
			url : 'http://192.168.0.178:9000/drawnum/classify',
			type : 'GET',
			processData : false,
			contentType : false,
			data : formData,
			dataType : 'jsonp',
			success : function(data) {
				console.log('Image uploaded successfully: ' + data);
			},
			error : function(error) {
				console.log('Error uploading image: ' + error);
			}
		})

	})
</script>
