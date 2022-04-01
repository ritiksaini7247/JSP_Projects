
<%@page import="com.model.User"%>
<jsp:useBean id="user" class="com.model.User" scope="application"></jsp:useBean>

<%
User loggedInUser = (User) session.getAttribute("loggedInUser");
%>

<%=loggedInUser%>

<h1>
	Welcome
	<%=user.getUsername()%></h1>
