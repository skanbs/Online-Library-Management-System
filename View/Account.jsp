
<li class="dropdown"><a class="dropdown-toggle"
	data-close-others="false" data-delay="0" data-hover="dropdown"
	data-toggle="dropdown" href="#">DatenBank <i
		class="fa fa-angle-down"></i>
</a>

	<ul class="dropdown-menu">

<% if (session.getAttribute("Admin").equals(1)){%>
		<jsp:include page="./Superior.jsp"/>
<%} %>
		<li><a href="../Controller/Main.jsp?Page=6">Plätze</a></li>

		<li><a href="../Controller/Main.jsp?Page=7">Besucher</a>
		</li>

		<li><a href="../Controller/Main.jsp?Page=8">Buchungen</a>
		</li>
		<li><a href="../Controller/Main.jsp?Page=9">Messages</a>
		</li>


	</ul></li>
	<li><a href="../Controller/Main.jsp?Page=10">Logout</a></li>
	
	
	
	</ul>

		</div>
	</div>
</header>
	<jsp:include page="./BreadCrumbs.jsp" />