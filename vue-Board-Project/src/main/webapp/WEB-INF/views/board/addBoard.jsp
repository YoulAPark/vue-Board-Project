<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<!-- Bootstrap meta name 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

<title> addBoard.jsp </title>

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
		$('#save').on("click", function(){
			boardSave();
		});
	});
		
	// no, title, content, date, writer, imgFile, readCount
	function boardSave() {
		var title = $("input[name='boardTitle']").val();
		var content = $('#boardContentLabel').val();
		var writer = "testUser";
		// var imgFile = "";
		// var readCount = "";
		
		$.ajax({
			url : "/board/json/addBoard"
			,	method : "POST" 
			,	dataType : "JSON" 
			,	contentType : "application/json"
			,	data : JSON.stringify({
						"title" : title
					,	"content" : content
					,	"writer" : writer
			})
			,	success : function() {
					location.href="/board/product-list";
				}, error : function() {
					console.log("실패")
				}
		});
	}
	
	function updateBtn() {
		var no = $('#no').val();
		var title = $("input[name='updateBoardTitle']").val();
		var content = $("input[name='updateBoardContent']").val();
		var writer = $("input[name='updateBoardWriter']").val();
		
		$.ajax({
			url : "/board/json/updateBoard"
			,	method : "POST" 
			,	dataType : "JSON" 
			,	contentType : "application/json"
			,	data : JSON.stringify({
						"no" : no
					,	"title" : title
					,	"content" : content
					,	"writer" : writer
			})
			,	success : function() {
					location.href="/board/product-list";
				}, error : function() {
					console.log("실패")
				}
		});
	}
	
	function backBtn() {
		location.href="/board/product-list";
	}
	
</script>

</head>
<body>
	<!-- c:if : list값이 없을 경우 => insert할 수 있는 페이지 생성 -->
	<c:if test="${list==null}">
		<form>	
			<div class="mb-3"> <!-- name : boardTitle -->
			  <label for="exampleFormControlInput1" class="form-label">제목</label>
			  <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력하세요" name="boardTitle">
			</div>
			<div class="mb-3"> <!-- id : boardContentLabel -->
			  <label for="boardContentLabel" class="form-label">내용</label>
			  <textarea class="form-control" id="boardContentLabel"></textarea>
			</div>
			<div class="mb-3">
			  <label for="formFileSm" class="form-label">파일업로드</label>
			  <input class="form-control form-control-sm" id="formFileSm" type="file">
			</div>
		</form>
			<button type="button" id="save" class="btn btn-primary">저장</button>
			<button type="button" onclick="backBtn()" class="btn btn-primary">뒤로가기</button>
	</c:if>
	
	<!-- c:if : list값이 있을 경우 => update를 할 수 있는 페이지 생성 -->
	<form class="boardList">
		<c:if test="${list!=null}">
			<c:forEach var="board" items="${list}">
				<input type="hidden" id="no" value="${board.no}">
				
					<div>
					  <label for="exampleFormControlInput1" class="form-label">title</label>
					  <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="${board.title}" name="updateBoardTitle">
					</div>
					
					<div>
					  <label for="boardContent" class="form-label">content</label>
					  <input type="text" class="form-control" id="boardContent" placeholder="${board.content}" name="updateBoardContent">
					</div>
					
					<div class="mb-3">
						<label for="writerName" class="form-label">작성자</label>
						<input type="text" class="form-control" id="writerName" placeholder="${board.writer}" name="updateBoardWriter">
					</div>
					
					<div class="mb-3">
						<label for="formFileSm" class="form-label">파일업로드</label>
					  	<input class="form-control form-control-sm" id="formFileSm" type="file">
					</div>
					
				
					<button type="submit" onclick="updateBtn()" class="btn btn-primary">수정</button>
					
			</c:forEach>
		</c:if>
	</form>
</body>
</html>
