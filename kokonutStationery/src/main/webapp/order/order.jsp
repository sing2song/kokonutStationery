<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="../css/order.css">    

<div class="indiv2" style="width:1000px; margin-top:135px;"><!-- Start indiv -->
	<div class="in_tit" style="font-size: 22px; font-weight: 700; text-align: left;color:#222;">
		주문하기
	</div>
	
	<div style="margin: 30px 0 0 0;">
		<h5 class="order_tit" style="font-size: 16px; font-weight: 700; text-align: left; margin: 0 0 13px 0;">주문상세내역</h5>
	</div>
	
	<!-- 주문상세내역 -->
	<table width="100%" cellpadding="0" cellspacing="0" border="0" class="table_tit_style02" style="margin-top: 15px;">
		
		<thead>
			<tr>
				<th colspan="2" style="border-top: 1px solid #999; font-size: 12px; color: #999; text-align: left; padding-left: 15px; font-weight:500;">상품정보</th>
				<th style="border-top: 1px solid #999; font-size: 12px; color: #999; text-align: right; padding-right:50px;">판매가</th>
				<th style="border-top: 1px solid #999; font-size: 12px; color: #999; font-weight:500;">수량</th>
				<th style="border-top: 1px solid #999; font-size: 12px; color: #999; text-align: right; padding-right:20px; font-weight:500;">합계</th>
			</tr>
		</thead>
		<!-- 제품상세내역 -->
		<tbody id="tbody">		
			
		</tbody>
		
		<tfoot id="tfooter">
			<tr>
				<td colspan="10" style="padding: 30px 0;">
					<table width="100%" cellpadding="0" cellspacing="0" border="0" class="total_price_area">
						<tbody>
							<tr class="total_price" style="padding-right: 0px;">
								<td>
									<font style="color:#333;font-weight:500;">상품합계금액 (배송비 별도)</font>&nbsp;&nbsp;&nbsp;&nbsp;
									<font id ="totalPrice" style="font-family:'Montserrat', sans-serif; font-size:24px; color:#2ac1bc; font-weight:700;"></font>
									<font style="font-size:15px;color:#2ac1bc;font-weight:700;">원</font>									
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tfoot>
	</table>
	<c:if test="${memId != null }">
	<form id="orderForm" method="post" action="" onsubmit="return chkOrder('${memId}');">
	</c:if>
	<c:if test="${kokonutId != null }">
	<form id="orderForm" method="post" action="" onsubmit="return chkOrder('${kokonutId}');">
	</c:if>
		<c:if test="${memId == null }" >
		<!-- 개인정보취급방침 -->
		<div id="agreementDiv" style="position:relative; visibility:visible;">
			<div style="margin: 50px 0 0 0; border:none;">
				<h5 class="join_tit" style="font-size: 16px; font-weight: 700; text-align: left; margin: 0 0 13px 0;">개인정보취급방침</h5>
			</div>
			
			<div class="join_agreement" style=" text-align:center; position:relative;">
				<!-- 개인정보보호를 위한 이용자 동의사항 -->
				<div align="right" style="height:26px; position:absolute; top:-28px; right:0;" class="private_info">
					개인정보보호를 위한 이용자 동의사항 (자세한 내용은 <a href="../servicePrivate" style="color:#999"><u>개인정보취급방침</u></a>을 확인하시기 바랍니다)
				</div>
				
				<div class="boxScroll scroll private_textarea" style="width:100%; height:250px; margin:0; padding:25px;">
					
						회사는 회원님께서 회원가입, 상품구매 및 배송 서비스의 원활한 제공을 위해 최소한의 범위 내에서 아래와 같이 개인정보 수집·이용합니다. <br />
						<br />
						(1) 회원 정보의 수집·이용목적, 수집항목, 보유·이용기간은 아래와 같습니다.<br />
						<img src="../image/private_5_1.gif" style="width: 100%;"><br />
						<br />
						(2) 법령에 의하여 수집·이용되는 이용자의 정보는 아래와 같은 수집·이용목적으로 보관합니다.<br />
						<img src="../image/private_6_1.gif" style="width: 100%;"><br />
						<br />
						(3) 이용자가 선택정보에 동의를 거부하더라도 배민문방구 서비스 이용은 가능합니다. <br />
						<br />
						(4) 그 밖의 사항은 ㈜우아한형제들 개인정보처리방침 운영에 따릅니다.
					
				</div>
				
			</div>
		
			<div align="right" style="margin-top:15px; text-align:center;" >
				<input type="radio" name="private1" value="yes" required>
					<label style="font-size:13px; color:#333;"><b>동의합니다</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="private1" value="no">
					<label style="font-size:13px; color:#333;">동의하지 않습니다</label>
			</div>
		</div>
		</c:if>
	
		<div style="margin: 30px 0 0 0;">
			<h5 class="order_tit" style="font-size: 16px; font-weight: 700; text-align: left; margin: 0 0 13px 0;">주문서 작성</h5>
		</div>
		
		<!-- 주문자 정보 -->
		<table width="100%" cellpadding="0" cellspacing="0" border="0" class="box_style_01" 
			style="background-color: #fff; margin-bottom:20px; padding: 30px 30px 30px 40px; border: 1px solid #ddd;">
		    <tr>
			    <td class="box_tit" style="font-size: 15px; color: #333; font-weight:700;">주문자정보</td>
			</tr>
			<tr>
				<td>
				  	<table width="100%" cellpadding="0" cellspacing="0" border="0" style="padding-top:10px;">
						<tbody>
						    <tr>
						      <td class="box_sub_tit" style="width:150px; font-size: 13px; color: #666; font-weight:normal; padding-top: 5px;">주문하시는분 :</td>
						      <td style="padding-top: 5px;">
						      <c:if test="${memId != null }">
						          <input type="text" name="userName" id="userName" value="${userDTO.userName }" readonly required>
						      </c:if>
						      <c:if test="${memId == null }">
						          <input type="text" name="userName" id="userName" value="" required>
						      </c:if>
						     </td>
						     
						    </tr>
								 
							<tr>
								<td class="box_sub_tit" style="font-size: 13px; color: #666; font-weight:normal;">주문자 핸드폰 :</td>
								<td style="padding:5px 0">
								   <input type="text" name="userPhone1" id="userPhone1" value="${userDTO.userPhone1 }" size="3" maxlength="3" label="주문자 핸드폰번호" 
								   style="width:60px;" required>
								    &nbsp;-&nbsp;
								   <input type="text" name="userPhone2" id="userPhone2" value="${userDTO.userPhone2 }" size="4" maxlength="4" label="주문자 핸드폰번호" 
								   style="width:60px;" required>
								    &nbsp;-&nbsp;
								   <input type="text" name="userPhone3" id="userPhone3" value="${userDTO.userPhone3 }" size="4" maxlength="4" label="주문자 핸드폰번호" 
								   style="width:60px;" required>
								</td>
							</tr>
							
							
							<tr>
					            <td class="box_sub_tit" style="font-size: 13px; color: #666; font-weight:normal;">이메일 :</td>
					            <td style="padding:5px 0">
					              <input type="text" name="userEmail" id="userEmail" value="${userDTO.userEmail }" 
					              style="width:211px;">
					            </td>
				          	</tr>
			               </tbody>
			           </table>
				</td>
			</tr>
		</table>
	
		<!-- 배송 정보 -->
		<table width="100%" cellpadding="0" cellspacing="0" border="0" class="box_style_01" 
		style="margin-bottom:20px; background-color: #fff; padding: 30px 30px 30px 40px; border: 1px solid #ddd;">
		    <tr class="box_tit">
			      <td style="font-size: 15px; color: #333; font-weight:700;">배송정보</td>
			</tr>
			<tr>
			      <td>
			        <table width="100%" cellpadding="0" cellspacing="0" border="0" style="padding-top:10px;">
			          <tbody>
			          	<c:if test="${memId != null }">
				          <tr>
				            <td style="width:150px; font-size: 13px; color: #666; font-weight:normal; padding-top: 10px;">배송지 확인 :</td>
				            <td style="font-size: 13px; color: #333; font-weight:normal; padding-top: 10px;">
				              <input type="checkbox" id="sameInfo" style="height: 14px;"> 주문고객 정보와 동일합니다
				            </td>
				          </tr>
				        </c:if>
				          <tr>
				            <td style="font-size: 13px; color: #666; font-weight:normal;padding: 15px 0 5px 0;">받으실분 :</td>
				            <td style="padding: 15px 0 5px 0;">
				              <input type="text" name="receiverName" id="receiverName" value="" required 
				              style="width:205px;">
				            </td>
				          </tr>
				          <tr>
				            <td style="font-size: 13px; color: #666; font-weight:normal;">받으실곳 :</td>
				            <td style="padding:5px 0">
				              <input type="text" name="receiverZipcode" id="receiverZipcode" size="5" readonly required
								style="width:100px;" placeholder="우편번호">
				              
				              <div class="sub-button-s" id="daumCheckPost" onclick="daumCheckPost()"
				              style="text-align:center; width: 112px;height: 42px;position: absolute; margin: -40px 0 0 120px;line-height: 42px; font-size: 12px;" align="absmiddle">우편번호 검색</div>
				            </td>
				            
				          </tr>
				          <tr>
				            <td style="font-size: 13px; color: #666; font-weight:normal;"></td>
				            <td style="padding:5px 0">
				              <input type="text" name="receiverAddr1" id="receiverAddr1" 
				              style="width:400px;" placeholder="도로명 주소" required readonly>
				            </td>
				          </tr>
				          <tr>
				            <td style="font-size: 13px; color: #666; font-weight:normal;"></td>
				            <td style="padding:5px 0">
				              <input type="text" name="receiverAddr2" id="receiverAddr2" label="세부주소"
				              style=" width:345px;" placeholder="세부주소">
				              <div style="padding:5px 0 0 1px;font:12px dotum;color:#999;" id="div_road_address_sub"></div>
				            </td>
				          </tr>
				          <tr>
				            <td style="font-size: 13px; color: #666; font-weight:normal;"></td>
				            <td style="padding:5px 0"></td>
				          </tr>
						  <tr>
				            <td style="font-size: 13px; color: #666; font-weight:normal;">핸드폰번호 :</td>
				            <td style="padding:5px 0">
				              <input type="text" name="receiverPhone1" id="receiverPhone1" size="3" maxlength="3" required label="수령자 핸드폰번호" 
				              style="width:60px;">
				               &nbsp;-&nbsp;
				              <input type="text" name="receiverPhone2" id="receiverPhone2" size="4" maxlength="4" required label="수령자 핸드폰번호" 
				              style="width:60px;">
				               &nbsp;-&nbsp;
				              <input type="text" name="receiverPhone3" id="receiverPhone3" size="4" maxlength="4" required label="수령자 핸드폰번호" 
				              style="width:60px;">
				            </td>
				          </tr>
				          <tr>
				            <td style="font-size: 13px; color: #666; font-weight:normal;">남기실 말씀 :</td>
				            <td style="padding:5px 0">
				              <input type="text" name="deliveryMsg" id="deliveryMsg" 
				              style="border:1px solid #DDD; width:370px; padding-left: 10px; font-size:13px; color: #333; -webkit-appearance:none; border-radius:0;">
				            </td>
				          </tr>
			          
			          	 
				          <tr id="paper_delivery_menu">
				            <td style="font-size: 13px; color: #666; font-weight:normal;">배송선택 :</td>
				            <td style="padding:5px 0; font-size: 13px; color: #333; font-weight:normal;">
				              <input type="radio" name="deliveryOption" value="0" checked style="height: 14px; border-color: #fff;">기본배송
				            </td>
				          </tr>
				        	                
			          	</tbody>
			          </table>
			  
			      </td>
			</tr>
		</table>
	
		
		<!-- 결제 금액 -->
		<table width="100%" cellpadding="0" cellspacing="0" border="0" class="box_style_01" 
		style="margin-bottom:20px; background-color: #fff; padding: 30px 30px 30px 40px; border: 1px solid #ddd;">
		    <tr class="box_tit">
			   <td style="font-size: 15px; color: #333; font-weight:700;">결제금액</td>
			</tr>
			
		    <tr>
		      <td>	    
		        <table width="100%" cellpadding="0" cellspacing="0" border="0" style="padding-top:10px;">
		        	<tbody>
			        	<tr>
				            <td style="width:150px; font-size: 13px; color: #666; font-weight:normal; padding-top: 10px;">상품합계금액 :</td>
				            <td class="noline" style="font-size: 13px; color: #666; font-weight:normal; padding-top: 10px;">
				            	<span id="goodsPrice"></span><span id="paper_goodsprice" style="font-weight:normal; color:#333;">원</span>
				            </td>  
			          	</tr>
						<tr>
							<td style="font-size: 13px; color: #666; font-weight:normal; padding: 15px 0 5px 0;">배송비 :</td>
							<td class="noline" style="font-size: 13px; color: #333; font-weight:normal; padding: 15px 0 5px 0;">
								<div id="" style="display: block;">+ <span id="paper_delivery" style="font-weight:normal; color:#333;"></span> 원</div>
								
							</td>
						</tr>
						
						<tr id="pointTr">
						  <td valign="top" style="font-size: 13px; color: #666; font-weight:normal; padding: 28px 0 5px 0;">포인트 사용 :</td>
						<td style="font-size: 13px; color: #333; font-weight:normal; padding: 15px 0 5px 0;">
						
						<table cellpadding="0" cellspacing="0">
							<tbody>
							  <tr>
							    <td width="130" align="left" style="font-size: 13px; color: #333; padding: 0 0 10px 0;">사용가능 포인트</td>
								<td style="padding: 0 0 10px 0;">
								<input type="text" id="totalPoint" name="coupon" size="12" readonly
								style="text-align:right;"> 원
							
								</td>								
							  </tr>
							  
							  <tr>
							  	<td width="130" align="left" style="font-size: 13px; color: #333; padding: 0 0 10px 0;">사용 할 포인트</td>
								<td style="padding: 0 0 10px 0;">
								<input type="text" id="usingPoint" name="coupon" size="12" value="0" 
								style="text-align:right;" onchange="usePoint()"> 원
							
								</td>	
							  </tr>
							  
							  <tr>
							  	<td width="130" align="left" style="font-size: 13px; color: #333; padding: 0 0 10px 0;">사용 후 남은 포인트</td>
								<td style="padding: 0 0 10px 0;">
								<input type="text" id="remainingPoint" name="coupon" size="12" readonly 
								style="text-align:right;"> 원
							
								</td>	
							  </tr>
		              		</tbody>
		              </table>
		        
		            </td>
		          </tr>
		          
		          <tr>
		            <td style="font-size: 13px; color: #666; font-weight:normal; padding-top: 10px;">총 결제금액 :</td>
		            <td style="font-size: 13px; color: #333; font-weight:normal; padding: 15px 0 5px 0;">
			            <span id="totalP" style="width:146px; text-align:right; font-size:28px; color:#2ac1bc; font-weight:700; 
			            font-family: 'Montserrat', sans-serif, 'Noto Sans KR', sans-serif,Arial, dotum, 돋움;"></span>
			            <span style="font-size:16px; color:#2ac1bc; font-weight:700;">원</span>
		            </td>
		          </tr>
		        </tbody>
		        </table>
		      </td>
		    </tr>
	
		 </table>
	
		<!-- 결제 수단 -->
		<table width="100%" cellpadding="0" cellspacing="0" border="0" class="box_style_01" 
		style="margin-bottom:20px; background-color: #fff; padding: 30px 30px 10px 40px; border: 1px solid #ddd;">
		    <tbody>
			    <tr class="box_tit">
			      <td style="font-size: 15px; color: #333; font-weight:700;">결제수단</td>
			    </tr>
			    <tr>
			      <td>
			    
			        <table width="100%" cellpadding="0" cellspacing="0" border="0" style="padding-top:10px;">
			          
			          <tbody>
				          <tr>
				            <td style="width:150px; font-size: 13px; color: #666; font-weight:normal; padding: 15px 0 5px 0;">일반결제 :</td>
				            <td style="font-size: 13px; color: #333; font-weight:normal; padding: 15px 0 5px 0;">
				              <input type="radio" name="payType" value="0" style="height: 14px; border-color: #fff;" checked> 신용카드&nbsp;&nbsp;&nbsp;&nbsp;
				              <input type="radio" name="payType" value="1" style="height: 14px; border-color: #fff;"> 핸드폰&nbsp;&nbsp;&nbsp;&nbsp;
				            </td>
				          </tr>
		       	 	  </tbody>
		        	</table>
		          </td>
				</tr>
			</tbody>		
		</table>
	
		
		<!-- 취소 / 다음 -->
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tbody>
			      <tr>
			        <td align="center" height="100">
			          <div style="width:100%" class="noline">
			            <div style="width: 180px; display: inline-block;">
			            	<div id="order_cancelBtn" class="sub-button-s" 
			            	style="text-align:center; height:60px; width:150px; line-height:55px; font-size: 14px; font-weight:700;">취소</div>			            
			            </div>
			            <div style="width: 180px; display: inline-block; padding-left: 5px;">
							<input type="button" id="orderWriteBtn" class="main-button-s" 
							style="border:0px; text-align:center; height:60px; width:150px; line-height:55px; font-size: 14px; font-weight:700;" value="다음">			
						</div>					
			          </div>
			        </td>
			      </tr>
		    </tbody>
		</table>
	</form>
