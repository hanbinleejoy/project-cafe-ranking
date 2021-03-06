<%@page import="dto.MemDto"%>
<%@ page pageEncoding="utf-8"%>


<%
	// /dept/list.jsp,   /emp/list.jsp ,  /notice/list.jsp    url에 있는 패스만 뽑아줌.
	String uri = request.getRequestURI();
	String contextPath = request.getContextPath();
%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=contextPath %>/css/write.css">
<link rel="stylesheet" href="<%=contextPath %>/css/rank.css">
<link rel="stylesheet" href="<%=contextPath %>/css/animate.css">
<!-- 합쳐지고 최소화된 최신 CSS -->

<title>카공도르</title>
</head>

<body>
	<!-- navbar start    -->
<div <%if(uri.contains("main.jsp")){ %>id="activeBack"<%}%>>
	<nav class="navbar navbar-expand-lg navbar-dark"
		<%if(!uri.contains("main.jsp")){ %>style="background-color: #6F4E37;"<%}%> >
		<a class="navbar-brand" href="<%=contextPath %>/main.jsp">카공도르</a>
		<!-- /는 최상위 인덱스 (webcontent를 의미)   -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarTogglerDemo02"
			aria-controls="navbarTogglerDemo02" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li
					class="nav-item <%if (uri.startsWith("/apply")) {%> active <%}%>">
					<a class="nav-link" href="<%=contextPath %>/app/apply.jsp">신청게시판</a>
				</li>

			</ul>
			<ul class="navbar-nav">

				<%
					MemDto mdto = (MemDto) session.getAttribute("member");
					if (mdto == null) {
				%>
				<li class="nav-item"><a class="nav-link"
					href="<%=contextPath%>/mem/regst.jsp">회원가입 </a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=contextPath%>/mem/login.jsp">로그인</a></li>

				<%
					} else {
				%>
				<%-- 나중에 아이디 버튼 누르면 자기 정보 나오게 할 수 있을듯(수정까지도) --%>
				<li class="nav-item"><a class="nav-link" href="#"><%=mdto.getId()%>님
						환영합니다.</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=contextPath%>/mem/logout.jsp">로그아웃 </a></li>

				<%
					}
				%>
				<%if(!uri.contains("main.jsp")){ %>
				<form class="form-inline my-2 my-lg-0" method="post"
					action="<%=contextPath%>/search.jsp">
					<input class="form-control mr-sm-2" type="text"
						placeholder="카페명을 입력해주세요" id="search" name="search"
						aria-label="Search">
					<button class="btn btn-secondary my-2 my-sm-0" type="submit">카페찾기</button>
				</form>
				<%} %>
			</ul>
		</div>
	</nav>
	<!-- navbar end-->