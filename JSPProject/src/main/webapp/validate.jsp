<%@page import="com.dao.UserDao"%>
<%@page import="com.model.User"%>



<%
String username = request.getParameter("username");
String password = request.getParameter("password");
User user = new User();
user.setUsername(username);
user.setPassword(password);

UserDao dao = new UserDao();
String result = dao.checkUser(user);

pageContext.setAttribute("username", username, PageContext.APPLICATION_SCOPE);
response.sendRedirect(result);
%>