</div>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/order.js"></script>
<script>

var userName = '${userDTO.userName }';
var userPhone1 = '${userDTO.userPhone1 }';
var userPhone2 = '${userDTO.userPhone2 }';
var userPhone3 = '${userDTO.userPhone3 }';
var option = ${goodsDTO.productOption};

$(function(){
	//구매하기버튼 : 상품1개에 대한 구매
	//옵션이 없는 경우
	if(option == 0){
		createTabNoOption();
	}
	//옵션이 있는 경우
	else{
		var optionStr = '${selValue}';
		var optionContent = optionStr.split(",");
		var qtyStr = '${pdQtyValue}';
		var productQty = qtyStr.split(",");
		
		createTabOption(optionContent, productQty);
	}
	totalP();
	
	//비회원일 때 포인트사용 테이블 출력안되도록! 
	if('${memId}' == ''){
		$('#pointTr').css('display','none');
	}
});

//배송정보 확인 클릭
$('#sameInfo').click(function(){
	if($('#sameInfo').prop('checked')){
		$('#receiverName').val(userName);
		$('#receiverPhone1').val(userPhone1);
		$('#receiverPhone2').val(userPhone2);
		$('#receiverPhone3').val(userPhone3);
	}else{
		$('#receiverName').val('');
		$('#receiverPhone1').val('');
		$('#receiverPhone2').val('');
		$('#receiverPhone3').val('');
	}
});

