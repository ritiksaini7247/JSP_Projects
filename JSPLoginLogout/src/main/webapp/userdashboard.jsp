
<%@page import="com.model.User"%>
<%@page import="java.util.List"%>
<%
if (session.getAttribute("logedInUser") == null) {
	session.setAttribute("msg", "Unauthenticated user..! ! Login First...");
	session.setMaxInactiveInterval(20);
	response.sendRedirect("index.jsp");
}
%>
<jsp:useBean id="userDao" class="com.dao.UserDao"></jsp:useBean>
<jsp:useBean id="user" class="com.model.User"></jsp:useBean>
<html>
<script>
	
<%String clock = request.getParameter("clock");
if (clock == null)
	clock = "120";%>
	var timeout =
<%=clock%>
	;
	function timer() {
		if (--timeout > 0) {
			document.forma.clock.value = timeout;
			window.setTimeout("timer()", 1000);
		} else {
			document.forma.clock.value = "Session Out";
		}
	}
</script>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<%
	if (session.getAttribute("lmsg") != null) {
		String msg = (String) session.getAttribute("lmsg");
		if ((String) session.getAttribute("lmsg") != null) {
	%>
	<div class="alert alert-danger" role="alert"><%=session.getAttribute("lmsg")%></div>
	<%
	}
	}
	%>

	<h1 style="margin-left: 41%; font-weight: bold;">User Dashboard</h1>
	<form action="userdashboard.jsp" method="post">
		<button type="submit" class="btn btn-danger" style="margin-left: 93%">Logout</button>
	</form>
	<form action="<%=request.getRequestURL()%>" style="margin-top: -8%"
		name="forma">
		<div>
			<i class='fas fa-stopwatch' style='font-size: 50px;'></i><br> <input
				type="text" name="clock" value="<%=clock%>"
				style="border: 0px solid white; font-size: 25px; font-weight: bold;">
		</div>
	</form>
	<hr>
	<label style="font-weight: bold; font-size: 20px">Total Users</label>
	<table class="table table-striped table-hover">
		<thead class="table-dark">
			<tr>
				<th scope="col">#</th>
				<th scope="col">Username</th>
				<th scope="col">Password</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			List<User> allUsers = userDao.getAllUsers();
			int i = 1;
			for (User u : allUsers) {
			%>
			<tr>
				<th scope="row"><%=i%></th>
				<td><%=u.getUsername()%></td>
				<td><%=u.getUsername()%></td>
				<td><a><button type="button" class="btn btn-warning">
							<i class='fas fa-edit' style='font-size: 24px'></i>
						</button></a><a href="'deleteUser.jsp?name="+<% u.getUsername(); %>+"' style="margin-left: 2%"><button
							type="button" class="btn btn-danger">
							<i class='fas fa-eraser' style='font-size: 24px'></i>
						</button></a></td>
			</tr>
			<%
			i++;
			}
			%>
		</tbody>
	</table>


	<script>
		timer();
	</script>
</body>
</html>
<%
if (request.getMethod().equals("POST")) {
	session.removeAttribute("logedInUser");
	session.setAttribute("msg", "Logout Successfully..	");
	session.setMaxInactiveInterval(20);
	response.sendRedirect("index.jsp");
}
%>