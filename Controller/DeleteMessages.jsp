<%@page import="Model.Messages"%>

<%
int ID = Integer.parseInt(request.getParameter("ID"));
	Messages.DeleteMessages(ID);
response.sendRedirect("../View/Messages.jsp");
%>