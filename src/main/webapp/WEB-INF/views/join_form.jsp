<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/common.css"/>" rel="stylesheet"/>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
$(function(){
	var response="<c:out value='${response}'/>";	
	var success="<c:out value='${success}'/>";	
	var err="<c:out value='${err}'/>";	
	if(response == "true"){
		if(success == "true"){
			$('.modal-title').text("출금 성공");
			$('.modal-body').text("출금되었습니다.");
		}else{
			$('.modal-title').text("출금 실패");
			$('.modal-body').text("출금을 실패하였습니다.("+err+")");
		}
		$('#modalbtn').click();
	}
	
	$('#double').click(function(){
		var id = $("#id").val();
		$.ajax({
			type:"post",
			url:"http://localhost:8088/bank/mid",
			data:{id:id},
			success:function(data,textStatus){
				if(data == "false"){
					$('.modal-title').text("중복확인");
					$('.modal-body').text("사용가능한 아이디입니다.");
				}else{
					$('.modal-title').text("중복확인");
					$('.modal-body').text("중복된 아이디입니다.");
				}
			}
		});
	});
});
</script>
</head>
<body>
<div class="container p-5 my-5 border">
	<h5 class="title">회원가입</h5>
	<form action="./join" method="post">
  		<div class="input-group mb-2">
    		<span class="input-group-text title">아이디</span>
    		<input type="text" class="form-control" name="id" id="id">
    		<input type="button" id="double" class="btn btn-info" value="중복"/>
  		</div>

  		<div class="input-group mb-2">
    		<span class="input-group-text title">비밀번호</span>
    		<input type="password" class="form-control" name="password" id="password">
  		</div>
  		
		<div class="input-group mb-2">
    		<span class="input-group-text title">이름</span>
    		<input type="text" class="form-control" name="name" id="name">
  		</div>
  		
  		<div class="input-group mb-2">
    		<span class="input-group-text title">성별</span>
    		<span class="form-control">
    			<input type="radio" value="female" name="sex" checked class="form-check-input">&nbsp;여&nbsp;&nbsp;&nbsp;&nbsp;
    			<input type="radio" value="male" name="sex"  class="form-check-input">&nbsp;남
    		</span>
  		</div>
  		
  		<div class="input-group mb-2">
    		<span class="input-group-text title">나이</span>
    		<input type="text" class="form-control" name="age" id="age">
  		</div>
  		
  		
  		<div class="input-group mb-2">
    		<span class="input-group-text title">이메일</span>
    		<input type="text" class="form-control" name="email" id="email">
  		</div>
  		
  		<div class="d-grid">
    		<input type="submit" class="btn btn-primary" value="회원가입"/>
  		</div>  		
	</form>
</div>

<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal" id="modalbtn" style="visibility: hidden;"></button>
<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title"></h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
       
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>