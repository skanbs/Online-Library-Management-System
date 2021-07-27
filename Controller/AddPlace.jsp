
<%@page import="Model.Place"%>

<%!public String denullify(String s) {
		if (s == null)
			return "";
		else
			return s;
	}%>
<%
	int Num = Integer.parseInt(request.getParameter("Num"));
String Add = this.denullify(request.getParameter("Add"));

if (Add.equals("Platz Addieren")) {

	try {
		Place P = new Place(Num);

		Place.InsertPlace(P);

		response.sendRedirect("../View/Places.jsp");

	} catch (Exception e) {

		response.sendRedirect("../View/Error.jsp");

	}
} else {

	response.sendRedirect("../View/Error.jsp");

}
%>