//다음 주소 API
function daumCheckPost() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
          

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
       
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            
         	// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                	addr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                	addr += (addr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                                 
            } else {
                document.getElementById("receiverAddr1").value = '';
            }
          
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('receiverZipcode').value = data.zonecode;
            document.getElementById("receiverAddr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("receiverAddr2").focus();
        }
    }).open();
}


//제품 1개에 대한 table 생성 : 옵션없음
function createTabNoOption(){
	$('<tr/>').append($('<td/>',{
		style: "vertical-align:top; padding: 30px 0;"
		}).append($('<a/>',{
			href : "#",
			style : "margin-bottom:0;"		
			}).append($('<img>',{
				src : '../image/thumb/'+ '${goodsDTO.thumbImg}',
				width : "70"
				
	})))).append($('<td>',{
		class : "order_option",
		style : "text-align:left;vertical-align:top; "
		}).append($('<div/>',{
			text : '${goodsDTO.productName}',
			style : "color: #222; height:auto; font-weight: 700; font-size: 14px; padding: 30px 0; margin:20px 0 20px 0;"
			
	}))).append($('<td>',{
		text : '${goodsDTO.discountPrice}',
		style : "color: #222; vertical-align:middle; padding: 30px 50px 30px 0; text-align:right;"
		}).append($('<span/>',{
			text : '원'
			
	}))).append($('<td/>',{
		style : "vertical-align: middle; padding: 22px 0 30px 0;"
		}).append($('<div/>',{
			style : "padding-top: 8px; vertical-align: middle; color:#222;",
			text : '${productQty}'
			}).append($('<span>',{
				text : '개'
				
	})))).append($('<td>',{
		class : 'totalPrice',
		tyle : "vertical-align: middle; color:#333; text-align:right; padding: 30px 20px 0 0; font-weight:700; ",
		text : '${goodsDTO.discountPrice * productQty}'
		}).append($('<span/>', {
			text : '원'
	}))).appendTo($('#tbody'));
}

