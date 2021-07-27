
<jsp:include page="./Header.jsp" />



	<div class="login-bg">
		<div class="container">
			<div class="form-wrapper">
				<form class="form-signin wow fadeInUp animated"
					action="../Controller/Login.jsp" method="get">
			<h2 class="form-signin-heading">Jetzt Einloggen</h2>
					<div class="login-wrap">
						<input type="text" class="form-control" placeholder="E-mail"
							name="email" value=""> <input type="password"
							class="form-control" placeholder="Password" name="password"
							value=""> <input type="submit"
							class="btn btn-lg btn-login btn-block" name="login"
							value="Anmelden" />


						<div class="registration">
							Sie sind noch nicht eingetragen? <a
								href="./Signin.jsp">
								Admin anlegen </a>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
	<jsp:include page="./Footer.jsp" />
</body>
</html>