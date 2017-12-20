<%@page import="vo.RegVo" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Mirrored from demo.neontheme.com/frontend/blog/ by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 15 Sep 2015 16:32:39 GMT -->
<head>

</style>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Neon Admin Panel" />
<meta name="author" content="Laborator.co" />
<title>campustalk</title>
<link rel="stylesheet"	href="../css/bootstrap.css" id="style-resource-4">
<link rel="stylesheet" href="../css/frontendcss/bootstrap.css"
	id="style-resource-1">

<link rel="stylesheet" href="../css/entypo.css" id="style-resource-2">
<link rel="stylesheet" href="../css/frontendcss/neon.css"
	id="style-resource-3">
	
<script src="../js/frontendjs/jquery-1.11.0.min.js"></script>
<script>
	$.noConflict();
</script>
<%if(session.getAttribute("enrollment") == null){
    response.sendRedirect("login.jsp");
} %>
<!--[if lt IE 9]><script src="http://demo.neontheme.com/assets/frontend/js/ie8-responsive-file-warning.js"></script><![endif]-->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]> <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script> <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script> <![endif]-->
<!-- TS1442334182: Neon - Responsive Admin Template created by Laborator -->
</head>
<body>
	<!-- TS144233418217619: Xenon - Boostrap Admin Template created by Laborator / Please buy this theme and support the updates -->
	<div class="wrap">
		<!-- TS144233418219866: Xenon - Boostrap Admin Template created by Laborator / Please buy this theme and support the updates -->
		<div class="site-header-container container">
			<div class="row">
				<div class="col-md-13">
					<header class="site-header"> <section class="site-logo">
					<a href="../User/home_UI.jsp"><img alt="" src="../images/logo-small.png" width="200" height="100" style="margin-left:5%;">
					</a> </section> <nav class="site-nav">
					<ul class="main-menu hidden-xs" id="main-menu" style="margin-top:2%">
						<li ><a href="home_UI.jsp"> <span>Home</span>
						</a></li>
						<%RegVo rv=(RegVo)session.getAttribute("RegObj"); %>
						
						
						<li><li ><a href=""><span>Notices</span></a>
						
							<ul>
								<li><a href="<%=request.getContextPath()%>/CTServlet?type=notice&operation=view&id=0"> <span>Departmental
									</span>
								</a></li>
								<li><a href="<%=request.getContextPath()%>/CTServlet?type=notice&operation=view&id=98521"> <span>VP Club </span>
								</a></li>
								<li><a href="<%=request.getContextPath()%>/CTServlet?type=notice&operation=view&id=96541"> <span>NCC</span>
								</a></li>
								<li><a href="<%=request.getContextPath()%>/CTServlet?type=notice&operation=view&id=74563"> <span>NSS
									</span>
								</a></li>
								<li><a href="<%=request.getContextPath()%>/CTServlet?type=notice&operation=view&id=69854"> <span>Placement
									</span>
								</a></li>
							</ul></li>
							<li><a href="<%=request.getContextPath()%>/CTServlet?type=event&operation=view&id=0"> <span>Events</span>
						</a></li>
						<li><a href="<%=request.getContextPath() %>/CTServlet?type=question&operation=view"> <span>Q&A</span>
						</a></li>
						 <li><a href=""><span>Blogs</span></a>
				
							<ul>
								<li><a href="<%=request.getContextPath() %>/CTServlet?type=blog&operation=view&page=1&showcount=Self"> <span>Post
									</span>
								</a></li>

								<li><a href="<%=request.getContextPath() %>/CTServlet?type=blog&operation=view&page=1&showcount=All&category=Art"> <span>View</span>
								</a></li>

							</ul></li>
						<li><a href="<%=request.getContextPath() %>/CTServlet?type=registration&operation=view&showcount=All&search=0"> <span>Student Profiles</span>
						</a></li>
						<li><span><a href="#">Forms</a></span>
							<ul>
								<li><a href="complain_UI.jsp"> <span>Complain
									</span>
								</a></li>

								<li><a href="feedback_UI.jsp"> <span>Feedback</span>
								</a></li>

							</ul></li>
						<li class="sep"></li>
					<%	String imagePath= "pic";
					if(!rv.getRegistration_profilePic().equals("")){
					imagePath = rv.getRegistration_profilePic().replace("\\", "/");
					String path[] = imagePath.split("images");
					imagePath = "../images"+path[1];}	 %>
						<li><a href=""><img src="<%= request.getContextPath()%>/ImageServlet?imageID=<%=rv.getRegistration_profilePic() %>"
								alt="Hi" class="img-circle" width="40" height="40"
								onError="this.onerror=null;this.src='../images/defaultProfilePic.png';"></a>
							    <ul class="dropdown-menu">
								<!-- Reverse Caret -->

								<!-- Profile sub-links -->
								<li><a href="<%=request.getContextPath()%>/CTServlet?type=registration&operation=view&id=<%=session.getAttribute("enrollment") %>&showcount=Self"> <i
										class="entypo-user"></i> Edit Profile
								</a></li>
								<li><a href="<%=request.getContextPath()%>/CTServlet?type=documents&operation=view"> <i
										class="entypo-upload"></i> Upload Documents
								</a></li>
								<li><a href="<%=request.getContextPath()%>/LogoutServlet "> <i
										class="entypo-logout"></i>   Logout
								</a></li>

							</ul></li>
						<!-- <li class="search"><a href="#"> <i class="entypo-search"></i>
						</a>
							<form method="get" class="search-form" action="#"
								enctype="application/x-www-form-urlencoded">
								<input type="text" class="form-control" name="q"
									placeholder="Type to search..." />
							</form></li> -->
					</ul>
					
					<div class="visible-xs">
						<a href="#" class="menu-trigger"> <i class="entypo-menu"></i>
						</a>
					</div>
					</nav> </header>
				</div>
			</div>
		</div>
		
	</div>
	
	<script src="../js/frontendjs/gsap/main-gsap.js" id="script-resource-1"></script>
	<script src="../js/frontendjs/bootstrap.js" id="script-resource-2"></script>
	<script src="../js/frontendjs/joinable.js" id="script-resource-3"></script>
	<script src="../js/frontendjs/resizeable.js" id="script-resource-4"></script>
	<!-- JavaScripts initializations and stuff -->
	<script src="../js/frontendjs/neon-custom.js" id="script-resource-5"></script>
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
<!-- Mirrored from demo.neontheme.com/frontend/blog/ by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 15 Sep 2015 16:32:42 GMT -->
</html>