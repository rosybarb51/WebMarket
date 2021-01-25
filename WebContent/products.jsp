<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- ch03에서 배운 것 중 page : JSP 파일에 자바 클래스를 사용할 수 있도록 선언 -->
<!-- ArrayList으므로 import 해줘야함 -->
<%@ page import="java.util.ArrayList" %>
<!-- 프로덕트클래스사용 위한 임포트 -->
<%@ page import="dto.Product" %>

<%@ page import="dao.ProductRepository" %>

<!-- 액션태그 중에서 자바빈즈를 사용 : 자바빈즈 = 자바 클래스를 객체화 하는 것 - UI와 연산로직의 분리를 위해 사용함. -->
<!-- 아래에서 유즈빈즈의 id에 해당하는 것이 객체명, class에 해당하는 것이 클래스명, scope에 해당하는 것이 해당 객체가 메모리 상에 살아있는 영역을 의미함. -->
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" /> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩 사용 위한 css 파일 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">

<!-- 부트스트랩 사용 위한 jQuery 파일 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>

<!-- 실제 부트스트랩 파일 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" ></script>

</head>
<body>
<!-- 액션태그 중 include를 이용해서 menu.jsp 로 이동하여 실행 - 다시 돌아옴. -->
<!-- 디랙티브의 include는 다른 파일의 내용을 복사해서 현재 내가 사용하는 그 시점에 붙여넣기해서 사용하는 것이므로, 구분 잘 할 것. -->
	<jsp:include page="menu.jsp" />
	<!-- UI 부분 -->
	<div class="jumotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<!-- ArrayList : 데이터를 저장하기 위한 자료 구조 중 한가지, 배열과 비슷함 -->
	<!-- Java의 배열(Array)은 크기가 설정되면 변경할 수 없지만, ArrayList는 크기를 동적으로 변경할 수 있음, 그래서 ArrayList가 개발할 때 편하다. -->
	<!-- 대신, 속도는 Array가 ArrayList보다 더 빠르다. -->
	<!-- 아래는 Product 클래스 타입으로 배열 생성함, 클래스 타입으로 배열을 만들면 배열 요소 하나 하나에 클래스 타입의 객체가 들어가야 함. -->
	
	
	<%
		ProductRepository dao = ProductRepository.getInstance();

		ArrayList<Product> listOfProducts = dao.getAllProducts();
	%>
	
	<%

	/* 이것만 적으면 제품 정보를 다 자동으로 가져올 수 있게 ProductRepository에 다 적어줌, 가져온 것을 ArrayList의 <Product>타입으로 넣어줌.  */
	ArrayList<Product> listOfProduct = dao.getAllProducts();
	%>
	
	<div class="container">
		<div class="row" align="center">
			<%
			for (int i = 0; i < listOfProduct.size(); i++) {
				/* listOfProduct(배열, 배열 안에는 객체가 들어가야 함)의 i번 째 데이터를 가져와서 Product 타입의 변수 product에 저장 */
				Product product = listOfProduct.get(i);
				
				/* 아래의 스크립틀릿 부분과 똑같다. 그런데, 너무 길어지고 불편해서 아래와 같애 스크립틀릿과 같이 적는다. */
				/* out.print("<h3>");
				out.print(product.getPname());
				out.print("</h3>"); */
				
			%>
			<div class="col-md-4">
			<!-- 표현식 출력..? -->
				<h3><%= product.getPname() %></h3>
				<h3><%= product.getDescription() %></h3>
				<h3><%= product.getUnitPrice() %>원</h3>
				
				<!-- "btn btn-secondary"는 부트스트랩에서 a 태그를 버튼 모양으로 만들어놓은 거임.. -->
				<!-- a태그에 ? 는 form 태그에 method에서 get 방식으로 보내는 것과 똑같다. 보낼 때 암호화 하는 것이 아니고, 주소창에 정보가 보이게 보낸다. ?뒤의 형식 그대로 나온다. 우리가 주소창에서 저 부분 입력해서 이동할 수도 있다.  -->
				<h3><a href="./product.jsp? id=<%=product.getProductId() %>" class="btn btn-secondary" role="button">상세 정보 &raquo;</a></h3>
			</div>
			<%
			} // for 문의 중괄호 여기서 끝냄
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
















