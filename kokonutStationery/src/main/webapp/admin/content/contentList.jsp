<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<meta charset="UTF-8">
<title>Admin 페이지</title>
<style type="text/css">
#userSeach_list th{
	height: 53px;
	font-weight: 500;
	font-weight: 500;
    background-color: #f5f4f4;
}

.board_menuBar{
	float: left;
    font-size: 16px;
    margin: 10px 0 20px 20px;
}

.content_menuBar{
	color: gray;
}

#contentTable{
	border-collapse:collapse;
}

#contentTable tr{
	border-bottom:1px solid #cccccc;
}

.subjectTr:hover{
	background:#f6f6f6;
}

.contentA{
	width:1000px; max-width:1000px;
}

#editA{
	margin-top:50px;
}

#editA:hover{
	background:#808080;
	color:#ffffff;
}

/* 공지사항 글쓰기 버튼 */
#noticeWriteBtn{
	width:55px; height:25px;
	padding-top:7px;
	display:none; border:1px solid #808080;
	cursor:pointer; float:right;
	text-align:center;
}

#noticeWriteBtn:hover{
	background:#808080;
	color:#ffffff;
}

</style>
</head>
<input type="hidden" id="boardOption" value="tbl_admin">
<input type="hidden" id="ajaxCheck" value=0><!-- 상품 후기 클릭 시 ajax 반복 막기 -->
<!-- 메인컨텐츠 시작 -->
<div id="mainContent_wrap" style="width:1100px; margin:auto; padding-bottom:100px;">
	<div id="user_search_wrap" style="width: 1000px; margin: 0 auto;">
		<div id="user_search_title" style="margin-bottom: 20px;">
			<h1 style="font-weight:normal;">게시물 관리</h1>
		</div>
		
	
		<div class="board_menuBar" style="margin: 10px 0 20px 0;">
			<a href="#" id="notice_board" class="content_menuBar">공 지 사 항</a>
		</div>
		<div class="board_menuBar">
			<a href="#" id="product_qna" class="content_menuBar">상 품 문 의</a>
		</div>
		<div class="board_menuBar">
			<a href="#" id="product_review" class="content_menuBar">상 품 후 기</a>
		</div>
		
		<div id="noticeWriteBtn"><!-- 공지사항 글쓰기 버튼 -->
		</div>

		<div id="userSeach_list" align="left" style="margin-top: 50px;">
			<table id="contentTable" border="1" style="width: 100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5;">
				<tr>
					<th style="width: 20px;">
						<input type="checkbox">
					</th>
					<th style="width: 60px;">번&emsp;&nbsp;호</th>
					<th  id="reviewTh" style="width: 300px;">제&emsp;&nbsp;목</th>
					<th id="writerTh" style="width: 80px;">날&emsp;&nbsp;짜</th>
				</tr>
			</table>
		</div>
	</div><!-- search_wrap -->
</div><!-- 메인컨텐츠 끝 -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

//공지사항 글쓰기버튼 클릭 시 새 창으로 입력 화면 만들기
($('#noticeWriteBtn')).on("click",function(){			
	window.open(
			"/kokonutStationery/admin/noticeboardWriteForm.do"
			,'','width=900, height=750, left=200, resizable=no, toolbar=no'
			,'true'
	);
});//공지사항 글쓰기 끝


//공지사항 전체 리스트
$('#notice_board').click(function(){ //공지사항 탭 누를 경우
	$('.content_menuBar').css('color','#808080');
	$(this).css('color','#000000');
	
	/*공지사항 글쓰기 버튼 활성화*/
	$('#noticeWriteBtn').text("글쓰기").css('display','block');
	
	$('#boardOption').val('tbl_admin');
	$('#reviewImg').remove();
	$('#writer').remove();
	$('#ajaxCheck').val(0);
	
	$.ajax({
		type : 'POST',
		url : '/kokonutStationery/admin/noticeboardList.do',
		dataType : 'json',
		success : function(data){		
			
			$('#contentTable tr:gt(0)').remove();
			
			//공지 전체 리스트
			$.each(data.list, function(index,items){
				$('<tr/>',{
					class : 'subjectTr',
					style : 'height:50px;'
				}).append($('<td/>',{ // 체크박스
					align : 'center'
				}).append($('<input/>',{
					type : 'checkbox'
					
				}))).append($('<td/>',{ // 번호
					align : 'center',
					text : items.noticeboardCode
					
				})).append($('<td/>',{ // 제목
					align:'center'
				}).append($('<a/>',{
					text : items.noticeboardSubject,
					href : 'javascript:void(0)',
					name : items.noticeboardCode,
					class : 'subjectA'
					
				}))).append($('<td/>',{ // 날짜
					align : 'center',
					text : items.regDate
				})).appendTo($('#contentTable'));
				
				//내용들어갈 tr
				$('<tr/>').append($('<td/>',{
					style : "white-space:pre; padding:80px 60px;",
					text : items.noticeboardContent,
					colspan : 4,
					class : 'contentA',
					id : items.noticeboardCode
					
				}).append($('<div/>',{ //수정 버튼
					style : 'width:50px; height:25px; float:right; border:2px solid #808080; text-align:center; cursor:pointer;',
					text : '수정',
					id : 'editA',
					class : items.noticeboardCode
					
				}))).appendTo($('#contentTable'));
				
				$('.contentA').hide();
	
			});//each
			
			//드롭다운
			$('.subjectA').click(function(){
				var code = $(this).attr('name');
				
				$('.contentA').not('[id^='+code+']').each(function(){
					$(this).hide();
				});

				$('[id^='+code+']').each(function(){
					$(this).toggle();
				});
			});
			
			//수정버튼 클릭 시
			($('#contentTable')).on("click",'#editA',function(){			
				window.open(
						"/kokonutStationery/admin/noticeboardModifyForm.do?noticeboardCode="
						+$(this).attr('class')
						,'','width=900, height=750, left=200, resizable=no, toolbar=no'
						,'true'
				);
			});
			
			
		}//success
	});//ajax
});//공지사항 전체 리스트 뿌리기 끝




