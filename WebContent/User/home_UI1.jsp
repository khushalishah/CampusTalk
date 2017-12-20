<%@page import="javax.print.attribute.standard.Sides"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.NoticeVo"%>
<%@page import="vo.BlogsVo"%>
<%@page import="vo.EventsVo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	if (session.getAttribute("enrollment") == null) {
		response.sendRedirect("login.jsp");
	} else {
%>
<html lang="en">
<head>


<jsp:include page="/User/masterPage.jsp"></jsp:include>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Neon Admin Panel" />
<meta name="author" content="Laborator.co" />
<title>CampusTalk|Home</title>
<style>
.row1 {
	height: 200px;
	width: 200px;
}

.row1 img {
	max-width: 100%;
	max-height: 100%;
	margin: auto;
	display: block;
}

.file-input-wrapper {
	overflow: hidden;
	position: relative;
	cursor: pointer;
	z-index: 1;
}

.file-input-wrapper input[type=file], .file-input-wrapper input[type=file]:focus,
	.file-input-wrapper input[type=file]:hover {
	position: absolute;
	top: 0;
	left: 0;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity = 0);
	z-index: 99;
	outline: 0;
}

.file-input-name {
	margin-left: 8px;
}
</style>
<link rel="stylesheet" href="../css/frontendcss/neon.css"
	id="style-resource-1">
<link href="../css/js-image-slider.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../css/entypo.css" id="style-resource-2">
<link href="../css/generic.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../css/jquery-ui-1.10.3.custom.min.css"
	id="style-resource-3">

<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic"
	id="style-resource-4">
<link rel="stylesheet" href="../css/neon-theme.css"
	id="style-resource-5">
<link rel="stylesheet" href="../css/neon-forms.css"
	id="style-resource-6">
<link rel="stylesheet" href="../css/bootstrap.css" id="style-resource-7">
<link rel="stylesheet" href="../css/neon-core.css" id="style-resource-8">
<link rel="stylesheet" href="../css/custom.css" id="style-resource-9">

<script src="../js/frontendjs/jquery-1.11.0.min.js"></script>
<script src="../js/jquery-1.11.0.min.js"></script>

<script>
	$.noConflict();
</script>

</head>

