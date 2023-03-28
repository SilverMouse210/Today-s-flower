<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Sans+KR&family=Poor+Story&family=Shadows+Into+Light&display=swap');
.memberContainer{
	   display: flex;
       justify-content: center;
       align-items: center; 
       margin-top:150px;
       
}
.memberFont{
font-family: 'Gowun Dodum', sans-serif;
	font-weight:bold;
	color:gray;

}

.ex{
color:gray;
font-size:12px;
}

{

</style>
<script>

window.onload = function(){
	hide('f_pwd_id');
	hide('mID');
	hide('fType2');
	hide('E.C');
	hide('pwdchange');
	
	
	
}

var infotxt = $('infotxt').val()
var _id="";
function fn_findInfo(){
	var _email = $('#em1').val();
	var _email2 = $('#em2').val();
	console.log(_email);
	
	var _name =$('#member_name').val();
	console.log(_name);
	 _id =$('#member_id').val();
	
	if(_id ==""||_id == null){
	    $.ajax({
	        type:"post",
	        async:false,  
	        url:"${contextPath}/member/findMemberId.do",
	        dataType:"text",
	        data: {email:_email,
	        		email2:_email2,
	        		name:_name
	        		},
	        success:function (data,textStatus){
	         alert("이메일이 전송되었습니다.");
	          	
	        },
	        error:function(data,textStatus){
	           alert("입력하신 내용을 확인해 주세요");
	        },
	        complete:function(data,textStatus){
	           

	        }
	     });  //end ajax	
	}else{
		
		  $.ajax({
		        type:"post",
		        async:false,  
		        url:"${contextPath}/member/findMemberPwd.do",
		        dataType:"text",
		        data: {email:_email,
		        	email2:_email2,
		       		id:_id
		        		},
		        success:function (data,textStatus){
		        	alert("인증번호가 전송되었습니다.");
		        	show('E.C');
		        	_emData=data;
		        	hide('go');
		          	
		        },
		        error:function(data,textStatus){
		           alert("입력하신 내용을 확인해 주세요");
		        },
		        complete:function(data,textStatus){
		           

		        }
		     });  //end ajax	
		
	
		}
	
 
}


var _emData="";

function emcheck(){
	
	var emailCheck = $('#emailCheck').val();
	var gck = document.getElementById('goodCK');
	
	
	if(emailCheck !=_emData){
		alert("인증번호를 다시 확인해주세요");
	}else{
		hide('E.C');
		alert("인증이 완료되었습니다. 비밀번호를 변경해 주세요!");	
		show('pwdchange');
		
	}
	
	
} 

function fn_findPWD(){
	show('mID');
	show('f_pwd_id');
	show('fType2');
	show('go');
	
	hide('mpwd');
	hide('fType');
	hide('mname');
} 

function fn_findID(){
	 _id="";
	show('mpwd');
	show('mname');
	hide('f_pwd_id');
	show('fType');
	show('go');
	
	hide('mID');
	hide('fType2');
	hide('aaaa');
} 

function fn_pwd(){
	var _pwd =$('#member_pw').val();
	console.log(_pwd);
	_id=$('#member_id').val();

	 $.ajax({
	        type:"post",
	        async:false,  
	        url:"${contextPath}/member/chageMemberPwd.do",
	        dataType:"text",
	        data: {
	       		id:_id,
	       		pwd:_pwd
	        		},
	        success:function (data,textStatus){
	        hide('pwdchange');
	        var aaa= document.getElementById('aaaa');
	        aaa.innerHTML="변경완료";
	        		
	        },
	        error:function(data,textStatus){
	           alert("다시 시도해주세요");
	        },
	        complete:function(data,textStatus){
	           

	        }
	     });  //end ajax	
}


	 
	 function show(elementId) {
	 var element =document.getElementById(elementId);
	 if(element) {
	  element.style.display = '';
	 }
	}

function hide(elementId){
  var element = document.getElementById(elementId);
  if(element){
	  element.style.display = 'none';
  }
}



</script>
</head>
<body>


<div class="memberContainer">
	
 <form class= "needs-validation" method="post" onsubmit="return validateForm()">
	
	
	<table class="table table-hover ">
  <thead>
    <tr>
      <th scope="col"><p class="memberFont fs-3 mb-3 "><i class="bi bi-flower3"  style="font-size: 2rem;color:#BEACC4;"></i>&nbsp;<span id="fType">아이디 찾기</span><span id="fType2"> 비밀번호 찾기</span></p></th>
      <th scope="col"></th>
      <th scope="col"></th>
      <th scope="col"></th>
    
      
    </tr>
  </thead>
  
  
  <tbody class="table-group-divider">
    <tr id="mname">
      <th scope="row">이름<p class="ex">(회원정보에 등록한 이름을 입력하세요)</p></th>
      <td class="col-md-3 required"><input type="text"  name="member_name" id="member_name" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required="required"  ></td>
      <td></td>
      <td></td>
    </tr>
    <!-- onsubmit="return validateForm()" -->
    
    <tr>
      <th scope="row">이메일<p class="ex">(회원정보에 등록한 이메일 입력하세요)</p></th>
      <td><input type="email" id="em1" name="email1"  class="form-control mt-2" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required="required" ></td>
  	   <td><input type="email" id="em2" name="email2"  class="form-control mt-2" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required="required" placeholder="@를 입력해주세요" ></td>
  	   
  	    <td></td>
    
    </tr>
    
    <tr id ="f_pwd_id">
      <th scope="row">아이디<p class="ex">(회원정보에 등록한 아이디 입력하세요)</p></th>
      <td><input type="text"  name="member_id" id="member_id" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"></td>
   	 <td></td>
   	  <td></td>
    
    </tr>
   
   
    
     <tr id="E.C">
      <th scope="row">인증번호</th>
      <td class="col-md-3"><input type="text"  name="emailCheck" id="emailCheck" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"></td>
      <td><button type="button" class="btn btn-secondary btn-sm mt-1 mr-auto" id="btnOverlapped" onClick="emcheck()"  style="background-color:#BEACC4; border-color:white; " >인증확인</button>
      <button type="button" class="btn btn-secondary btn-sm mt-1 mr-auto" id="btnOverlapped" onClick="fn_mailCheck()"  style="background-color:#BEACC4; border-color:white; " >재전송</button></td>
      
      <td></td>
      <td></td>
      
    </tr> 
    
    <tr id="pwdchange">
    <th scope="row">비밀번호 재설정</th>
    <td><input type="password" id="member_pw" name="member_pw"  class="form-control mt-2" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required="required"></td>
    <td><button type="button" class="btn btn-secondary btn-sm mt-1 mr-auto" id="btnOverlapped" onClick="fn_pwd()"  style="background-color:#BEACC4; border-color:white; " >변경</button></td>
    
    </tr>
    
   
    

  </tbody>
</table>
	
	<div class="row justify-content-center mt-3">
	<p id="aaaa"></p>
	<input type="button" id="go" value="이메일 전송" class="btn btn-secondary btn-sm mt-1 mr-auto" id="btnOverlapped"  onClick="fn_findInfo()" style="background-color:#BEACC4; border-color:white;">
	<p class="fs-6 mt-2"><a  href="${contextPath}/member/loginForm.do">&nbsp;로그인 하러가기</a><a id="mpwd" href="javascript:fn_findPWD()">&nbsp;/비밀번호 찾기</a><a id="mID" href="javascript:fn_findID()">&nbsp;/아이디 찾기</a>
	</p>
	</div>
	
	 </form> 
	</div>
	


	
</body>
</html>