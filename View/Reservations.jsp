<jsp:include page="./Header.jsp" />

	<jsp:include page="./BackEndNavigationbar.jsp" />
	<%@page import="Model.Reservation"%>
	<%@page import="java.util.Vector"%>
	<jsp:useBean id="reserv" class="Model.Reservation" scope="session" />
	<%
	try {
		if (session.equals(null) || (session.getAttribute("Account").equals(0))) {
	response.sendRedirect("../View/Error.jsp");
	
		} else if (session.getAttribute("Account").equals(1)) {
		

	
		Vector<Reservation> vectorofreservations = reserv.getAll();
	int all_Reservations = vectorofreservations.size();
	%>
	<div class="bs-docs-section">
		<h2 id="tables-example">Buchungen</h2>
		<p>
			Sie haben
			<code><%=all_Reservations%></code>
			Buchungen
		</p>

		<div class="bs-example col-sm-4">
			<input type="text" id="SearchInputV" class="form-control"
				onkeyup="SearchReservationVisitor(<%=all_Reservations%>)"
				placeholder="Buchung per Besucher Suchen">

		</div>
		<div class="bs-example col-sm-4">
			<input type="text" id="SearchInputP" class="form-control"
				onkeyup="SearchReservationPlace(<%=all_Reservations%>)"
				placeholder="Buchung per Platz Suchen">

		</div>
		<div class="bs-example col-sm-4">
			<input type="date" id="SearchInputD" class="form-control"
				onchange="SearchReservationDate(<%=all_Reservations%>)">

		</div>


		<div class="bs-example">
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>Platz</th>
						<th>Besucher</th>
						<th>Datum</th>
						<th>Löschen</th>
					</tr>
				</thead>
				<tbody>
					<%
						int i = 0;

					for (Reservation R : vectorofreservations) {
					%>


					<tr id="<%out.print(i + "tr");%>">
						<td><%=R.getID()%></td>
						<td id="<%=i + "P"%>"><%=R.getPlace()%></td>
						<td id="<%=i + "V"%>"><%=R.getVisitor()%></td>
						<td id="<%=i + "D"%>"><%=R.getDay()%></td>
					
						<td><a
							href="../Controller/DeleteReservation.jsp?ID=<%=R.getID()%>">Löschen</a></td>
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
