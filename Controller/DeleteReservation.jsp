<%@page import="Model.Reservation"%>
<%
	int ID = Integer.parseInt(request.getParameter("ID"));
Reservation.DeleteReservation(ID);

response.sendRedirect("../View/Reservations.jsp");
%>