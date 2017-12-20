<%@page import="java.util.ArrayList"%>
<%@page import="vo.RegVo"%>
<!DOCTYPE html>
<%if(session.getAttribute("enrollment") == null){
	response.sendRedirect("login.jsp");
}else{ %>
<html lang="en">
<!-- Mirrored from demo.neontheme.com/extra/profile/ by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 15 Sep 2015 16:27:15 GMT -->
<head>
<jsp:include page="/User/masterPage.jsp"></jsp:include>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Neon Admin Panel" />
<meta name="author" content="Laborator.co" />
<title>CampusTalk| Profile</title>

<link rel="stylesheet" href="../css/jquery-ui-1.10.3.custom.min.css"
	id="style-resource-1">
<link rel="stylesheet" href="../css/entypo.css" id="style-resource-2">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic"
	id="style-resource-3">
<link rel="stylesheet" href="../css/neon-forms.css"
	id="style-resource-4">
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
<!-- TS1442334029: Neon - Responsive Admin Template created by Laborator -->
</head>
<body class="page-body" data-url="http://demo.neontheme.com">
	<!-- TS14423340292256: Xenon - Boostrap Admin Template created by Laborator / Please buy this theme and support the updates -->
	<div class="page-container">
		<!-- TS144233402916972: Xenon - Boostrap Admin Template created by Laborator / Please buy this theme and support the updates -->
		<div class="main-content">
			<!-- TS144233402911004: Xenon - Boostrap Admin Template created by Laborator / Please buy this theme and support the updates -->

			<hr />
			<%
				ArrayList<RegVo> list = (ArrayList) session.getAttribute("list_studentDetails");
				Long id = Long.parseLong(request.getParameter("id"));
				RegVo rv1 = null;
				for (RegVo rv : list) {
					if (rv.getRegistration_enrollment() == id) {
						rv1 = rv;
						break;
					}
				}
			

			String imagePath= "pic";
					if(!rv1.getRegistration_profilePic().equals("")){
					imagePath = rv1.getRegistration_profilePic().replace("\\", "/");
					String path[] = imagePath.split("images");
					imagePath = "../images"+path[1];}	%>
			<div class="profile-env">
				<header class="row">
					<div class="col-sm-2">
						<div class="profile-picture"> <img
							src="<%=request.getContextPath() %>/ImageServlet?imageID=<%=rv1.getRegistration_profilePic() %>" height="180" width="140"
							class="img-responsive img-circle"
							onError="this.onerror=null;this.src='../images/defaultProfilePic.png';" />
						</div>
					</div>
					<div class="col-sm-7">
						<ul class="profile-info-sections">
							<li>
								<div class="profile-name">
									<strong><b> <%=rv1.getRegistration_name()%></b> </strong> <span><%=rv1.getRegistration_department()%>
										engineering</span>
								</div>
							</li>
						</ul>
					</div>
				</header>
				<section class="profile-info-tabs">
					<div class="row sample">
						<div class="col-sm-offset-2 col-sm-10">
							<ul class="user-details">
								<li><i class="entypo-pencil"></i> Semester <%=rv1.getRegistration_semester()%>
								</li>
								<li><i class="entypo-user"></i> <%=rv1.getRegistration_gender()%>
								</li>
								<li><i class="entypo-calendar"></i> <%=rv1.getRegistration_date()%>
								</li>
							</ul>
							<!-- tabs for the profile links -->
							<ul class="nav nav-tabs">
								<li class="active"><a href="#profile-info">Profile</a></li>
							</ul>
						</div>
					</div>
				</section>

				<section class="blog">

					<div class="container">
						<div class="row">
							<div class="col-sm-8">
								<div class="col-md-10">
									<div class="panel panel-info" data-collapsed="0">
										<!-- panel head -->
										<div class="panel-heading">
											<div class="panel-title">Training Details</div>
											<div class="panel-options">
												 <a href="#" data-rel="collapse"><i
													class="entypo-down-open"></i></a> 
											</div>
										</div>
										<!-- panel body -->
										<div class="panel-body" style="display: none;">
											<p><%=rv1.getRegistration_tdetails() %></p>
										</div>
									</div>
								</div>
								
								<div class="col-md-10">
									<div class="panel panel-info" data-collapsed="0">
										<!-- panel head -->
										<div class="panel-heading">
											<div class="panel-title">Project Details</div>
											<div class="panel-options">
												 <a href="#" data-rel="collapse"><i
													class="entypo-down-open"></i></a> 
											</div>
										</div>
										<!-- panel body -->
										<div class="panel-body" style="display: none;">
											<p><%=rv1.getRegistration_pdetails() %></p>
										</div>
									</div>
								</div>
								
								<div class="col-md-10">
									<div class="panel panel-info" data-collapsed="0">
										<!-- panel head -->
										<div class="panel-heading">
											<div class="panel-title">Other Details</div>
											<div class="panel-options">
												 <a href="#" data-rel="collapse"><i
													class="entypo-down-open"></i></a> 
											</div>
										</div>
										<!-- panel body -->
										<div class="panel-body" style="display: none;">
											<p><%=rv1.getRegistration_odetails() %></p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="sidebar">
									<h3>
										<i class="entypo-list"></i> <strong><b>Contact Details</b></strong>
									</h3>
									<div class="sidebar-content">
										<ul align="right">
											<li><i class="entypo-mail"></i>&nbsp;&nbsp;<%=rv1.getRegistration_email() %></li>
											<li><i class="entypo-phone"></i>&nbsp;&nbsp;<%=rv1.getRegistration_phone() %></li>
											<li><i class="entypo-phone"></i>&nbsp;&nbsp;<%=rv1.getRegistration_alternatePhone() %></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>

				</section>

				<jsp:include page="/User/footer.jsp"></jsp:include>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="http://maps.google.com/maps/api/js?sensor=false"></script>
	<script type="text/javascript">
		function initialize() {
			var $ = jQuery, map_canvas = $("#sample-checkin");
			var location = new google.maps.LatLng(36.738888, -119.783013), map = new google.maps.Map(
					map_canvas[0], {
						center : location,
						zoom : 14,
						mapTypeId : google.maps.MapTypeId.ROADMAP,
						scrollwheel : false
					});
			var marker = new google.maps.Marker({
				position : location,
				map : map
			});
		}
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>
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
<!-- Mirrored from demo.neontheme.com/extra/profile/ by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 15 Sep 2015 16:27:34 GMT -->
</html>
<%}%>