<jsp:include page="./Header.jsp" />

<jsp:include page="./BackEndNavigationbar.jsp" />
<%@page import="Model.Visitor"%>
<%@page import="java.util.Vector"%>
<%
	try {
	if (session.equals(null) || (session.getAttribute("Account").equals(0))) {
		response.sendRedirect("../View/Error.jsp");

	} else if (session.getAttribute("Account").equals(1)) {

		Vector<Visitor> vectorofvisitors = Visitor.getAll();
		int all_Visitors = vectorofvisitors.size();
%>
<div class="bs-docs-section">
	<h2 id="tables-example">Besucher</h2>




	<div class="bs-example col-sm-6">
		<input type="text" id="SearchInput" class="form-control"
			onkeyup="SearchPlace(<%=all_Visitors%>)"
			placeholder="Besucher Suchen">

	</div>
	<div class="bs-example">
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>Immatrikulationsnummer</th>
					<th>Name/Vorname</th>
					<th>Studiengang</th>
					<th>Löschen</th>

				</tr>
			</thead>
			<tbody>
				<%
					int i = 0;
				for (Visitor V : vectorofvisitors) {
				%>
				<tr id="<%out.print(i + "tr");%>">
					<td><%=V.getID()%></td>
					<td><%=V.getImma()%></td>
					<td id="<%=i%>"><%=V.getPsydo()%></td>
					<td><%=V.getFach()%></td>
					<td><a
						href="../Controller/DeleteVisitor.jsp?Id=<%=V.getID()%>">Löschen</a></td>

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
<%
	}
} catch (Exception e) {
response.sendRedirect("../View/Error.jsp");

}
%>

