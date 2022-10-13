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
			$('.modal-title').text("��� ����");
			$('.modal-body').text("��ݵǾ����ϴ�.");
		}else{
			$('.modal-title').text("��� ����");
			$('.modal-body').text("����� �����Ͽ����ϴ�.("+err+")");
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
					$('.modal-title').text("�ߺ�Ȯ��");
					$('.modal-body').text("��밡���� ���̵��Դϴ�.");
				}else{
					$('.modal-title').text("�ߺ�Ȯ��");
					$('.modal-body').text("�ߺ��� ���̵��Դϴ�.");
				}
			}
		});
	});
});
</script>
</head>
<body>
<div class="container p-5 my-5 border">
	<h5 class="title">ȸ������</h5>
	<form action="./join" method="post">
  		<div class="input-group mb-2">
    		<span class="input-group-text title">���̵�</span>
    		<input type="text" class="form-control" name="id" id="id">
    		<input type="button" id="double" class="btn btn-info" value="�ߺ�"/>
  		</div>

  		<div class="input-group mb-2">
    		<span class="input-group-text title">��й�ȣ</span>
    		<input type="password" class="form-control" name="password" id="password">
  		</div>
  		
		<div class="input-group mb-2">
    		<span class="input-group-text title">�̸�</span>
    		<input type="text" class="form-control" name="name" id="name">
  		</div>
  		
  		<div class="input-group mb-2">
    		<span class="input-group-text title">����</span>
    		<span class="form-control">
    			<input type="radio" value="female" name="sex" checked class="form-check-input">&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;
    			<input type="radio" value="male" name="sex"  class="form-check-input">&nbsp;��
    		</span>
  		</div>
  		
  		<div class="input-group mb-2">
    		<span class="input-group-text title">����</span>
    		<input type="text" class="form-control" name="age" id="age">
  		</div>
  		
  		
  		<div class="input-group mb-2">
    		<span class="input-group-text title">�̸���</span>
    		<input type="text" class="form-control" name="email" id="email">
  		</div>
  		
  		<div class="d-grid">
    		<input type="submit" class="btn btn-primary" value="ȸ������"/>
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
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">�ݱ�</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>