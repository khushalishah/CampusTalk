<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="vo.NoticeVo"%>
<%@page import="java.util.ArrayList"%>
<%if(session.getAttribute("enrollment") == null){
	response.sendRedirect("login.jsp");
}else{ %>
<html>
<head><jsp:include page="/User/masterPage.jsp"></jsp:include>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Neon Admin Panel" />
<meta name="author" content="Laborator.co" />
<title>Notices</title>

<link rel="stylesheet" href="../css/entypo.css" id="style-resource-2">
<link rel="stylesheet" href="../css/frontendcss/neon.css"
	id="style-resource-3">
<link rel="stylesheet" href="../css/jquery-ui-1.10.3.custom.min.css"
	id="style-resource-4">
<link rel="stylesheet" href="../css/entypo.css" id="style-resource-5">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic"
	id="style-resource-6">
<link rel="stylesheet" href="../css/neon-core.css" id="style-resource-8">
<link rel="stylesheet" href="../css/neon-theme.css"
	id="style-resource-9">
<link rel="stylesheet" href="../css/neon-forms.css"
	id="style-resource-10">
<link rel="stylesheet" href="../css/custom.css" id="style-resource-11">

<script src="../js/frontendjs/jquery-1.11.0.min.js"></script>
<script src="../js/jquery-1.11.0.min.js"></script>
<script>
	$.noConflict();
</script>
<!--[if lt IE 9]><script src="http://demo.neontheme.com/assets/frontend/js/ie8-responsive-file-warning.js"></script><![endif]-->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]> <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script> <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script> <![endif]-->
<!-- TS1442334182: Neon - Responsive Admin Template created by Laborator -->
</head>
<body>

	<div class="wrap">
		<%
			ArrayList<NoticeVo> list = (ArrayList) session.getAttribute("list");
		%>
		<section class="breadcrumb">
		<div class="container">
			<div class="row">
				<div class="col-sm-9">
					<h1>Notices</h1>
				</div>
				<div class="col-sm-3">
					<h2 class="text-muted text-right"><%=list.size()%>
						Notices
					</h2>
				</div>
			</div>
		</div>
		</section>
		<section class="blog">
		<div class="container">
			
		<div class="row">
		
							<%
				int i = 0;
				for (NoticeVo nv : list) {
			%>		             
								<div class="col-md-12">
									<div class="panel panel-default panel-shadow" data-collapsed="0">
										<!-- panel head -->
										<div class="panel-heading">
											<div class="panel-title"><%=nv.getNotice_title()%>
											
											</div>
											<% String strtDate;
											   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
											   Date date=sdf.parse(nv.getNotice_startDate());
											   sdf=new SimpleDateFormat("EEE, dd-MMM-yyyy");
											   strtDate=sdf.format(date);
											   
											%>
											 
											<div class="panel-options">
											<a href="#">Posted On: <%=strtDate%></a>
											 <a href="#" data-rel="collapse">
												
												<i
													class="entypo-down-open"></i></a> 
											</div>
										</div>
										<!-- panel body -->
										<div class="panel-body" style="display: none;">
											<p>  <%=nv.getNotice_description()%> </p>
											<br>
											<%
								if (!(nv.getNotice_document().equals(""))) {
										String doc = nv.getNotice_document();
										String fileArray[] = doc.split("\\\\");
										String filename = fileArray[fileArray.length - 1];
							%>
							<br> <a
								href="<%=request.getContextPath()%>/DownloadServlet?filePath=<%=nv.getNotice_document()%>">
								<button type="button" class="btn btn-blue">
									Download <i class="entypo-down"></i>
								</button>
							</a>&nbsp;&nbsp;<label><%=filename%></label>
							<%
								} else {
							%>
							<button type="button" class="btn btn-blue">
								Download <i class="entypo-down"></i>
							</button>
							&nbsp;&nbsp;<label>No File Available</label>
							<%
								}
							%>
										</div>
									</div>
								</div>	
								<%} %>	
								
		</section>
		<jsp:include page="/User/footer.jsp"></jsp:include>
	</div>

	

	<!-- <script src="../js/frontendjs/gsap/main-gsap.js" id="script-resource-1"></script>
	<script src="../js/frontendjs/bootstrap.js" id="script-resource-2"></script>
	<script src="../js/frontendjs/joinable.js" id="script-resource-3"></script>
	<script src="../js/frontendjs/resizeable.js" id="script-resource-4"></script>
	<!-- JavaScripts initializations and stuff 
	<script src="../js/frontendjs/neon-custom.js" id="script-resource-5"></script>

	<script src="../js/main-gsap.js" id="script-resource-6"></script>
	<script src="../js/jquery-ui-1.10.3.minimal.min.js"
		id="script-resource-7"></script>
	<script src="../js/jquery.selectBoxIt.min.js" id="script-resource-8"></script>
	<script src="../js/select2.min.js" id="script-resource-9"></script>
	<script src="../js/typeahead.min.js" id="script-resource-11"></script>
	<script src="../js/bootstrap.js" id="script-resource-12"></script> 
	<script src="../js/joinable.js" id="script-resource-13"></script>
	<script src="../js/resizeable.js" id="script-resource-14"></script>
	<script src="../js/neon-api.js" id="script-resource-15"></script>
	<script src="../js/cookies.min.js" id="script-resource-16"></script>


	<script src="../js/neon-custom.js" id="script-resource-17"></script>
	<script src="../js/neon-demo.js" id="script-resource-18"></script>-->
	
	<script src="../js/frontendjs/gsap/main-gsap.js" id="script-resource-1"></script>
	<script src="../js/frontendjs/bootstrap.js" id="script-resource-2"></script>
	<script src="../js/frontendjs/joinable.js" id="script-resource-3"></script>
	<script src="../js/frontendjs/resizeable.js" id="script-resource-4"></script>
	<!-- JavaScripts initializations and stuff -->
	<script src="../js/frontendjs/neon-custom.js" id="script-resource-5"></script>


	<script src="../js/jquery-ui-1.10.3.minimal.min.js"
		id="script-resource-7"></script>
	<script src="../js/jquery.selectBoxIt.min.js" id="script-resource-8"></script>
	<script src="../js/select2.min.js" id="script-resource-9"></script>
	<script src="../js/bootstrap-tagsinput.min.js" id="script-resource-10"></script>
	<script src="../js/typeahead.min.js" id="script-resource-11"></script>

	<script src="../js/joinable.js" id="script-resource-13"></script>
	<script src="../js/resizeable.js" id="script-resource-14"></script>
	<script src="../js/neon-api.js" id="script-resource-15"></script>
	<script src="../js/cookies.min.js" id="script-resource-16"></script>


	<script src="../js/neon-custom.js" id="script-resource-17"></script>
	<script src="../js/neon-demo.js" id="script-resource-18"></script>

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
<%}%>