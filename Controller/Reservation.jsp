<%@page import="Model.Reservation"%>
<%@page import="Model.Visitor"%>
<%@page import="Model.Place"%>
<%@page import="java.util.concurrent.ThreadLocalRandom"%>
<%@page import="java.sql.Date"%>


<%!public String denullify(String s) {
		if (s == null)
			return "";
		else
			return s;
	}%>
<%
	String Psydo = request.getParameter("Psydo");
String Fach = request.getParameter("Fach");

int Imma = Integer.parseInt(request.getParameter("Imma"));
int Num = Integer.parseInt(request.getParameter("Num"));

Date day = Date.valueOf((request.getParameter("day")));

if (Visitor.SearchVisitor(Imma)) {
	if (Reservation.InsertReservation(Num, Imma, day)) {
		if (Place.getPlace(Num) != null) {

	response.sendRedirect("../View/Reserviert.jsp");
		}

		else {
	response.sendRedirect("../View/Error.jsp");
		}
	} else {
		response.sendRedirect("../View/Error.jsp");
	}
} else {
	if (Visitor.InsertVisitor(Imma, Psydo, Fach)) {
		if (Reservation.InsertReservation(Num, Imma, day)) {
	if (Place.getPlace(Num) != null) {
		response.sendRedirect("../View/Reserviert.jsp");
	} else {
		response.sendRedirect("../View/Error.jsp"); //Place nicht gefunden		
	}
		} else {
	response.sendRedirect("../View/Error.jsp"); //Reservation not inserted		
		}
	} else {
		response.sendRedirect("../View/Error.jsp"); //visitor not inserted
	}
}
%>
