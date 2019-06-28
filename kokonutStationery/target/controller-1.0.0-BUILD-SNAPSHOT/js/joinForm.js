

function chkForm(){
	//유효성체크
	var userId = $('#userId').val();
	var userName = $('#userName').val();	
	var chkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var userBirthYear =$('#userBirthYear').val();
	var userBirthMonth =$('#userBirthMonth').val();
	var userBirthDay =$('#userBirthDay').val();
	var chkPhone = /^(?=.*[0-9]).{3,4}$/;//3자리수
	var chkPhone2 = /^(?=.*[0-9]).{4,5}$/;//4자리수
	var pwdChkClass = $('#pwdChk').attr('class');
	
	/*	
	else if($('#memberId').val()!=$('#chkId').val()){
	
		alert("[아이디중복체크] 필수사항");
		return false;
	
	}
	*/
	if(userId.length<4){
    	
		alert("[아이디입력형식오류] 4자리 이상의 올바른 아이디를 입력해주세요");
    	$('#userId').focus();
    	return false;
    	
	}else if(/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,20}$/.test(userId)){
		alert("[아이디입력형식오류] 4자리 이상의 올바른 형태의 아이디를 입력해주세요");
    	$('#userId').focus();
    	return false;
		
	}else if(pwdChkClass!='pwdOk'){
		
		$('#userPwd').focus();
		alert("올바른 비밀번호가 아닙니다.");
		return false;
		
	}else if($('#userPwd').val()!=$('#rePwd').val()){
		
		alert("비밀번호가 같지않습니다.");
		$('#rePwd').focus();
		return false;
		
	}else if(!/^(?=.*[가-힣]).{2,20}$/.test(userName)){
		alert("올바른 이름 형식이 아닙니다.");
		$('#userName').focus();
		return false;
		
	}else if(!/^(?=.*[0-9]).{4,5}$/.test(userBirthYear)){
		alert("올바른 생일형식이 아닙니다.");
		$('#userBirthYear').focus();
		return false;
		
	}else if(!/^(?=.*[0-9]).{2,3}$/.test(userBirthMonth)){
		alert("올바른 생일형식이 아닙니다.");
		$('#userBirthMonth').focus();
		return false;
		
	}else if(!/^(?=.*[0-9]).{2,3}$/.test(userBirthDay)){
		alert("올바른 생일형식이 아닙니다.");
		$('#userBirthDay').focus();
		return false;
		
	}else if( !chkEmail.test($('#userEmail').val()) ){
		alert("올바른 이메일 형식이 아닙니다.");
		$('#userEmail').focus();
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
	}
	
}