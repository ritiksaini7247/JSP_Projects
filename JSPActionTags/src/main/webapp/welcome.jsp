
<jsp:useBean id="user" class="com.model.User" scope="application"></jsp:useBean>



<h1>
	Welcome
	<%=user.getUsername()%></h1>