//상품 문의 전체 리스트
$('#product_qna').click(function(){ // 상품문의 탭 누를 경우
	$('.content_menuBar').css('color','#808080');
	$(this).css('color','#000000');
	
	$('#noticeWriteBtn').css('display','none');
	
	$('#boardOption').val('tbl_qnaboard');
	$.ajax({
		type : 'POST',
		url : '/kokonutStationery/admin/reviewboardList.do',
		dataType : 'json',
		success : function(data){
			
			if($('#ajaxCheck').val()==0){
				//테이블 이미지th 추가
				$('#reviewTh').before($('<th/>',{text: '상품 이미지', id:'reviewImg'}).css('width', '70px'));	
				$('#writerTh').before($('<th/>',{text: '작성자', id:'writer'}).css('width', '70px'));
				$('#ajaxCheck').val(1);
				
				$('#contentTable tr:gt(0)').remove();
				
				//문의 전체 리스트
				$.each(data.list, function(index,items){
					$('<tr/>').append($('<td/>',{
						align: 'center'
					}).append($('<input/>',{
						type : 'checkbox'
					}))).append($('<td/>',{
						align : 'center',
						text : items.reviewboardCode
					})).append($('<td/>',{
							align : 'center',
						}).append($('<img/>',{
							src : '../image/thumb/'+items.reviewboardImg
						}).css('width','65px'))).append($('<td/>',{
							text : items.reviewboardSubject
						}).css('padding-left', '5px')).append($('<td/>',{
							align : 'center',
							text : items.userId
						})).append($('<td/>',{
							align : 'center',
							text : items.regDate
						})).appendTo($('#contentTable'));
				});
			}//if
		}//success
	});//ajax	
});


//상품 후기 전체 리스트
$('#product_review').click(function(){ // 상품 후기 탭 누를 경우
	$('.content_menuBar').css('color','#808080');
	$(this).css('color','#000000');
	
	$('#noticeWriteBtn').css('display','none');
	
	$('#boardOption').val('tbl_reviewboard');
	$.ajax({
		type : 'POST',
		url : '/kokonutStationery/admin/reviewboardList.do',
		dataType : 'json',
		success : function(data){
			if($('#ajaxCheck').val()==0){
				//테이블 이미지th 추가
				$('#reviewTh').before($('<th/>',{text: '상품 이미지', id:'reviewImg'}).css('width', '70px'));	
				$('#writerTh').before($('<th/>',{text: '작성자', id:'writer'}).css('width', '70px'));
				$('#ajaxCheck').val(1);
				
				$('#contentTable tr:gt(0)').remove();
				
				//후기 전체 리스트
				$.each(data.list, function(index,items){
					alert(items.thumbImg);
					$('<tr/>').append($('<td/>',{
						align: 'center'
					}).append($('<input/>',{
						type : 'checkbox'
					}))).append($('<td/>',{
						align : 'center',
						text : items.reviewboardCode
					})).append($('<td/>',{
							align : 'center',
						}).append($('<img/>',{
							src : '../image/thumb/'+ items.thumbImg
						}).css('width','65px'))).append($('<td/>').append($('<a/>',{
							href : 'javascript:void(0)',
							name : items.reviewboardCode,
							class : 'subjectA',
							text : items.reviewboardSubject
						})).css('padding-left', '5px')).append($('<td/>',{
							align : 'center',
							text : items.userId
						})).append($('<td/>',{
							align : 'center',
							text : items.regDate
						})).appendTo($('#contentTable'));
					
					//후기 선택 내용 생성
					$('<tr/>').append($('<td/>',{
						colspan : 6,
						align : 'center',
						style : 'padding-top: 15px; width: 150px; height: 150px;',
						class : 'contentA',
						id : items.reviewboardCode
					}).append($('<img/>',{
							src:'../image/thumb/'+items.reviewboardImg
						}))).append($('<td/>',{
							style : "white-space:pre; padding:40px 0; padding-left:68px; text-align:center;",
							text : 'asdsss',
							colspan : 6,
							class : 'contentA',
							id : items.reviewboardCode
						})).appendTo($('#contentTable'));
					
					$('.contentA').hide();
				});//each
				
				$('.subjectA').click(function(){
					var code = $(this).attr('name');
					$('[id^='+code+']').each(function(){
						$(this).toggle();
					});
				});
			}//if
		}//success
	});//ajax
});
</script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               