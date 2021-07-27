
<jsp:include page="./Header.jsp" />

<%@page import="java.sql.Date"%>
<%@page import="Model.Place"%>
<%@page import="Model.Reservation"%>
<%@page import="java.util.Vector"%>
<%!public Date denullidate(String d) {
		if (d == null)
			return Date.valueOf(java.time.LocalDate.now());
		else
			return Date.valueOf(d);

	}%>
<%
	Date day = this.denullidate(request.getParameter("day"));
Vector<Integer> Vectorofalldayplaces = Reservation.getAlldayplaces(day);
int Reservierte = Vectorofalldayplaces.size();
%>
<div class="container">
	<div class="row">
		<h3>Bibliothek</h3>
	</div>
</div>
<div class="col-lg-9">
	<%
		Vector<Place> vectorofplaces = Place.getAll();
	int notavailable = 0;
	for (Place P : vectorofplaces) {
		if ((Vectorofalldayplaces.contains(P.getNum())) || (P.getAvailable() == 0)) {
			notavailable++;
	%>
	<div class="col-lg-2 col-sm-2 mar-two">
		<div class="pricing-table btn btn-danger " style="width: 100%;">
			<ul class="list-unstyled">
				<li>
					<h3><%=P.getNum()%></h3>
				</li>
				<li>Nicht verfügbar</li>
			</ul>
		</div>
	</div>
	<%
		} else {
	%>
	<div class="col-lg-2 col-sm-2 mar-two">
		<a data-toggle="modal" onclick="Providingplacenum(<%=P.getNum()%>)"
			href="#myModal" class="pricing-table btn btn-success"
			style="width: 100%;">
			<ul class="list-unstyled">
				<li>
					<h3>
						<%=P.getNum()%>
					</h3>
				</li>
				<li>Buchen</li>
			</ul>
		</a>
	</div>
	<%
		}
	}
	%>
</div>
<div class="col-lg-3">
<ul class="list-unstyled">
	<div class="search-row">
                <li class="form-inline">
		<h3>
			Buchungstag: </h3><input type="date" id="day" name="day"
				class="form-control placeholder-no-fix"
				min="<%=java.time.LocalDate.now()%>" value="<%=day%>"
				onchange="chnageday(this.value)">
		
                </li>

                <li>
                 <h3>
                    <i class="fa fa-angle-right pr-10">
                    </i>
                    Anzahl der Plätze: <%=vectorofplaces.size() %>
                    </h3>
                  
                </li>
                <li><h3>
                    <i class="fa fa-angle-right pr-10">
                    </i>
                    Verfügbar : <%=vectorofplaces.size()- notavailable%>
                 </h3>
                </li>
                <li><h3>
                    <i class="fa fa-angle-right pr-10">
                    </i>
                    Besetzt : <%= notavailable%>
</h3>
                </li>
              </ul>

	</div>
</div>

<jsp:include page="./Reservation.jsp" />
<jsp:include page="./Footer.jsp" />
