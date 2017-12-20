<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList" %>
<%@page import="vo.BlogsVo" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%if(session.getAttribute("enrollment") == null){
	response.sendRedirect("login.jsp");
}else{ %>
<jsp:include page="/User/masterPage.jsp"></jsp:include>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Neon Admin Panel" />
<meta name="author" content="Laborator.co" />
<title>CampusTalks | Blog Post</title>

<link rel="stylesheet" href="../css/entypo.css" id="style-resource-2">
<link rel="stylesheet" href="../css/neon.css" id="style-resource-3">
<script src="../js/jquery-1.11.0.min.js"></script>
<script>
	$.noConflict();
</script>
<!--[if lt IE 9]><script src="http://demo.neontheme.com/assets/frontend/js/ie8-responsive-file-warning.js"></script><![endif]-->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]> <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script> <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script> <![endif]-->
<!-- TS1442334180: Neon - Responsive Admin Template created by Laborator -->
</head>
<body>
	<div class="wrap">

	<%
	ArrayList<BlogsVo> list=null;
	if(request.getParameterMap().containsKey("isHome"))
		{list = (ArrayList)session.getAttribute("latest blogs");}
	else
		{ list = (ArrayList)session.getAttribute("list");	}
	//System.out.println("size"+list.size());
		BlogsVo bv1=null;
		int id = Integer.parseInt(request.getParameter("id"));
		for(BlogsVo bv:list)
		{
			if(bv.getBlog_id()==id)
			{
				bv1=bv;
				break;
			}
		}
		
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(bv1.getBlog_date());
		sdf = new SimpleDateFormat("EEE, dd MMM yyyy");
		String strDate = sdf.format(date);
	%>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<hr class="no-top-margin" />
				</div>
			</div>
		</div>
		
		<%String imagePath="pic";
		if(!bv1.getBlog_file().equals("")){
		imagePath = bv1.getBlog_file().replace("\\", "/");
						String path[] = imagePath.split("images");
						imagePath = "../images"+path[1];} %>
		
		<section class="blog blog-single">
			<div class="container">
				<div class="row">
					<div class="col-sm-8">
						<div class="blog-post-single">
							 <img
								src="<%=request.getContextPath() %>/ImageServlet?imageID=<%=bv1.getBlog_file() %>"
								class="img-responsive img-rounded"
								onError="this.onerror=null;this.src='../images/blogdefault1.png';this.style.heigh='40';this.style.width='40';" />
							<br>
							<div class="post-details">
								<h3>
									<%=bv1.getBlog_title() %>
								</h3>
								<div class="post-meta">
									<div class="meta-info">
										<i class="entypo-calendar"></i> <%=strDate %>
									</div>
									<div class="meta-info">
										<i class="entypo-user"></i> <%=bv1.getBlog_name() %>
									</div>
								</div>
							</div>
							<div class="post-content">
								<%=bv1.getBlog_description() %>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
				<jsp:include page="/User/footer.jsp"></jsp:include>

	</div>
	<script src="../js/main-gsap.js" id="script-resource-1"></script>
	<script src="../js/bootstrap.js" id="script-resource-2"></script>
	<script src="../js/joinable.js" id="script-resource-3"></script>
	<script src="../js/resizeable.js" id="script-resource-4"></script>
	<!-- JavaScripts initializations and stuff -->
	<script src="../js/neon-custom.js" id="script-resource-5"></script>
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
<!-- Mirrored from demo.neontheme.com/frontend/blog-post/ by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 15 Sep 2015 16:32:39 GMT -->
</html>
<%}%>