<body class="page-body">
	<div class="page-container">
		<div class="wrap">
			<section class="slider-container"
				style="background-image: url(../images/unnamed.jpg);">
				<div class="container">
					<div class="row">
						<div class="col-md-13">
							<div class="slides" style="height: 319px;">

								<div class="slide ">
									<div class="slide-image">
										<img src="../images/ld.png" class="img-responsive" />
									</div>
								</div>
								<div class="slide" data-bg="../images/slide-img-1-bg.png">
									<div class="slide-image">
										<img src="../images/annexe.png" class="img-responsive" />
									</div>
								</div>
								<div class="slide">
									<div class="slide-image">
										<img src="../images/department.png" class="img-responsive" />
									</div>
								</div>
								<div class="slides-nextprev-nav">
									<a href="#" class="prev"> <i class="entypo-left-open-mini"></i>
									</a> <a href="#" class="next"> <i
										class="entypo-right-open-mini"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section class="features-blocks">
				<div class="container">
					<div class="row vspace">
						<div class="col-sm-3">
							<div class="portfolio-info">
								<h3>
									<a href="#">LATEST NOTICES</a>
								</h3>
							</div>
						</div>

						<%
							ArrayList<NoticeVo> ls = (ArrayList) session.getAttribute("latestNotices");
								if (ls.size() != 0) {
						%>
						<div class="col-sm-3">
							<div class="tile-stats tile-blue">
									
								<div class="icon">
									<i class="entypo-docs"></i>
								</div>
								<%
									String titlesub = ls.get(0).getNotice_title();
											if (titlesub.length() >= 20) {
												titlesub = titlesub.substring(0, 20) + "...";
											}
								%>
								<div class="num">
									<%
									String oldPath = ls.get(0).getNotice_document();
									String newPath = oldPath.replace("\\","\\\\");
									
									%>
									<h2>
										<b><a href="javascript:;" id="answer1"
											onclick="onClickAnswer('<%=ls.get(0).getNotice_title()%>','<%=ls.get(0).getNotice_description()%>','<%=newPath%>')"
											style="color: white;"><%=titlesub%></b>
									</h2>
									</a>
								</div>
								<%
									String titlesub2 = ls.get(0).getNotice_description();
											if (titlesub2.length() >= 40) {
												titlesub2 = titlesub2.substring(0, 40) + "...";
											}
								%>
								<h3><%=titlesub2%></h3>
							</div>
						
						</div>
						<%
							}
								if (ls.size() > 1) {
						%>

						<div class="col-sm-3">

							<div class="tile-stats tile-orange">
								<div class="icon">
									<i class="entypo-docs"></i>
								</div>
								<%
									String titlesub3 = ls.get(1).getNotice_title();
											if (titlesub3.length() >= 20) {
												titlesub3 = titlesub3.substring(0, 20) + "...";
											}
								%>
								<div class="num">
									<%
									String oldPath = ls.get(1).getNotice_document();
									String newPath = oldPath.replace("\\","\\\\");
									
									%>
									<h2>
										<b><a href="javascript:;" id="answer1"
											onclick="onClickAnswer('<%=ls.get(1).getNotice_title()%>','<%=ls.get(1).getNotice_description()%>','<%=newPath%>')"
											style="color: white;"><%=titlesub3%></b>
									</h2>
									</a>
								</div>
								<%
									String titlesub4 = ls.get(1).getNotice_description();
											if (titlesub4.length() >= 40) {
												titlesub4 = titlesub4.substring(0, 40) + "...";
											}
								%>
								<h3><%=titlesub4%></h3>
							</div>
						</div>

						<%
							}
								if (ls.size() > 2) {
						%>

						<div class="col-sm-3">
							<div class="tile-stats tile-cyan">
								<div class="icon">
									<i class="entypo-docs"></i>
								</div>
								<%
									String titlesub5 = ls.get(2).getNotice_title();
											if (titlesub5.length() >= 20) {
												titlesub5 = titlesub5.substring(0, 20) + "...";
											}
								%>
								<div class="num">
									<%
									String oldPath = ls.get(2).getNotice_document();
									String newPath = oldPath.replace("\\","\\\\");
									
									%>
									<h2>
										<b><a href="javascript:;" id="answer1"
											onclick="onClickAnswer('<%=ls.get(2).getNotice_title()%>','<%=ls.get(2).getNotice_description()%>','<%=newPath%>')"
											style="color: white;"><%=titlesub5%></a></b>
									</h2>
									
								</div>
								<%
									String titlesub6 = ls.get(2).getNotice_description();
											if (titlesub6.length() >= 40) {
												titlesub6 = titlesub6.substring(0, 40) + "...";
											}
								%>
								<h3><%=titlesub6%></h3>

							</div>
						</div>
						<%
							}
						%>
					</div>
					<div class="row">
						<div class="col-md-12">
							<hr />
						</div>
					</div>
				</div>
			</section>
			
		<%
				ArrayList<BlogsVo> blist = (ArrayList) session.getAttribute("latest blogs");
			%>
			<section class="portfolio-widget">
				<div class="container">
					<div class="row">
						<div class="col-sm-3">
							<div class="portfolio-info">
								<h3>
									<a
										href="<%=request.getContextPath()%>/CTServlet?type=blog&operation=view&page=1&showcount=All&category=Art">Latest
										Blogs</a>
								</h3>
							</div>
						</div>
						<%
							if (blist.size() != 0) {
						%>
						<div class="col-sm-3">
							<div class="portfolio-item row1">
								<%
									String imagePath = "";
											if (!blist.get(0).getBlog_file().equals("")) {
												imagePath = blist.get(0).getBlog_file().replace("\\", "/");
												String path[] = imagePath.split("images");
												imagePath = "../images" + path[1];
											}
								%>
								<a
									hreaf="blogDetailView_UI.jsp?id=<%=blist.get(0).getBlog_id()%>&isHome=true"
									class="image"><img
									src="<%=request.getContextPath()%>/ImageServlet?imageID=<%=blist.get(0).getBlog_file()%>"
									class="img-rounded" alt="../images/blogdefault1.png" id="ïmg1"
									onError="this.onerror=null;this.src='../images/blogdefault1.png';this.style.heigh='40';this.style.width='40';" />
									<span class="hover-zoom"></span></a>

								<h4>
									<%
										String titlesub11 = blist.get(0).getBlog_title();
												if (titlesub11.length() >= 20) {
													titlesub11 = titlesub11.substring(0, 20) + "...";
												}
									%>
									<i class="entypo-docs"></i> <a
										href="blogDetailView_UI.jsp?id=<%=blist.get(0).getBlog_id()%>&isHome=true"
										class="name"><%=titlesub11%></a>
								</h4>
								<%
									String descsub = blist.get(0).getBlog_description();
											if (descsub.length() >= 40) {
												descsub = descsub.substring(0, 40) + "...";
											}
								%>
								<div class="categories">
									<%=descsub%>
								</div>
							</div>
						</div>
						<%
							}
								if (blist.size() > 1) {
						%>
						<div class="col-sm-3">
							<div class="portfolio-item row1">
								<%
									String imagePath1 = "";
											if (!blist.get(1).getBlog_file().equals("")) {
												imagePath1 = blist.get(1).getBlog_file().replace("\\", "/");
												String path[] = imagePath1.split("images");
												imagePath1 = "../images" + path[1];
											}
								%>
								<a
									href="blogDetailView_UI.jsp?id=<%=blist.get(1).getBlog_id()%>&isHome=true"
									class="image"> <img
									src="<%=request.getContextPath()%>/ImageServlet?imageID=<%=blist.get(1).getBlog_file()%>"
									class="img-rounded" height="50" width="50"
									alt="../images/blogdefault1.png" id="img2"
									onError="this.onerror=null;this.src='../images/blogdefault1.png';this.style.heigh='40';this.style.width='40';" />
									<span class="hover-zoom"></span>
								</a>
								<h4>
									<%
										String titlesub12 = blist.get(1).getBlog_title();
												if (titlesub12.length() >= 20) {
													titlesub12 = titlesub12.substring(0, 20) + "...";
												}
									%>
									<i class="entypo-docs"></i> <a
										href="blogDetailView_UI.jsp?id=<%=blist.get(1).getBlog_id()%>&isHome=true"
										class="name"><%=titlesub12%></a>
								</h4>
								<%
									String descsub2 = blist.get(1).getBlog_description();
											if (descsub2.length() >= 40) {
												descsub2 = descsub2.substring(0, 40) + "...";
											}
								%>
								<div class="categories">
									<%=descsub2%>
								</div>
							</div>
						</div>
						<%
							}
								if (blist.size() > 2) {
						%>
						<div class="col-sm-3">
							<div class="portfolio-item row1">
								<%
									String imagePath2 = "";
											if (!blist.get(2).getBlog_file().equals("")) {
												imagePath2 = blist.get(2).getBlog_file().replace("\\", "/");
												String path[] = imagePath2.split("images");
												imagePath2 = "../images" + path[1];
											}
								%>
								<a
									href="blogDetailView_UI.jsp?id=<%=blist.get(2).getBlog_id()%>&isHome=true"
									class="image"> <img
									src="<%=request.getContextPath()%>/ImageServlet?imageID=<%=blist.get(2).getBlog_file()%>"
									class="img-rounded" width="50" height="50"
									alt="../images/blogdefault1.png" id="img3"
									onError="this.onerror=null;this.src='../images/blogdefault1.png';this.style.heigh='40%';this.style.width='40%';" />
									<span class="hover-zoom"></span>
								</a>
								<h4>
									<%
										String titlesub13 = blist.get(2).getBlog_title();
												if (titlesub13.length() >= 20) {
													titlesub13 = titlesub13.substring(0, 20) + "...";
												}
									%>
									<i class="entypo-docs"></i> <a
										href="blogDetailView_UI.jsp?id=<%=blist.get(2).getBlog_id()%>&isHome=true"
										class="name"><%=titlesub13%></a>
								</h4>
								<%
									String descsub3 = blist.get(2).getBlog_description();
											if (descsub3.length() >= 40) {
												descsub3 = descsub3.substring(0, 40) + "...";
											}
								%>
								<div class="categories">
									<%=descsub3%>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
				</div>
			</section>



			<section class="testimonials-container">
				<div class="container">
					<div class="col-md-12">
						<div class="testimonials carousel slide" data-interval="8000">
							<div class="carousel-inner">
								<div class="item active">
									<blockquote>
										<p>
											Our greatest weakness lies in giving up. <br /> The most
											certain way to succeed is always to try one more time.
										</p>
										<small> Thomas A. Edison </small>
									</blockquote>
								</div>
								<div class="item">
									<blockquote>
										<p>
											You may never know what results come of your action. <br />
											But if you do nothing there will be no results.
										</p>
										<small> Ghandi </small>
									</blockquote>
								</div>
								<div class="item">
									<blockquote>
										<p>
											A dream doesn't become reality through magic. <br /> It
											takes sweat, determination and hard work.
										</p>
										<small> Colin Powell </small>
									</blockquote>
								</div>
								<!-- 	<div class="testimonials-nav">
								<a href="#" data-index="0" class=""></a><a href="#"
									data-index="1" class=""></a><a href="#" data-index="2"
									class="active"></a>
							</div> -->
							</div>
						</div>
					</div>
				</div>


			</section>
			<jsp:include page="/User/footer.jsp"></jsp:include>
		</div>
	</div>
			
<div class="modal fade" id="modal-6">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<b><strong><h2 class="modal-title">Notice Title</h2></strong></b>
			</div>
			<div class="modal-body"><h5 class="modal-desc">Notice description</h5>
			<br>            <label class = "filepath" id = "filepath" hidden></label>
								<button type="button" class="btn btn-blue" onClick = "download()">
									Download <i class="entypo-down"></i>
								</button>
							&nbsp;&nbsp;<label class="filename">filename</label>
							</div>			
		</div>
	</div>
	</div>
	<script src="../js/frontendjs/gsap/main-gsap.js" id="script-resource-1"></script>
	<script src="../js/frontendjs/bootstrap.js" id="script-resource-2"></script>
	<script src="../js/frontendjs/joinable.js" id="script-resource-3"></script>
	<script src="../js/frontendjs/resizeable.js" id="script-resource-4"></script>
	<script src="../js/frontendjs/neon-slider.js" id="script-resource-5"></script>
	<script src="../js/frontendjs/jquery-1.11.0.min.js"></script>
	<!-- JavaScripts initializations and stuff -->
	<script src="../js/frontendjs/neon-custom.js" id="script-resource-6"></script>
	<script src="../js/jquery-ui-1.10.3.minimal.min.js"
		id="script-resource-7"></script>
	<script src="../js/typeahead.min.js" id="script-resource-11"></script>
	<script src="../js/bootstrap-tagsinput.min.js" id="script-resource-10"></script>
	<script src="../js/bootstrap.js" id="script-resource-12"></script>
	<script src="../js/joinable.js" id="script-resource-13"></script>
	<script src="../js/resizeable.js" id="script-resource-14"></script>
	<script src="../js/neon-api.js" id="script-resource-15"></script>
	<script src="../js/cookies.min.js" id="script-resource-16"></script>
	<script src="../js/neon-custom.js" id="script-resource-17"></script>
	<script src="../js/neon-demo.js" id="script-resource-18"></script>
	<script src="../js-image-slider.js" type="text/javascript"
		id="script-resource-8"></script>
	<script type="text/javascript">
		var queid;

		function onClickAnswer(question,description,path) {
			//alert("method called "+question);
			//queid=id;	
			var que = question;
			var desc = description;
			var document = path.split(/[\s\\\\]+/);
			var pa= '<%=request.getContextPath()%>/DownloadServlet?filePath=';
			pa = pa+path;
			$("h2.modal-title").text(que);
			$("h5.modal-desc").text(desc);
			$("label.filepath").text(pa);
			if(path == "")
				{
				$("label.filename").text("No file available");
				}
			else
				{
				$("label.filename").text(document[document.length-1]);
				}
			jQuery('#modal-6').modal('show', {backdrop : 'static'});
			
		}
		
		function download(){
			var filepath=document.getElementById("filepath").innerHTML;
			//alert(filepath);
			window.location.href = filepath;
		}
	</script>
		<script src="../js/frontendjs/gsap/main-gsap.js" id="script-resource-1"></script>
	<script src="../js/frontendjs/bootstrap.js" id="script-resource-2"></script>
	<script src="../js/frontendjs/joinable.js" id="script-resource-3"></script>
	<script src="../js/frontendjs/resizeable.js" id="script-resource-4"></script>
	<script src="../js/frontendjs/neon-slider.js" id="script-resource-5"></script>
	<script src="../js/frontendjs/jquery-1.11.0.min.js"></script>
	<!-- JavaScripts initializations and stuff -->
	<script src="../js/frontendjs/neon-custom.js" id="script-resource-6"></script>

	<script src="../js-image-slider.js" type="text/javascript"
		id="script-resource-7"></script>
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
<%
	}
%>