//제품 1개에 대한 table 생성 : 옵션있음
function createTabOption(optionContent, productQty){
	for(var i = 0; i< optionContent.length-1; i++ ){
		$('<tr/>').append($('<td/>',{
			style: "vertical-align:top; padding: 30px 0;"
			}).append($('<a/>',{
				href : "#",
				style : "margin-bottom:0;"		
				}).append($('<img>',{
					src : '../image/thumb/'+ '${goodsDTO.thumbImg}',
					width : "70"
		})))).append($('<td>',{
			class : "order_option",
			style : "text-align:left;vertical-align:middle; padding: 30px 0;"
			}).append($('<div/>',{
				text : '${goodsDTO.productName}',
				style : "color: #222; font-weight: 700; font-size: 14px; ",
			})).append($('<div>', {
				text : '선택옵션 : ',
			})).append($('<div/>',{
				text : optionContent[i] +'/'
		}))).append($('<td>',{
			text : '${goodsDTO.discountPrice}',
			style : "color: #222; vertical-align: middle; padding: 30px 50px 30px 0; text-align:right;"
			}).append($('<span/>',{
				text : '원'
		}))).append($('<td/>',{
			style : "vertical-align:middle; padding: 22px 0 30px 0;"
			}).append($('<div/>',{
				style : "padding-top: 8px; vertical-align: middle; color:#222;",
				text : productQty[i]
				}).append($('<span>',{
					text : '개'
		})))).append($('<td>',{
			class : 'totalPrice',
			tyle : "vertical-align:middle; color:#333; text-align:right; padding: 30px 0; font-weight:700; padding-right:20px;",
			text : '${goodsDTO.discountPrice}' * productQty[i]
			}).append($('<span/>', {
				text : '원'
		}))).appendTo($('#tbody'));
	
	}  
}


