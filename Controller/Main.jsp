<%!public String denullify(String s) {
		if (s == null)
			return "";
		else
			return s;
	}%>
<%
	String Page = this.denullify(request.getParameter("Page"));

int pagenumber = Integer.parseInt(Page);

switch (pagenumber) {
case 1:
	response.sendRedirect("../View/Home.jsp");
	break;
case 2:
	response.sendRedirect("../View/Contact.jsp");
	break;
case 3:
	response.sendRedirect("../View/AboutUs.jsp");
	break;
case 4:
{
	try {
		if (session.equals(null) || (session.getAttribute("Account").equals(0))) {
	response.sendRedirect("../View/Error.jsp");
	break;
		} else if (session.getAttribute("Account").equals(1)) {
			response.sendRedirect("../View/BackEndHome.jsp");
	break;
		}
	} catch (Exception e) {
		response.sendRedirect("../View/Error.jsp");
		break;
	}
}
case 5:
{
	try {
		if (session.equals(null) || (session.getAttribute("Account").equals(0))) {
	response.sendRedirect("../View/Error.jsp");
	break;
		} else if (session.getAttribute("Account").equals(1)) {
			response.sendRedirect("../View/Admins.jsp");
	break;
		}
	} catch (Exception e) {
		response.sendRedirect("../View/Error.jsp");
		break;
	}
}
case 6:
{
	try {
		if (session.equals(null) || (session.getAttribute("Account").equals(0))) {
	response.sendRedirect("../View/Error.jsp");
	break;
		} else if (session.getAttribute("Account").equals(1)) {
			response.sendRedirect("../View/Places.jsp");
	break;
		}
	} catch (Exception e) {
		response.sendRedirect("../View/Error.jsp");
		break;
	}
}
case 7:
{
	try {
		if (session.equals(null) || (session.getAttribute("Account").equals(0))) {
	response.sendRedirect("../View/Error.jsp");
	break;
		} else if (session.getAttribute("Account").equals(1)) {
			response.sendRedirect("../View/Visitors.jsp");
	break;
		}
	} catch (Exception e) {
		response.sendRedirect("../View/Error.jsp");
		break;
	}
}
case 8:
{
	try {
		if (session.equals(null) || (session.getAttribute("Account").equals(0))) {
	response.sendRedirect("../View/Error.jsp");
	break;
		} else if (session.getAttribute("Account").equals(1)) {
			response.sendRedirect("../View/Reservations.jsp");
	break;
		}
	} catch (Exception e) {
		response.sendRedirect("../View/Error.jsp");
		break;
	}
}

	
case 9: {
	try {
		if (session.equals(null) || (session.getAttribute("Account").equals(0))) {
	response.sendRedirect("../View/Error.jsp");
	break;
		} else if (session.getAttribute("Account").equals(1)) {
	response.sendRedirect("../View/Messages.jsp");
	break;
		}
	} catch (Exception e) {
		response.sendRedirect("../View/Error.jsp");
		break;
	}
}
case 10:
	session.setAttribute("Account", 0);
	session.invalidate();
	response.sendRedirect("../View/BackEndHome.jsp");
	break;
}
%>
