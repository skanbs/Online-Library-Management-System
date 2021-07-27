<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="place" class="Model.Place" scope="session" />
<jsp:useBean id="reservation" class="Model.Reservation" scope="session" />
<jsp:useBean id="admin" class="Model.Admin" scope="session" />

<%
	
	String Snum = request.getParameter("Num");
	String SAvailability = request.getParameter("Availability");
	
	int Num = Integer.parseInt(Snum);
	int Availability = Integer.parseInt(SAvailability);
	
	if (Availability==0) Availability = 1; else Availability = 0;

		place.UpdateAvailability(Num, Availability);
		
		//update reservation expirecy 

		response.sendRedirect("../View/Places.jsp");
		
%>