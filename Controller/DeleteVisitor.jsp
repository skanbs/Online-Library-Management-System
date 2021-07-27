<%@page import="Model.Visitor"%>
<%
	int Id = Integer.parseInt( request.getParameter("Id"));
       Visitor.DeleteVisitor(Id);
	response.sendRedirect("../View/Visitors.jsp");
%>