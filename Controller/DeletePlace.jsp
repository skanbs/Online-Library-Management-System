<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="place" class="Model.Place" scope="session" />
<jsp:useBean id="reservation" class="Model.Reservation" scope="session" />
<%

	String Snum = request.getParameter("Num");

	int Num = Integer.parseInt(Snum);
		place.DeletePlace(Num);

		response.sendRedirect("../View/Places.jsp");


		
%>