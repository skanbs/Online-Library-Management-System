


<jsp:include page="./Header.jsp" />

	<jsp:include page="./FrontEndNavigationbar.jsp" />
	<div class="container">
	<h1>Kontakt</h1>


		<div class="row">
			<div class="col-lg-5 col-sm-5 address">
				<section class="contact-infos">
					<h4 class="title custom-font text-black">Addressen</h4>
					<address>
						Ernst-Boehe-Str 4, <br> 67059 Ludwigshafen am Rhein

					</address>
				</section>

				<section class="contact-infos">
					<h4>TELEPHONE</h4>
					

					<p>
						<i class="icon-phone"> </i> +49176516174
					</p>

				</section>
			</div>

			<div class="col-lg-7 col-sm-7 address">

				<h4>Schreiben Sie uns Ihre Feedback</h4>
				

				<div class="contact-form">

					<form action="../Controller/Contact.jsp" method="get">

						<div class="form-group">
							<label for="email">Email : </label> <input type="email"
								placeholder="E-Mail" name="Email" class="form-control" value="">
						</div>

						<div class="form-group">
							<label for="phone">Message: </label>
							<textarea name="MSG" rows="7" class="form-control">  </textarea>
						</div>

						<input type="submit" name="senden" value="Senden"
							class="btn btn-info" />

					</form>

				</div>
			</div>
		</div>

	</div>
	<div class="contact-map">
		<iframe
			style="width: 100%; height: 400px; position: relative; overflow: hidden;"
			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d10368.392713017245!2d8.43373463687365!3d49.48265241803433!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4797cc7da5bc4b03%3A0x8d162eeb59f44ecf!2sUniversity%20of%20Ludwigshafen%20am%20Rhein!5e0!3m2!1sen!2sde!4v1614378922725!5m2!1sen!2sde"
			width="600" height="450" style="border:0;" allowfullscreen=""
			loading="lazy"></iframe>

	</div>
	<jsp:include page="./Copyright.jsp" />

	<jsp:include page="./Footer.jsp" />
</body>
</html>
