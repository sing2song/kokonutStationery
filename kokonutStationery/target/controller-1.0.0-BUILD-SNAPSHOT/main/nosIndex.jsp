<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko" class="windows chrome pc">
<head>
<title>KOKONUT STATIONERY</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">

<!-- 파비콘 각 페이지마다 들어가야 함 -->
<link rel="shortcut icon" href="../image/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../css/slick.css" />
<link rel="stylesheet" type="text/css" href="../css/slick-theme.css" />

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
* {
	margin:0; padding:0;
	list-style-type:none;
}

#wrap {
	width:100%;
}

#header_main {
	width:100%;
	height:90px; 
	position:fixed; 
	top:0px; 
	border-bottom:1px solid #f0f0f0;
	z-index:10; 
	background:#ffffff;
}

#main_wrap {
	width:100%; 
	margin-top:90px;
	z-index:11;
}

#slider_wrap {
	width:1000px;
	height:500px; 
	margin:auto;
}

#main_slider {
	width:2500px; 
	height:500px; 
	overflow:visible; 
	position:relative; 
	left:-70%;
}

#main_slider img {
	left:-20%;
}

a#topBtn {
	position:fixed;
	right:4%;
	bottom:50px;
	display:none;
	z-index:999;
}
</style>
</head>

<body>
	<div id="wrap"><!-- 페이지 전체를 감싸는 div -->
		<!-- header 시작 -->
		<div id="header_main">
			<jsp:include page="../template/header.jsp" />
		</div>
		<!-- header 끝 -->
	
	
		<!-- main container 시작 -->
		<div id="main_wrap">
			<div id="">
				<jsp:include page="${display }"/>
			</div><!-- content_wrap -->
			
			<a href="#" id="topBtn">
				<img src="../image/topBtn.png" />
			</a>
		
			<jsp:include page="../template/footer.jsp" />	
		</div><!-- main_wrap_end -->
	
	</div><!-- wrap_end -->
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/slick.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$(window).scroll(function(){
		if($(this).scrollTop() > 400){
			$('#topBtn').fadeIn();
		} else {
			$('#topBtn').fadeOut();
		}
	});
	
	$('#topBtn').click(function(){
		$('html, body').animate({
			scrollTop : 0
		}, 400);
		return false;
	});
	
});
</script>
</html>




