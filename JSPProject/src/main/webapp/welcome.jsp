
<h1>
	Welcome
	<%=request.getSession().getAttribute("usename")%></h1>
<br>
<br>
<h1>
	<%=pageContext.getAttribute("username", PageContext.APPLICATION_SCOPE)%>
</h1>
<br>
<br>
<h1>
	<%=application.getAttribute("username")%>
</h1>