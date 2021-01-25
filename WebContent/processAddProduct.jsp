<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 디렉티브 태그의 import 사용해서 클래스 두 개 선언함 -->
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<!-- 
dao : Data Acess Object 의 줄임말로써 데이터를 조작하기 위한 기능을 전담하기 위해서 만들어진 오브젝트
dto : Data Transfer Object 의 줄임말로써 계층간의 데이터를 교환하기 위한 오브젝트 / DB(MySQL 같은..)와 자바의 데이터타입은 실제로는 같지 않음, 자바에서 DB의 데이터를 사용하기 위해서 데이터 변환을 하기 위한 클래스 객체
* MySQL 에서 문자는 varchar, 숫자는 int 로 표현함. 날짜는 DateTime인데 자바는 각각 string, int, date라ㅏ\고 표현함. 
 -->


<%
	
	request.setCharacterEncoding("UTF-8");
	
	/* request 내장 객체를 사용하여 넘겨받은 데이터를 하나씩 꺼냄 */
	/* 클라이언트가 요청한... */
	String productId = request.getParameter("productId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String description = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");
	
	/* product.java 에서 int 로 선언했으니까 문자열로 받은 것을 아래와 같이 Integer로 바꿔준다. */
	/* 넘겨받은 unitPrice가 문자열로 되어 있으며, 실제 데이터 타입은 Product.java의 unitPrice는 정수타입이므로 데이터 타입을 변경해야함 */
	Integer price;
	
	/* 문자열로 해서 아래와같이 비었는지 물어보고 */
	if (unitPrice.isEmpty())
		price = 0;
	else
		/* valueOf() 넘겨받은 문자형 값을 Integer 타입으로 변환할 때 사용, 변경해서 price에 넣음 */
		price = Integer.valueOf(unitPrice);
		
	/* 넘겨받은 unitsInStock가 문자열로 되어 있으며, 실제 데이터 타입은 Product.java의 unitsInStock는 long 타입의 정수타입이므로 데이터 타입을 변경해야함 */
	long stock;
	
	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
		
	/* ProductRepository 타입의 변수 dao에 싱글톤 방식으로 ProductRepository 클래스 내부에서 생성된 객체를 대입  */
	ProductRepository dao = ProductRepository.getInstance();
	
	/* Product 클래스 타입의 객체 생성 - 데이터 베이스를 자바에서 사용할 수 있게끔 만드는 하나의 데이터 타입임. */
	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	
	/* addProduct.jsp 에서 받아온 데이터를 데이터 세트를 하나 만든것을 매개변수로 만들어서 실행하는 것임 */
	/* Product 클래스 타입의 데이터를 dao 객체를 통해서 상품 목록에 저장ㅇ */
	dao.addProduct(newProduct);
	
	/* 화면 데이터 처리 부분은 현재 파일은 processAddProduct.jsp 파일에서 진행하고 데이터가 추가된 뷰 부분 화면은 products.jsp 에서 보여주기 위해서 리다이렉트 함. */
	response.sendRedirect("products.jsp");
%>

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		