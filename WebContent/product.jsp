<!-- 상세 정보 부분 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 추가1 -->
<%@ page import="dto.Product" %>

<%@ page import="dao.ProductRepository" %>

<!-- 추가2 -->
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" /> --%>

<!-- 부트스트랩 사용 위한 css 파일 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">

<!-- 부트스트랩 사용 위한 jQuery 파일 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>

<!-- 실제 부트스트랩 파일 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" ></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%
	/* products.jsp 에서 get 방식으로 request 내장 객체에 데이터를 저장하여 전송 */
	String id = request.getParameter("id");
	/* getParameter로 받아온 id를 넣어서 getProductById(id)를 실행함 */
	/* 매개 변수로 입력한 상품 id와 동이란 정보가 있을 경우 반환 */
	/* 이미 만들어 놓은 객체를 가져와서 계속 사용할 수 있다. new 안 쓰고. */
	ProductRepository dao = ProductRepository.getInstance();
	Product product = dao.getProductById(id);
	
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="./resource/images/<%= product.getFilename() %>" style="widht:100%;">
			</div>
			<div class="col-md-6">
			<h3><%= product.getPname()  %></h3>
			<p><%= product.getDescription() %></p>
			<p><b>상품 코드 |</b><span class="badge badge-danger"><%= product.getProductId() %></span>
			<p><b>제조사 : </b><%= product.getManufacturer() %></p>
			<p><b>분류 : </b><%= product.getCategory() %></p>
			<p><b>재고 수 : </b><%= product.getUnitsInStock() %></p>
			<h4><%= product.getUnitPrice() %></h4>
			<p><a href="./products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a></p>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>















