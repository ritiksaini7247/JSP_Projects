
<%-- create object using useBean tag

<jsp:useBean id="user" class="com.model.User"></jsp:useBean>
<jsp:useBean id="dao" class="com.dao.UserDao"></jsp:useBean>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");
user.setUsername(username);
user.setPassword(password);

String result = dao.checkUser(user);

pageContext.setAttribute("username", username, PageContext.APPLICATION_SCOPE);
response.sendRedirect(result);
%> --%>


<%-- set property by Method 1 (property,name,value)

<jsp:useBean id="user" class="com.model.User"></jsp:useBean>
<jsp:useBean id="dao" class="com.dao.UserDao"></jsp:useBean>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");
%>

<jsp:setProperty property="username" name="user" value="<%= username %>"/>
<jsp:setProperty property="password" name="user" value="<%= password %>"/>

<%
String result = dao.checkUser(user);

/* pageContext.setAttribute("username", username, PageContext.APPLICATION_SCOPE); */
response.sendRedirect(result);
%> --%>


<%-- get property by Method 1 getProperty(property,name)

<jsp:useBean id="user" class="com.model.User"></jsp:useBean>
<jsp:useBean id="dao" class="com.dao.UserDao"></jsp:useBean>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");
%>

<jsp:setProperty property="username" name="user" value="<%= username %>"/>
<jsp:setProperty property="password" name="user" value="<%= password %>"/>

Password is :-  <jsp:getProperty property="password" name="user"/>
Username is :-  <jsp:getProperty property="username" name="user"/>

<%
String result = dao.checkUser(user);

/* pageContext.setAttribute("username", username, PageContext.APPLICATION_SCOPE); */
/* response.sendRedirect(result); */
%> --%>

<%-- set and get property Method 2 setProperty(property,name,param) 

<jsp:useBean id="user" class="com.model.User"></jsp:useBean>
<jsp:useBean id="dao" class="com.dao.UserDao"></jsp:useBean>

<jsp:setProperty property="username" name="user" param="username" />
<jsp:setProperty property="password" name="user" param="password" />

Password is :-
<jsp:getProperty property="password" name="user" />
Username is :-
<jsp:getProperty property="username" name="user" /> --%>


<%-- set and get property using final method setProperty(property="*",name)

<jsp:useBean id="user" class="com.model.User"></jsp:useBean>
<jsp:useBean id="dao" class="com.dao.UserDao"></jsp:useBean>

<jsp:setProperty property="*" name="user"/>

Password is :-
<jsp:getProperty property="password" name="user" />
Username is :-
<jsp:getProperty property="username" name="user" /> --%>


<jsp:useBean id="user" class="com.model.User" scope="application"></jsp:useBean>
<jsp:useBean id="dao" class="com.dao.UserDao"></jsp:useBean>

<jsp:setProperty property="*" name="user" />

<jsp:forward page="<%= dao.checkUser(user) %>"></jsp:forward>
