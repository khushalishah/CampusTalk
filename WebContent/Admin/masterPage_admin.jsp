<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<!-- <meta charset="utf-8"> -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Campus Talk | Admin</title>
<link rel="stylesheet" href="../css/jquery-ui-1.10.3.custom.min.css"
	id="style-resource-1">
<link rel="stylesheet" href="../css/entypo.css" id="style-resource-2">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic"
	id="style-resource-3">
<link rel="stylesheet" href="../css/bootstrap.css" id="style-resource-4">
<link rel="stylesheet" href="../css/neon-core.css" id="style-resource-5">
<link rel="stylesheet" href="../css/neon-theme.css"
	id="style-resource-6">
<link rel="stylesheet" href="../css/neon-forms.css"
	id="style-resource-7">
<link rel="stylesheet" href="../css/custom.css" id="style-resource-8">
<script src="../js/jquery-1.11.0.min.js"></script>
<script>
	$.noConflict();
</script>
<!--[if lt IE 9]><script src="http://demo.neontheme.com/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]> <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script> <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script> <![endif]-->
<!-- TS1442301062: Neon - Responsive Admin Template created by Laborator -->
</head>
<body class="page-body" data-url="http://demo.neontheme.com">
	<div class="page-container horizontal-menu">
		<header class="navbar navbar-fixed-top"> <!-- set fixed position by adding class "navbar-fixed-top" -->
		<div class="navbar-inner">
			<!-- logo -->
			<div class="navbar-brand">

				<img alt="" src="../images/logo_admin.png" width="150" height="45"
					style="margin-left: 10%;">
				<!--  <h5><font color="white">Campus Talk</font></h5> -->

			</div>
			<!-- main menu -->
			<ul class="navbar-nav" style="margin-top: 1.5%; margin-left: 3%">
				<li><a href="#"><i class="entypo-plus"></i><span
						class="title">Post</span></a>
					<ul>
						<li><a href="notice.jsp"><span class="title">Notice</span></a></li>
						<li><a href="events.jsp"><span class="title">Event</span></a>
						</li>

					</ul></li>

				<li><a href="#"><i class="entypo-pencil"></i><span
						class="title">Manage</span></a>
					<ul>
						<li><a
							href="<%=request.getContextPath()%>/CTServlet?type=notice&operation=view&id=<%=session.getAttribute("enrollment")%>"><span
								class="title">Notice</span></a></li>
						<li><a
							href="<%=request.getContextPath()%>/CTServlet?type=event&operation=view&id=<%=session.getAttribute("enrollment")%>"><span
								class="title">Event</span></a></li>

					</ul></li>
			</ul>
			<!-- notifications and other links -->

			<ul class="nav navbar-right pull-right"
				style="margin-top:1.5%;>
				<li class="sep"></li>
					
					<li class="sep"></li>
					<li><a href="changePassword.jsp">Change Password  <i
							class="entypo-key"></i>
					</a></li>
					<li><a href="<%=request.getContextPath()%>/LogoutServlet"> Log Out <i
							class="entypo-logout right"></i>
					</a></li>
					<!-- mobile only -->
					<li class="visible-xs">
						<!-- open/close menu icon (do not remove if you want to enable menu on mobile devices) -->
						<div class="horizontal-mobile-menu visible-xs">
							<a href="#" class="with-animation">
								<!-- add class "
				with-animation" to supportanimation -->
				<i class="entypo-menu"></i>
				</a>
		</div>
		</li>
		</ul>
	</div>
	</header>
	<h2></h2>

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