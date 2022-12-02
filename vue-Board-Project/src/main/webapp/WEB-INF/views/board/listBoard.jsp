<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<!-- Bootstrap meta name 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

<title> listBoard.jsp </title>

<!-- CDN Script Start -->
	
	<!-- jQuery -->	
	<script defer src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	
	<!-- SweetAlert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
	
	<!-- Bootstrap -->
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
	
<!-- CDN Script End -->	

<!-- CSS style Start -->
<style>
	
</style>
<!-- CSS style End -->

<script>

	$(function() {
		$('#writeBoard').on("click", function(){
			alert("GHkrdsl")
			/* self.location = "/board/product-Board"; */
			location.href="/board/product-Board";
		});
	});
	
	function delBoard(no) {
		
		$.ajax({
			url : "/board/json/deleteBoard/"+no
		,	method : "GET"
		,	dataType : "JSON"
		,	headers : {
				"Accept" : "application/json" ,
				"Content-Type" : "application/json"
			}
		,	success : function(JSONData, status) {
				location.reload();
			}
		});
	}
	
	function updateBoard(no) {
		alert("update : "+no)
				
		$.ajax({
			url : "/board/json/updateBoard"
			,	method : "POST" 
			,	dataType : "JSON" 
			,	contentType : "application/json"
			,	data : JSON.stringify({
						"title" : title
					,	"content" : content
					,	"writer" : writer
			})
			,	success : function() {
					alert("SUCCESS")
					location.href = "/board/product-list";
				}, error : function() {
					console.log("실패")
				}
		});
	}
	
	/* function getProduct(no) {
		
		var no = $("input[name=no]").val();

		$.ajax({
					url : "/board/json/getProduct/"+no
				,	method : "GET"
				,	dataType : "JSON"
				,	headers : {
						"Accept" : "application/json" ,
						"Content-Type" : "application/json"
					}
				,	success : function(JSONData, status) {
						$('#title').val(JSONData.title);
						$('#content').val(JSONData.content);
						/* $('#writer').val(JSONData.prodPrice);
		});
	} */
	
	function updatePageMove(no) {
		self.location = "/board/updatePage/"+no;
	}
	
</script>

</head>
<body>
<table class="table">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제 목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>삭제</button></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${list}">
					<tr>
						<td name="no" onclick="updatePageMove(${board.no})">${board.no}</td>
						<td onclick="getProduct(${board.no})" data-bs-toggle="modal" data-bs-target="#getProductList">${board.title}</td>
						<td>${board.writer}</td>
						<td>${board.date}</td>
						<td>${board.readCount}</td>
						<td><button type="button" onclick="delBoard(${board.no})" class="btn btn-primary">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button type="button" id="writeBoard" class="btn btn-primary">글쓰기</button>
		

		
<!--################## Modal ##################-->
		<!-- <div class="modal fade" id="getProductList" tabindex="-1" aria-labelledby="#getProductListLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="getProductListModal">updateProduct</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      
		      <div class="modal-body">
		        <form>
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">title</label>
						<input type="text" class="form-control" id="title" name="prodName">
					</div>
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">content</label> 
						<input type="text" class="form-control" id="content" name="prodDetail">
					</div>
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">writer</label>
						<input type="text" class="form-control" id="writer" name="prodPrice">	
					</div>
						<input type="hidden" id="prodNo" name="prodNo">
				</form>
		      </div>
		      
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" data-bs-dismiss="modal" class="btn btn-primary" onclick="updateBoard()">수정</button>
		      </div>
		    </div>
		  </div>
		</div> -->
</body>
</html>
