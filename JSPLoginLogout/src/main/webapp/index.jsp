<%@page import="com.model.User"%>

<%
if (session.getAttribute("logedInUser") != null) {
	session.setAttribute("lmsg", "Logout First...");
	session.setMaxInactiveInterval(20);
	response.sendRedirect("userdashboard.jsp");
}
%>

<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>

<body>
	<div class="card"
		style="margin-top: 12%; margin-left: 37%; margin-right: 33%">
		<div class="card-body" style="background-color: grey;">
			<h1>Login Here</h1>
			<%
			if (session.getAttribute("msg") != null) {
				String msg = (String) session.getAttribute("msg");
				if ((String) session.getAttribute("msg") != null) {
			%>
			<div class="alert alert-danger" role="alert"><%=session.getAttribute("msg")%></div>
			<%
			}
			}
			%>
			<form action="index.jsp" method="post">
				<div class="mb-3">
					<label for="exampleInputEmail1" class="form-label">User
						Name</label> <input type="text" name="username" class="form-control">
				</div>
				<div class="mb-3">
					<label for="exampleInputPassword1" class="form-label">User
						Password</label> <input type="password" name="password"
						class="form-control">
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>
</body>

<%
if (request.getMethod().equals("POST")) {
%>
<jsp:useBean id="user" class="com.model.User"></jsp:useBean>
<jsp:useBean id="userDao" class="com.dao.UserDao"></jsp:useBean>
<jsp:setProperty property="*" name="user" />
<%
if (userDao.checkUser(user)) {
	session.setAttribute("logedInUser", user);
	response.sendRedirect("userdashboard.jsp");
} else {
	session.setAttribute("msg", "Sorry User not found..");
	session.setMaxInactiveInterval(20);
	response.sendRedirect("index.jsp");
}
}
%>