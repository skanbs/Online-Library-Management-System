<header class="head-section">
	<div class="navbar navbar-default navbar-static-top container">
		<div class="navbar-header">
			<button class="navbar-toggle" data-target=".navbar-collapse"
				data-toggle="collapse" type="button">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="./Home.jsp"> B<span>i</span>B <span
				style="color: red;">|</span> V<span>i</span>S<span>i</span>T
			</a>
		</div>

		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">

				<li><a href="../Controller/Main.jsp?Page=4">Home</a></li>


				<%
					try {
					if (session.equals(null) || (session.getAttribute("Account").equals(0))) {
				%>

				<jsp:include page="./NotAccount.jsp" />


				<%
					} else if (session.getAttribute("Account").equals(1)) {
				%>
				<jsp:include page="./Account.jsp" />
				<%
					}
				} catch (Exception e) {
				%>
				<jsp:include page="./NotAccount.jsp" />
				<%
					}
				%>