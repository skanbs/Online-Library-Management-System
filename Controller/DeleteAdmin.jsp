<%@page import="Model.Admin"%>
<jsp:useBean id="admin" class="Model.Admin" scope="session" />

<%
	Admin.DeleteAdmin(request.getParameter("Email"));
	response.sendRedirect("../View/Admins.jsp");
%>