//상품합계금액과 포인트 
function totalP(){
	var totalPriceArray = new Array();
	totalPriceArray = $('.totalPrice');
	var totalP = 0;
	for(var i=0; i<totalPriceArray.length; i++){
		var price = totalPriceArray.eq(i).text();
		price = price.slice(0, price.length-1) * 1;
		totalP += price;
	}
	$('#totalPrice').text(AddComma(totalP));
	
	//포인트
	var totalPoint = ${userDTO.userPoint};
	var usingPoint = $('#usingPoint').val(0);
	var remainingPoint = $('#remainingPoint').val(totalPoint);	
	$('#totalPoint').val(totalPoint);
	
	if(totalP >= 30000){ //결제금액이 30000원부터는 배송료 무료 
		$('#goodsPrice').text(AddComma(totalP));
		$('#paper_delivery').text(0);
		$('#totalP').text(AddComma(totalP))
	}
	
	else {
		$('#goodsPrice').text(AddComma(totalP));
		$('#paper_delivery').text(AddComma(2500));
		$('#totalP').text(AddComma(totalP+2500))
	}
}

//포인트 사용
function usePoint(){
	var usePoint = $('#usingPoint').val();
	var totalPoint = ${userDTO.userPoint};
	var totalP = stringNumberToInt($('#goodsPrice').text())
				+ stringNumberToInt($('#paper_delivery').text());  //포인트사용전의 결제금액

	//숫자만 들어오게 유효성 검사
	if(isNaN(usePoint)){
		alert("1000원 단위의 숫자를 입력해주세요");
		$('#usingPoint').val(0);
	}
				
	//1000단위로 사용
	else if( usePoint < 1000 && usePoint > 0){
		alert("1000원 이상부터 사용가능합니다")
		$('#usingPoint').val(0);
	}
				
	//사용 가능한 포인트보다 큰 숫자 제한		
	else if(totalPoint < usePoint) {
		alert("사용 가능한 포인트보다 큰 숫자는 입력하실 수 없습니다.")
		$('#usingPoint').val(0);
	}
				
	//총 결제금액보다 큰 숫자 제한		
	else if(totalP < usePoint) {
		alert("총 결제금액보다 큰 숫자는 입력하실 수 없습니다.")
		$('#usingPoint').val(0);
	}		

	else {
		var remainPoint = totalPoint*1 - usePoint*1;
		var usePoint = $('#usingPoint').val();
		$('#remainingPoint').val(remainPoint);
		totalP = totalP - usePoint;
		$('#totalP').text(AddComma(totalP));
	}
}

