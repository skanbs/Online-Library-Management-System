
<jsp:include page="./Header.jsp" />

<div class="registration-bg">
	<div class="container">

		<form class="form-signin wow fadeInUp animated"
			action="../Controller/Signin.jsp" method="get">
			<h2 class="form-signin-heading">Jetzt Admin anlegen</h2>
			<div class="login-wrap">

				<input type="text" class="form-control" placeholder="User Name"
					name="username"> 
				<input type="email" class="form-control"
					placeholder="Email" name="email"> 
					<br>
				<input type="password"
					class="form-control" placeholder="Password" name="password">
				<input class="btn btn-lg btn-login btn-block" type="submit"
					name="registrieren" value="Registrieren">
				<div class="registration">
					Bereit registriert ? <a href="./Login.jsp"> Einloggen </a>
				</div>
			</div>


		</form>
	</div>

</div>
	<jsp:include page="./Footer.jsp" />
</body>
</html>