<footer class="footer">
   
    </footer>



<footer class="footer-small">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-sm-6 pull-right">
	         			<ul class="social-link-footer list-unstyled ">
			<li class="wow flipInX animated "  style="color:#E74c3c;" data-wow-duration="2s"
						data-wow-delay=".1s" data-wow-animation-name="flipInX"
						style="visibility: visible; animation-duration: 2s; animation-delay: 0.1s; animation-name: flipInX;"><h1
						id="texti" class="FreePlaces"> </h1></li>
					<li class="wow flipInX animated" style="color:#ffffff;" data-wow-duration="2s"
						data-wow-delay=".1s" data-wow-animation-name="flipInX"
						style="visibility: visible; animation-duration: 2s; animation-delay: 0.1s; animation-name: flipInX;"><h1>Eintrittsverf&uuml;gbarkeit:</h1></li>
					
				</ul> 
			</div>
			<div class="col-md-4">
				<div class="copyright">

					<p> &#169; Copyright - Team BiB|ViSiT.</p>

				</div>
			</div>
		</div>
	</div>
</footer>

<script type>
	window.setInterval("refreshIt()", 100);
	function refreshIt() {
		var aktuplaces = localStorage.getItem('AFP')
		document.getElementById("texti").innerHTML = aktuplaces;
	}
</script>