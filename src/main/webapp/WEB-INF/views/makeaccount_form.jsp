<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/common.css"/>" rel="stylesheet"/>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<title>�ڽ�Ÿ ����</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(function() {
	var response="<c:out value='${response}'/>";	
	var success="<c:out value='${success}'/>";	
	var name="<c:out value='${acc.name}'/>";	
	var id="<c:out value='${acc.id}'/>";	
	var err="<c:out value='${err}'/>";	
	if(response == "true"){
		if(success == "true"){
			$('.modal-title').text("���°��� ����");
			$('.modal-body').text(name + "�� ���°� �����Ǿ����ϴ�.(���¹�ȣ: "+id+")");
		}else{
			$('.modal-title').text("���°��� ����");
			$('.modal-body').text("���� ������ �����Ͽ����ϴ�.("+err+")");
		}
		$('#modalbtn').click();
	}
	
	$('input[type=radio]').change(function() {
		if($(this).val()=='normal') {
			$('select').attr('disabled','disabled');
		} else {
			$('select').removeAttr('disabled');
		}
	});
	
	$('#double').click(function(){
		var id = $("#make_id").val();
		$.ajax({
			type:"post",
			url:"http://localhost:8088/bank/accountId",
			data:{id:id},
			success:function(data,textStatus){
				if(data == "true"){
					$('.modal-body').text("�̹� �����ϴ� ���¹�ȣ�Դϴ�.");
					$("#make_id").val("");
				}else{
					$('.modal-body').text("��밡���� ���¹�ȣ �Դϴ�.");
				}
				$('#modalbtn').click();
			}
		});
	});
	
});
</script>
</head>
<body>
<div class="container p-5 my-5 border">
	<h5 class="title">���� ����</h5>
	<form action="./make_account" method="post" id="make_acc">
  		<div class="input-group mb-2">
    		<span class="input-group-text title">���¹�ȣ</span>
    		<input type="text" class="form-control" placeholder="10001" name="id" id="make_id">
    		<input type="button" id="double" class="btn btn-info" value="�ߺ�"/>
  		</div>

  		<div class="input-group mb-2">
    		<span class="input-group-text title">�̸�</span>
    		<input type="text" class="form-control" placeholder="ȫ�浿" name="name" id="name">
  		</div>
  		
  		<div class="input-group mb-2">
    		<span class="input-group-text title">�Աݾ�</span>
    		<input type="text" class="form-control" placeholder="100000" name="balance" id="balance">
  		</div>
  		
  		<div class="input-group mb-2">
    		<span class="input-group-text title">���±���</span>
    		<span class="form-control">
    			<input type="radio" value="normal" name="sect" checked class="form-check-input">&nbsp;�Ϲݰ���&nbsp;&nbsp;&nbsp;&nbsp;
    			<input type="radio" value="special" name="sect"  class="form-check-input">&nbsp;Ư������
    		</span>
  		</div>
  		
  		<div class="input-group mb-2">
    		<span class="input-group-text title">���</span>
    		<select class="form-select" id="grade" name="grade" disabled="disabled">
    			<option value="VIP">VIP</option> 
    			<option value="Gold">Gold</option> 
    			<option value="Silver">Silver</option> 
    			<option value="Normal">Normal</option> 
    		</select>
  		</div>
  		<div class="d-grid">
    		<input type="submit" class="btn btn-primary" value="���°���"/>
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