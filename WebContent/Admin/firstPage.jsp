<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Campus Talk | Admin</title>
</head>
<body class="page-body" data-url="http://demo.neontheme.com">
	<div class="page-container horizontal-menu">
		<%
			if (session.getAttribute("type").equals("super admin")) {
		%>
		<jsp:include page="/Admin/masterPage_superadmin.jsp"></jsp:include>
		<%
			} else {
		%>
		<jsp:include page="/Admin/masterPage_admin.jsp"></jsp:include>
		<%
			}
		%>

		<div class="main-content">
			<div class="container">
				<div class="row">
					<div class="col-md-12">

						<br> <br> <br> <br>
						<center>
							<%
								if (session.getAttribute("type").equals("super admin")) {
							%>
							<img src="../images/people.png"></img>
							<%
								} else {
							%>
							<img src="../images/users5.png"></img>
							<%
								}
							%>
							<br> <br> <br>
							<h1 style="color: #455a64;">
								<strong>Welcome To Campus Talk</strong>
							</h1>
						</center>



					</div>
				</div>
			</div>
			<script type="text/javascript">
				function showAjaxModal() {
					jQuery('#modal-7').modal('show', {
						backdrop : 'static'
					});
					jQuery
							.ajax({
								url : "http://demo.neontheme.com/data/ajax-content.txt",
								success : function(response) {
									jQuery('#modal-7 .modal-body').html(
											response);
								}
							});
				}
			</script>

		</div>
	</div>
	</div>
	</div>
	</div>
	<script src="../js/main-gsap.js" id="script-resource-1"></script>
	<script src="../js/jquery-ui-1.10.3.minimal.min.js"
		id="script-resource-2"></script>
	<script src="../js/bootstrap.js" id="script-resource-3"></script>
	<script src="../js/joinable.js" id="script-resource-4"></script>
	<script src="../js/resizeable.js" id="script-resource-5"></script>
	<script src="../js/neon-api.js" id="script-resource-6"></script>
	<script src="../js/cookies.min.js" id="script-resource-7"></script>
	<script src="../js/neon-chat.js" id="script-resource-8"></script>
	<!-- JavaScripts initializations and stuff -->
	<script src="../js/neon-custom.js" id="script-resource-9"></script>
	<!-- Demo Settings -->
	<script src="../js/neon-demo.js" id="script-resource-10"></script>
	<script src="../js/neon-skins.js" id="script-resource-11"></script>
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-28991003-7' ]);
		_gaq.push([ '_setDomainName', 'demo.neontheme.com' ]);
		_gaq.push([ '_trackPageview' ]);
		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>
</body>
</html>