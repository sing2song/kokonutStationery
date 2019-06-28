<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 페이지</title>
<link rel="stylesheet" href="../css/goods_view.css?alert">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="../js/goods_view.js?alert"></script>
</head>
<body>
<div id="main">
	<!-- 상단 메뉴바 -->
	<div id="header">
		<div id="header_area">
			<img id="banner_img" src="../image/banner.PNG">
		</div>
	</div>
	<!-- 전체 div -->
	<div id="goodsView_area">
		<!-- 상품 소개 페이지 -->
		<div id="goods_main">
			<div id="goods_image">
				<img src="http://store.baemin.com/shop/data/goods/1479885082318m0.jpg" name="thumbImg" width="400">
			</div>
			<div id="goods_subject">
				<div>
					<b name="productName" style="font-size: 20pt; font-weight: 700;">스티커. 취급주의 외 7종</b>
				</div>
				<div style="padding: 17px;">
				</div>
				<div>
					<div class="items">판매가격</div>
					<div class="item_contents" name="discountPrice">1,500원</div>
				</div>
				<div>
					<div class="items">원산지</div>
					<div class="item_contents" name="origin">한국</div>
				</div>
				<div>
					<div class="items">제조사</div>
					<div class="item_contents" name="manufacturer">(주)우아한형제들</div>
				</div>	
				<div>
					<div class="items" style="padding:5px 0;">종류</div>
					<select class="item_contents_select" name="option">
						<option>옵션을 선택하세요</option>
						<option value="스티커_대한민국" name="optionContent">스티커_대한민국</option>
						<option value="스티커_봉인해제" name="optionContent">스티커_봉인해제</option>
						<option value="스티커_비상구" name="optionContent">스티커_비상구</option>
						<option value="스티커_비행청소년" name="optionContent">스티커_비행청소년</option>
					</select>
				</div>				
			</div>
			<div id="goods_buttons">
				<li class="main_button">구매하기</li>
				<li class="sub_button" style="border-right: none; float:left;">장바구니</li>
				<li class="sub_button" style="float:right;">찜하기</li>
			</div>
			<div style="width:100%; height:60px; display:inline-block;"></div>
		</div>
		<div style="width:100%; height:60px;"></div>
		<!-- 상품 소개 페이지 끝 -->
		<!-- 상품 내용 -->
		<div id="goods_content">
			<img src="http://store.baemin.com/shop/data/editor/f3472d40a92a3e20.jpg" name="detailedImg" />
			<div id="goods_information">
				<div id="delivery_information">
					<div class="information_subject">배송 관련 안내</div>
					<div class="information_contents">
						- 당일 오후 2시 결제건에 한해 당일발송됩니다.<br>
						- CJ대한통운 택배로 발송됩니다."<br>
						- 배송비는 2,500원입니다. (3만원 이상 구매시 무료배송)<br>
						- 더 자세한 내용은 공지사항의 '배송안내' 를 참고 하시기 바랍니다. <a href="" style="color: #2AC1BC; text-decoration: underline;">배송안내 보러가기</a><br>
					</div>
				</div>
				<div style="padding:10px;"></div>
				<div id="exchange_information">
					<div class="information_subject">교환 및 환불 안내</div>
					<div class="information_contents">
						- 상품수령일로부터 7일 이내에 반품/교환/취소가 가능합니다.<br>
						- 상품의 하자 및 오배송 등의 사유로 교환, 환불진행시 배송비용은 배민문방구에서 부담합니다.<br>
						- 단순변심으로 인한 교환, 반품을 하실 경우 반송비용은 고객님께서 부담하셔야 합니다.<br>
						- 포장이 훼손되어 상품가치가 상실된 경우에는 교환/반품이 불가합니다.<br>
						- 교환, 환불 신청은 1:1 문의게시판에 남기거나, 고객센터(1670-9902)로 전화주세요.<br>
					</div>
				</div>
			</div>
			<div>
				<div class="userPage_div">
					<p>후기</p>
				</div>
				<div>
					<div class="userPage_area" id="review_01">
						<div class="userPage_subject">후후후후후 간지 폭발 스티커 감사합니다
						&nbsp;
						<img src="../image/file_icon.png" style="width:18px; height:18px; vertical-align:middle;"></div>
						<div class="userPage_name">uela13**</div>
						<div class="userPage_date">2017.11.10</div>
					</div>
					<br>
					<div class="userPage_content" id="review_01_content">
						<img src="http://store.baemin.com/shop/data/review/RV0000008371" style="width:60%;">
						<br><br>
						보드 새로 장만하신 분께 선물로 드렸는데<br>
						완전 행복해하시네여 +_+<br>
						더 사드릴걸 그랬습니다 껄껄<br>
						<button class="review_reply_btn">답변</button><br>
					</div>
					<div class="userPage_area" id="review_02">
						<div class="userPage_subject"><span style="color:#2AC1BC; font-weight:700;">답변 : </span>[배민문방구] 답변드립니다.</div>
						<div class="userPage_name">admin</div>
						<div class="userPage_date">2017.11.10</div>
					</div>
					<div class="userPage_content" id="review_02_content">
						안녕하세요, 고객님 : )<br>
						배민문방구입니다.<br><br>
						
						보드에 쓰실 생각을 하시다니!!!!!<br> 
						넘나 예쁠 것 같은 것 ///_// 껄껄<br>
						오늘 하루도 재미있고 행복한 하루 보내세요~<br><br>
						
						감사합니다.<br>
						배민문방구 드림.<br>
					</div>
					<div class="userPage_paging">
					</div>
					<div class="userPage_buttons">
						<a href="/baeminproject/goods/goods_review">
							<li id="review_list_btn" class="userPage_sub_button">목록</li>
						</a>
						<li id="review_regist_btn" class="userPage_main_button">작성</li>
					</div>
					<div class="userPage_paging_num"><b>1</b></div>
				</div>
			</div>
			<div>
				<div class="userPage_div">
					<p>문의</p>
				</div>
				<div>
					<div class="userPage_area" id="qna_01">
						<div class="userPage_subject">
							<span style="color:#2AC1BC; font-weight:700;">질문 : </span>일등석 스티커
							<img src="../image/private_lock.gif">
						</div>
						<div class="userPage_name">ㄱㅈㅇ</div>
						<div class="userPage_date">2017-08-30</div>
					</div>
					<br>
					<div class="userPage_content userPage_private_lock" id="qna_01_content">비밀글입니다.</div>
					<div class="userPage_area" id="qna_02">
						<div class="userPage_subject">
							<span style="color:#2AC1BC; font-weight:700;">답변 : </span>[배민문방구] 문의 답변드립니다.
							<img src="../image/private_lock.gif">	
						</div>
						<div class="userPage_name">admin</div>
						<div class="userPage_date">2017-08-30</div>
					</div>
					<div class="userPage_content userPage_private_lock" id="qna_02_content">비밀글입니다.</div>
					<div class="userPage_paging">
					</div>
					<div class="userPage_buttons">
						<a href="/baeminproject/goods/goods_qna">
							<li id="qna_list_btn" class="userPage_sub_button">목록</li>
						</a>
						<li id="qna_regist_btn" class="userPage_main_button">작성</li>
					</div>
					<div class="userPage_paging_num"><b>1</b></div>
				</div>
			</div>
		</div>
	</div>
	<!-- 푸터이미지 -->
	<div id="footer">
		<div id="footer_img_area">
			<img src="../image/footer.PNG" id="footer_img">
		</div>
	</div>
</div>
</body>
</html>