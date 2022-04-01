<jsp:useBean id="user" class="com.model.User" scope="application"></jsp:useBean>
<jsp:useBean id="dao" class="com.dao.UserDao"></jsp:useBean>

<jsp:setProperty property="*" name="user" />

<%
HttpSession currentSession = request.getSession();
if (dao.isValidUser(user)) {
	currentSession.setAttribute("loggedInUser", user);
}else{
	currentSession.setAttribute("loggedInUser",null);
}
%>

<jsp:forward page="<%=dao.checkUser(user)%>"></jsp:forward>
