<!-- pageEncoding은 사실 안 넣어도 된다, 왜냐하면 앞에서 캐릭터셋에서 UTF-8넣었으니까.. 그런데 이건 기본으로 셋팅되게 해서 그냥 놔둔다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 현재시각 출력위해 넣어줌 -->
<%-- <%@ page import="java.util.Date" %> --%>
<%@ page import="java.util.Calendar" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="UTF-8">

<!-- 부트스트랩 이용... 나중에는 부트스트랩 빼고 사용하는 거 배울 것임 -->
<!-- 부트스트랩 사용 위한 css 파일 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">

<!-- 부트스트랩 사용 위한 jQuery 파일 -->
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
 
 <!-- 실제 부트스트랩 파일 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" ></script>
    
<title>Welcome</title>
</head>
<body>
	<%!
	/* 두 개의 멤버 변수 선언해서 아래 표현문에서 사용함 */
	String greeting = "웹 쇼핑몰에 오신 것을 환엽합니다!";
	String tagline = "Welcom to Web Market!";
	%>
<!-- 	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
			<a class="navbar-brand" href=" ./welcom/jsp">Home</a>
			</div>
		</div>
	</nav> -->
	<%@ include file="menu.jsp" %>
	
	<div class = "jumbotron">
		<div class="container text-center">
			<h1><%=greeting %></h1><!-- 원래라면 우리가 직접 적어야 하지만, 바디 윗쪽 부분이나 제일 아래쪽 부분에 선언을 해놓고, 우리가 필요한 부분만 가져다 쓰면 된다. 변수 이용해서.. -->
		</div>
	</div>
	<div class="container">
		<div class="test-center">
			<h3><%=tagline %></h3>
			<%
			/* 5초마다 리플레쉬 */
			response.setIntHeader("Refresh", 5);
			
			String am_pm;
/* 			Date 클래스 대신 Calendar 클래스를 사용 */
/* 			Date day = new Date();
			int hour = day.getHours();
			int minute = day.getMinutes();
			int second = day.getSeconds(); */
			Calendar time = Calendar.getInstance();
			/* 단 하나의 객체만 만들어서 사용하는 방법에 대해서 java 싱글톤부분에서 써봤음...getInstance() */
			int hour = time.get(Calendar.HOUR_OF_DAY);
			int minute = time.get(Calendar.MINUTE);
			int second = time.get(Calendar.SECOND);
			
			/* Date 클래스는 am, pm 부분이 따로 없어서 넣어줬었는데 지금 Calendar 클래스로 바꿔서 am, pm 안 넣어도 된다 사실.. */
			if (hour / 12 == 0) {
				am_pm = "AM";
			}
			else {
				am_pm = "PM";
				hour = hour -12;
			}
			
			String CT = hour + ":" + minute + ":" + second + " " + am_pm;
			out.println("현재 접속 시각 " + CT + "\n");
			%>
		</div>
	</div>
	
	<%@ include file="footer.jsp" %>
<!-- 	<footer class = "container">
		<p>&copy; WebMarket</p>
	</footer> -->
	
</body>
</html>