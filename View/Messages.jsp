<jsp:include page="./Header.jsp" />
<body>
	<jsp:include page="./BackEndNavigationbar.jsp" />

	<%@page import="Model.Messages"%>
	<%@page import="java.util.Vector"%>


	<%
	try {
		if (session.equals(null) || (session.getAttribute("Account").equals(0))) {
	response.sendRedirect("../View/Error.jsp");
	
		} else if (session.getAttribute("Account").equals(1)) {
		

		Vector<Messages> vectorContact = Messages.getAll();
	%>
	<div class="bs-docs-section">
		<h2 id="tables-example">Nachrichten</h2>

		<p>
			Wir haben :
			<code><%=vectorContact.size()%></code>
			Nachrichten
		</p>




		<div class="bs-example col-sm-6">
			<input type="text" id="SearchAdmin" class="form-control"
				onkeyup="SearchAdmin(<%=vectorContact.size()%>)"
				placeholder="Nachricht Suchen">

		</div>


		<div class="bs-example">
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>Email</th>
						<th>Nachrichten</th>
						<th>Löschen</th>
					</tr>
				</thead>
				<tbody>

					<%
						int i = 0;

					for (Messages M : vectorContact) {
					%>

					<tr id="<%out.print(i + "tr");%>">
						<td><%=M.getID()%></td>
						<td id="<%=i%>"><%=M.getEmail()%></td>
						<td><%=M.getMSG()%></td>
						<td><a

							href="../Controller/DeleteMessages.jsp?ID=<%=M.getID()%>">Löschen</a></td>

					</tr>

					<%
						i++;
					}
					%>
				</tbody>
			</table>
		</div>
	</div>

	<jsp:include page="./Footer.jsp" />
</body>
</html>

<%		}
		} catch (Exception e) {
			response.sendRedirect("../View/Error.jsp");
		
		}
	 %>
