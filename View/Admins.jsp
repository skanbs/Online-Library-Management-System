<jsp:include page="./Header.jsp" />
<body>
	<jsp:include page="./BackEndNavigationbar.jsp" />

	<%@page import="Model.Admin"%>
	<%@page import="java.util.Vector"%>


	<%
	
		try {
			if (session.equals(null) || (session.getAttribute("Account").equals(0))) {
		response.sendRedirect("../View/Error.jsp");
		
			} else if (session.getAttribute("Account").equals(1)) {
			
	
	
		Vector<Admin> vectorAdmin = Admin.getAll();
	%>
	<div class="bs-docs-section">
		<h2 id="tables-example">Admins</h2>

		<p>
			Wir Sind :
			<code><%=vectorAdmin.size()%></code>
			Admins
		</p>




		<div class="bs-example col-sm-6">
			<input type="text" id="SearchAdmin" class="form-control"
				onkeyup="SearchAdmin(<%=vectorAdmin.size()%>)"
				placeholder="Admin Suchen">

		</div>


		<div class="bs-example">
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>Username</th>
						<th>Email</th>
						<th>Admin-Status </th>
						<th>Konto-Status</th>
						<th>Löschen</th>
						<th>Update Admin</th>
						<th>Update Activ</th>
					</tr>
				</thead>
				<tbody>

					<%
						int i = 0;

					for (Admin A : vectorAdmin) {
					%>

					<tr id="<%out.print(i + "tr");%>">
						<td><%=A.getUserid()%></td>
						<td id="<%=i%>"><%=A.getUsername()%></td>
						<td><%=A.getEmail()%></td>
						<td>
							<%
								if (A.getAdmin().equalsIgnoreCase("Y"))
								out.print("Hauptadmin");
							else
								out.print("Admin");
							%>
						</td>
						<td>
							<%
								if (A.getActive().equals("Y"))
								out.print("Aktiviert");
							else
								out.print("Deaktiviert");
							%>
						</td>


						<td><a
							href="../Controller/DeleteAdmin.jsp?Email=<%=A.getEmail()%>&Att=Delete">Löschen</a></td>
						<td><a
							href="../Controller/UpdateAdmin.jsp?Email=<%=A.getEmail()%>&Att=Admin&A=<%=A.getAdmin()%>">
								<%
									if (A.getAdmin().equalsIgnoreCase("Y"))
									out.print("nicht als Hauptadmin einstellen");
								else
									out.print("als Hauptadmin einstellen");
								%>
						</a></td>
						<td><a
							href="../Controller/UpdateAdmin.jsp?Email=<%=A.getEmail()%>&Att=Active&A=<%=A.getActive()%>">
								<%
									if (A.getActive().equalsIgnoreCase("Y"))
									out.print("Konto deaktivieren");
								else
									out.print("Konto aktivieren");
								%>
						</a></td>


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

