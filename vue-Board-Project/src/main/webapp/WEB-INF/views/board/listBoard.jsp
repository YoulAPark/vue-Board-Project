<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	
	function getProduct(no) {
		$.ajax({
			url : "/board/json/readCount"
			,	method : "POST" 
			,	dataType : "JSON" 
			,	contentType : "application/json"
			,	data : JSON.stringify({
						"no" : no
			})
			,	success : function() {
					location.href = "/board/product-list";
				}, error : function() {
					console.log("실패")
				}
		});
	}
	
	function updatePageMove(no) {
		self.location = "/board/updatePage/"+no;
	}
	
	/* function sortNo() {
		$.ajax({
			url : "/board/json/sortNo"
		,	method : "GET"
		,	dataType : "JSON"
		,	headers : {
				"Accept" : "application/json" ,
				"Content-Type" : "application/json"
			}
			,	success: function(data){ */
					/* alert("SUCCESS");
               		
					$.each(data, function(i){
               			$("#noName").append(data[i]);
               		}); */
               		
                	/* <td id='noName' name="no" onclick="updatePageMove(${board.no})" value="${board.no}">${board.no}</td>
					<td id="titleName" onclick="getProduct(${board.no})" data-bs-toggle="modal" data-bs-target="#getProductList">${board.title}</td>
					<td id="writerName">${board.writer}</td>
					<td id="dateName"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.date}"/></td>
					<td id="readCountName">${board.readCount}</td>
					<td><button type="button" onclick="delBoard(${board.no})" class="btn btn-primary">삭제</button></td>
					 */
					/* no += '<td>'+data[0].no+'</td>'
					alert(no)
					$("#noName").append(data[no]); */
                
                 
                
	                   /*  $.each(data, function(i){
	                    	str += 	'<td>' + data[i].no + '</td>'
		                   			'<td>' + data[i].title + '</td>'
		                   			'<td>' + data[i].writer + '</td>'
		                   			'<td>' + data[i].date + '</td>'
		                   			'<td>' + data[i].readCount + '</td>'
		                   			'<td>' + data[i].title + '</td>';
	                    }); */
	                    
	                     /* $.each(data, function(index, item) { // 데이터 =item
	    					$("#noName").append(item.no); // index가 끝날때까지 
	    					$("#titleName").append(item.title);
	    					$("#writerName").append(item.writer + " ");
	    					$("#dateName").append(item.date + " ");
	    					$("#readCountName").append(item.readCount + " ");
	    					$("#table_body").append(item.title + "<br>");
	    				});  */
	                    
	                   /* $('.table_body').append(str);	                
			}, 
				error : function(e) {
				alert("ERROR : "+e)
			}
		});
	}*/
	
</script>

</head>
<body>
<table class="table">
			<thead>
				<tr>
					<th>글번호<button type="button" onclick="sortNo()" class="btn outline-secondary btn-sm"> 정렬</button></th>
					<th>제 목<button type="button" class="btn outline-secondary btn-sm"> 정렬</button></th>
					<th>글쓴이<button type="button" class="btn outline-secondary btn-sm"> 정렬</button></th>
					<th>작성일<button type="button" class="btn outline-secondary btn-sm"> 정렬</button></th>
					<th>조회수<button type="button" class="btn outline-secondary btn-sm"> 정렬</button></th>
					<th>삭제</button></th>
				</tr>
			</thead>
			<tbody class="table_body">
				<c:forEach var="board" items="${list}">
					<tr>
						<td id="noName" name="no" onclick="updatePageMove(${board.no})" value="${board.no}">${board.no}</td>
						<td id="titleName" onclick="getProduct(${board.no})" data-bs-toggle="modal" data-bs-target="#getProductList">${board.title}</td>
						<td id="writerName">${board.writer}</td>
						<td id="dateName"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.date}"/></td>
						<td id="readCountName">${board.readCount}</td>
						<td><button type="button" onclick="delBoard(${board.no})" class="btn btn-primary">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button type="button" id="writeBoard" class="btn btn-primary">글쓰기</button>
		

		
<!--################## Modal ##################-->
	<!--  <div class="modal fade" id="getProductList" tabindex="-1" aria-labelledby="#getProductListLabel" aria-hidden="true">
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
		</div>-->
</body>
</html>
