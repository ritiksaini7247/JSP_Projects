
<%
if (session.getAttribute("logedInUser") == null) {
	response.sendRedirect("index.jsp");
}
%>

<html>
<script>
	
<%String clock = request.getParameter("clock");
if (clock == null)
	clock = "10";%>
	var timeout =
<%=clock%>
	;
	function timer() {
		if (--timeout > 0) {
			document.forma.clock.value = timeout;
			window.setTimeout("timer()", 1000);
		} else {
			document.forma.clock.value = "Time over";
		}
	}
</script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<body>
	<form action="<%=request.getRequestURL()%>" name="forma">
		<div class="mb-3">
			<i class='fas fa-stopwatch' style='font-size: 50px;'></i><br> <input
				type="text" name="clock" value="<%=clock%>"
				style="border: 0px solid white;font-size:25px ;font-weight: bold; margin-left: 1%">
		</div>
	</form>
	<script>
	<!--
		timer();
	//-->
	</script>
</body>
</html>