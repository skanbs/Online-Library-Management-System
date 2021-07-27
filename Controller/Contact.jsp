
<%@page import="Model.Messages"%>


<%!public String denullify(String s) {
		if (s == null)
			return "";
		else
			return s;
	}%>

<%
	String Email = this.denullify(request.getParameter("Email"));
String MSG = this.denullify(request.getParameter("MSG"));
String senden = this.denullify(request.getParameter("senden"));

if (senden.equals("Senden")) {
	Messages.Insert(Email, MSG);

	response.sendRedirect("../View/Home.jsp");
} else {
	response.sendRedirect("../View/Error.jsp");
}
%>

