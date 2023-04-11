<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources" />


<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap')
	;

@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 800;
	font-style: normal;
}

@font-face {
    font-family: 'TTTtangsbudaejjigaeB';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/TTTtangsbudaejjigaeB.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

.container {
	width: 850px;
	padding: 30px 35px 35px;
	background: #fff;
	border-radius: 10px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
	margin-bottom: 50px;
}

.container.disable .editor-panel, .container.disable .controls .reset-filter,
	.container.disable .controls .save-img {
	opacity: 0.5;
	pointer-events: none;
}

.container h2 {
	font-family: 'TTTtangsbudaejjigaeB';
	margin-top: -15px;
	font-size: 22px;
	font-weight: bold;
	color: #3c3c3c;
	text-align: center;
}

.container .wrapper {
	display: flex;
	margin: 20px 0;
	min-height: 335px;
}

.wrapper .editor-panel {
	padding: 15px 20px;
	width: 280px;
	border-radius: 5px;
	border: 1px solid #ccc;
}

.editor-panel .title {
	display: block;
	font-size: 16px;
	margin-bottom: 12px;
}

.editor-panel .options, .controls {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.editor-panel button {
	outline: none;
	height: 40px;
	font-size: 14px;
	color: #6C757D;
	background: #fff;
	border-radius: 3px;
	margin-bottom: 8px;
	border: 1px solid #aaa;
}

.editor-panel .filter button {
	width: calc(100%/ 2 - 4px);
}

.editor-panel button:hover {
	background: #f5f5f5;
}

.filter button.active {
	color: #fff;
	border-color: #5372F0;
	background: #5372F0;
}

.filter .slider {
	margin-top: 12px;
}

.filter .slider .filter-info {
	display: flex;
	color: #464646;
	font-size: 14px;
	justify-content: space-between;
}

.filter .slider input {
	width: 100%;
	height: 5px;
	accent-color: #5372F0;
}

.editor-panel .rotate {
	margin-top: 17px;
}

.editor-panel .rotate button {
	display: flex;
	align-items: center;
	justify-content: center;
	width: calc(100%/ 4 - 3px);
}

.rotate .options button:nth-child(3), .rotate .options button:nth-child(4)
	{
	font-size: 18px;
}

.rotate .options button:active {
	color: #fff;
	background: #5372F0;
	border-color: #5372F0;
}

.wrapper .preview-img {
	flex-grow: 1;
	display: flex;
	overflow: hidden;
	margin-left: 20px;
	border-radius: 5px;
	align-items: center;
	justify-content: center;
}

.preview-img img {
	max-width: 490px;
	max-height: 335px;
	width: 100%;
	height: 100%;
	object-fit: contain;
}

.controls button {
	padding: 11px 20px;
	font-size: 14px;
	border-radius: 3px;
	outline: none;
	color: #fff;
	cursor: pointer;
	background: none;
	transition: all 0.3s ease;
	text-transform: uppercase;
}

.controls .reset-filter {
	color: #6C757D;
	border: 1px solid #6C757D;
}

.controls .reset-filter:hover {
	color: #fff;
	background: #6C757D;
}

.controls .choose-img {
	background: #6C757D;
	border: 1px solid #6C757D;
}

.controls .save-img {
	margin-left: 5px;
	background: #5372F0;
	border: 1px solid #5372F0;
}

@media screen and (max-width: 760px) {
	.container {
		padding: 25px;
	}
	.container .wrapper {
		flex-wrap: wrap-reverse;
	}
	.wrapper .editor-panel {
		width: 100%;
	}
	.wrapper .preview-img {
		width: 100%;
		margin: 0 0 15px;
	}
}

@media screen and (max-width: 500px) {
	.controls button {
		width: 100%;
		margin-bottom: 10px;
	}
	.controls .row {
		width: 100%;
	}
	.controls .row .save-img {
		margin-left: 0px;
	}
}
</style>




<div class="container disable">
	<a href="javascript:history.back();"><img src="${path}/img/previous.png" style="width: 15px; height: 15px;"></a>
	<h2>������ ���� ���� �����ϱ�</h2>
	<div class="wrapper">
		<div class="editor-panel">
			<div class="filter">
				<label class="title">Filters</label>
				<div class="options">
					<button id="brightness" class="active">Brightness</button>
					<button id="saturation">Saturation</button>
					<button id="inversion">Inversion</button>
					<button id="grayscale">Grayscale</button>
				</div>
				<div class="slider">
					<div class="filter-info">
						<p class="name">Brighteness</p>
						<p class="value">100%</p>
					</div>
					<input type="range" value="100" min="0" max="200">
				</div>
			</div>
			<div class="rotate">
				<label class="title">Rotate & Flip</label>
				<div class="options">
					<button id="left">
						<i class="fa-solid fa-rotate-left"></i>
					</button>
					<button id="right">
						<i class="fa-solid fa-rotate-right"></i>
					</button>
					<button id="horizontal">
						<i class='bx bx-reflect-vertical'></i>
					</button>
					<button id="vertical">
						<i class='bx bx-reflect-horizontal'></i>
					</button>
				</div>
			</div>
		</div>
		<div class="preview-img">
			<img src="${path}/img/preview-available.png" alt="preview-img">
		</div>
	</div>
	<div class="controls">
		<button class="reset-filter">Reset Filters</button>
		<div class="row">
			<input type="file" class="file-input" accept="image/*" hidden>
			<button class="choose-img">Choose Image</button>
			<button class="save-img">Save Image</button>
		</div>
	</div>
</div>

<script src="${path}/js/script.js"></script>