//숫자 3자리당 쉼표찍기
function AddComma(number) {
	return Number(number).toLocaleString('en');
}

//콤마찍힌 숫자 정수형으로 변환
function stringNumberToInt(stringNumber){
    return parseInt(stringNumber.replace(/,/g , ''));
}


//'다음' 버튼 이벤트
// /kokonutStationery/order/order_settle.do로 이동
$('#orderWriteBtn').click(function(){
	
	deletePreOrder();
	
	var privateVal = $('input[name="private1"]:checked').val();
	var chkPhone = /^(?=.*[0-9]).{3,4}$/;//3자리수
	var chkPhone2 = /^(?=.*[0-9]).{4,5}$/;//4자리수
	var chkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	var receiverName = $('#receiverName').val();
	var paywayVal = $('input[name="payType"]:checked').val();
	var kId = 'Kokonut';
	
	//alert('${memId}');
	//alert('${kokonutId}');
	//alert(${kokonutId});
	//alert('${kokonutId}'.indexOf(kId));
	
	//유효성검사
	if('${memId}'==''){
		if(privateVal!='yes' && '${kokonutId}'.indexOf(kId) == 0){
			alert("[개인정보보호를 위한 이용자 동의사항]에 동의를 하셔야 주문이 가능합니다.");
			return false;		
		}
	}
	if(!/^(?=.*[가-힣]).{2,20}$/.test($('#userName').val())){
			alert("올바른 이름 형식이 아닙니다.");
			$('#userName').focus();
			return false;	 
	}else if( !chkPhone.test($('#userPhone1').val())){
		alert("올바른 전화번호 형식이 아닙니다.");
		$('#userPhone1').focus();
		return false;
	}else if( !chkPhone2.test($('#userPhone2').val())){
		alert("올바른 전화번호 형식이 아닙니다.");
		$('#userPhone2').focus();
		return false;
	}else if( !chkPhone2.test($('#userPhone3').val())){
		alert("올바른 전화번호 형식이 아닙니다.");
		$('#userPhone3').focus();
		return false;
	}else if( !chkEmail.test($('#userEmail').val()) ){
		alert("올바른 이메일 형식이 아닙니다.");
		$('#userEmail').focus();
		return false;
	}else if(!/^(?=.*[가-힣]).{2,20}$/.test($('#receiverName').val())){
		alert("올바른 이름 형식이 아닙니다.");
		$('#receiverName').focus();
		return false;
	}else if($('#receiverZipcode').val()==''){
		alert("주소를 입력해주세요");
		$('#receiverZipcode').focus();
		return false;
	}else if($('#receiverAddr2').val()==''){
		alert("세부주소를 입력해주세요.");
		$('#receiverAddr2').focus();
		return false;
	}else if( !chkPhone.test($('#receiverPhone1').val())){
		alert("올바른 전화번호 형식이 아닙니다.");
		$('#receiverPhone1').focus();
		return false;
		
	}else if( !chkPhone2.test($('#receiverPhone2').val())){
		alert("올바른 전화번호 형식이 아닙니다.");
		$('#receiverPhone2').focus();
		return false;
		
	}else if( !chkPhone2.test($('#receiverPhone3').val())){
		alert("올바른 전화번호 형식이 아닙니다.");
		$('#receiverPhone3').focus();
		return false;
	}
	
	//user정보 및 배송정보
	//회원
	if('${kokonutId}' == ''){
		$.ajax({
			type : 'POST',
			url : '/kokonutStationery/order/updateUserInfo.do',
			data : {'userId'			: '${memId}',
					'userName'			: '${memName}',
					'userPhone1'		: $('#userPhone1').val(),
					'userPhone2'		: $('#userPhone2').val(),
					'userPhone3'		: $('#userPhone3').val(),
					'userEmail'			: $('#userEmail').val(),
					'receiverName' 		: $('#receiverName').val(),
					'receiverAddr1' 	: $('#receiverAddr1').val(),
					'receiverAddr2' 	: $('#receiverAddr2').val(),
					'receiverZipcode' 	: $('#receiverZipcode').val(),
					'receiverPhone1' 	: $('#receiverPhone1').val(),
					'receiverPhone2' 	: $('#receiverPhone2').val(),
					'receiverPhone3' 	: $('#receiverPhone3').val(),
					'deliveryMsg' 		: $('#deliveryMsg').val() },
			dataType : 'text',
			success : function(data){
				if(data == "success"){
					//alert("고객배송정보보내기 성공");
				}
				else {
					alert("실패!!");
				}
			}
			
		});
		
		//상품정보 : orderDB
		if(option == 0){ //옵션이 없는 경우
			var purchaseQty = '${productQty}';
			//alert(typeof purchaseQty);
			
			$.ajax({
				type : 'POST',
				url : '/kokonutStationery/order/setOrderInfo.do',
				data : {'userId' 		: '${memId}',
						'userName' 		: '${memName}',
						'thumbImg' 		: '${goodsDTO.thumbImg}',
						'productCode' 	: '${goodsDTO.productCode}',
						'productName'	: '${goodsDTO.productName}',
						'discountPrice' : '${goodsDTO.discountPrice}',
						'purchaseQty' 	: purchaseQty,
						'totalPrice'	: '${goodsDTO.discountPrice*productQty}',
						'paymentType' 	: $('input[name="payType"]:checked').val()*1,
						'totalPayment' 	: stringNumberToInt($('#totalP').text()),
						'productOption' : '${goodsDTO.productOption}' },
				dataType : 'text',
				success : function(data){
					if(data == "success"){
						//alert("주문정보보내기 성공");
					} 
					else {
						//alert("실패!!");
					}
					
				}
				
			});
		}//if
		
		else { //옵션이 있는 경우(option = 1)
			var qtyStr = '${pdQtyValue}';
			var purchaseQty = qtyStr.split(",");
			var optionStr = '${selValue}';
			var optionContent = optionStr.split(",");
	
			for(i = 0 ; i < optionContent.length ; i++){
				$.ajax({
					type : 'POST',
					url : '/kokonutStationery/order/setOrderInfoOption.do',
					data : {'userId' 		: '${memId}',
							'userName' 		: '${memName}',							
							'thumbImg' 		: '${goodsDTO.thumbImg}',
							'productCode' 	: '${goodsDTO.productCode}',
							'productName'	: '${goodsDTO.productName}',
							'discountPrice' : '${goodsDTO.discountPrice}',
							'purchaseQty' 	: purchaseQty[i],
							'totalPrice'	: '${goodsDTO.discountPrice}' * purchaseQty[i],
							'paymentType' 	: $('input[name="payType"]:checked').val()*1,
							'totalPayment' 	: stringNumberToInt($('#totalP').text()),
							'productOption' : '${goodsDTO.productOption}',
							'optionContent' : optionContent[i] },
					dataType : 'text',
					success : function(data){
						if(data == "success"){
							//alert("주문정보보내기 성공");
						}
						else {
							//alert("실패!!");
						}
	
					}
				});
			}
		}//else
	}
	
	//비회원일때
	else if('${memId}' == ''){
		$.ajax({
			type : 'POST',
			url : '/kokonutStationery/order/updateUserInfo.do',
			data : {'userId'			: '${kokonutId}',
					'userName'			: $('#userName').val(),
					'userPhone1'		: $('#userPhone1').val(),
					'userPhone2'		: $('#userPhone2').val(),
					'userPhone3'		: $('#userPhone3').val(),
					'userEmail'			: $('#userEmail').val(),
					'receiverName' 		: $('#receiverName').val(),
					'receiverAddr1' 	: $('#receiverAddr1').val(),
					'receiverAddr2' 	: $('#receiverAddr2').val(),
					'receiverZipcode' 	: $('#receiverZipcode').val(),
					'receiverPhone1' 	: $('#receiverPhone1').val(),
					'receiverPhone2' 	: $('#receiverPhone2').val(),
					'receiverPhone3' 	: $('#receiverPhone3').val(),
					'deliveryMsg' 		: $('#deliveryMsg').val() },
			success : function(data){
				if(data == "success"){
					//alert("고객배송정보보내기 성공");
				}
				else {
					alert("실패!!");
				}
			}
			
		});
		
		//상품정보 : orderDB
		if(option == 0){ //옵션이 없는 경우
			var purchaseQty = '${productQty}';
			//alert(typeof purchaseQty);
			//var  a = $('input[name="payType"]:checked').val();
			//alert("a : "+a);
			$.ajax({
				type : 'POST',
				url : '/kokonutStationery/order/setOrderInfo.do',
				data : {'userId' 		: '${kokonutId}',
						'userName' 		: $('#userName').val(),
						'thumbImg' 		: '${goodsDTO.thumbImg}',
						'productCode' 	: '${goodsDTO.productCode}',
						'productName'	: '${goodsDTO.productName}',
						'discountPrice' : '${goodsDTO.discountPrice}',
						'purchaseQty' 	: purchaseQty,
						'totalPrice'	: '${goodsDTO.discountPrice*productQty}',
						'paymentType' 	: $('input[name="payType"]:checked').val()*1,
						'totalPayment' 	: stringNumberToInt($('#totalP').text()),
						'productOption' : '${goodsDTO.productOption}' },
				dataType : 'text',
				success : function(data){
					if(data == "success"){
						//alert("주문정보보내기 성공");
					} 
					else {
						//alert("실패!!");
					}
					
				}
				
			});
		}//if
		
		else { //옵션이 있는 경우(option = 1)
			var qtyStr = '${pdQtyValue}';
			var purchaseQty = qtyStr.split(",");
			var optionStr = '${selValue}';
			var optionContent = optionStr.split(",");
	
			for(i = 0 ; i < optionContent.length ; i++){
				$.ajax({
					type : 'POST',
					url : '/kokonutStationery/order/setOrderInfoOption.do',
					data : {'userId' 		: '${kokonutId}',
							'userName' 		: $('#userName').val(),
							'thumbImg' 		: '${goodsDTO.thumbImg}',
							'productCode' 	: '${goodsDTO.productCode}',
							'productName'	: '${goodsDTO.productName}',
							'discountPrice' : '${goodsDTO.discountPrice}',
							'purchaseQty' 	: purchaseQty[i],
							'totalPrice'	: '${goodsDTO.discountPrice}' * purchaseQty[i],
							'paymentType' 	: $('input[name="payType"]:checked').val()*1,
							'totalPayment' 	: stringNumberToInt($('#totalP').text()),
							'productOption' : '${goodsDTO.productOption}',
							'optionContent' : optionContent[i] },
					dataType : 'text',
					success : function(data){
						if(data == "success"){
							//alert("주문정보보내기 성공");
						}
						else {
							//alert("실패!!");
						}
	
					}
				});
			}
		}//else
	}
	
	location.href = "/kokonutStationery/order/order_settle.do?usePoint="+$('#usingPoint').val();	
		
});
var kId = 'Kokonut';

$('#order_cancelBtn').click(function(){
	//alert('${userDTO.userId}'.indexOf(kId));
	if('${userDTO.userId}'.indexOf(kId) == 0){
		if(confirm("상품 구매를 중단하시고 돌아가시겠습니까?")){
			$.ajax({
				type : 'get',
				url : '/kokonutStationery/order/kokonutIdCancel.do',
				data : 'userId=' + '${userDTO.userId}',
				dataTye : 'text',
				success : function(result){
					if(result=='success'){
						location.href='/kokonutStationery/main/index.do';
					}else if(result=='fail'){
						alert("주문취소 실패! 다시 시도해주세요");
					}
				}
			});
		}
	}else{
		location.href='/kokonutStationery/main/index.do';
	}	
});

</script>
