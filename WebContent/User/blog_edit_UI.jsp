<%@page import="vo.BlogsVo"%>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%if(session.getAttribute("enrollment") == null){
	response.sendRedirect("login.jsp");
}else{ %>
<jsp:include page="masterPage.jsp"></jsp:include>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Neon Admin Panel" />
<meta name="author" content="Laborator.co" />
<title>Blogs</title>
<link rel="stylesheet"
	href="../css/jquery-ui-1.10.3.custom.min.css"
	id="style-resource-1">
<link rel="stylesheet"
	href="../css/entypo.css"
	id="style-resource-2">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic"
	id="style-resource-3">

<link rel="stylesheet" href="../css/neon-core.css"
	id="style-resource-5">
<link rel="stylesheet" href="../css/neon-theme.css"
	id="style-resource-6">
<link rel="stylesheet" href="../css/neon-forms.css"
	id="style-resource-7">
<link rel="stylesheet" href="../css/custom.css"
	id="style-resource-8">
<script src="../js/jquery-1.11.0.min.js"></script>
<script>
	$.noConflict();
</script>
<!--[if lt IE 9]><script src="http://demo.neontheme.com/assets/js/ie8-responsive-file-warning.js"></script>
<![endif]-->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]> <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script> 
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script> 
<![endif]-->
<!-- TS1442333969: Neon - Responsive Admin Template created by Laborator -->
</head>
<body class="page-body" data-url="http://demo.neontheme.com">

	<% ArrayList<BlogsVo> list = (ArrayList)session.getAttribute("list");
	int bid=Integer.parseInt(request.getParameter("id"));
	BlogsVo bv1=null;
	for(BlogsVo bv:list){
		if(bv.getBlog_id()==bid)
		{
			bv1=bv;
			break;
		}
	}%>
	<div class="page-container">
		
		<div class="main-content">
			
			<section class="breadcrumb">
		<div class="container">
			<div class="row">
				<div class="col-sm-9">
					<h1>Edit Your Blog</h1>
				</div>
			</div>
		</div>
		</section>
			<br />
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-primary" data-collapsed="0">
						<div class="panel-body">
							<form role="form" class="form-horizontal form-groups-bordered validate" method="post" action="<%=request.getContextPath()%>/CTServlet?type=blog&operation=edit&id=<%=request.getParameter("id")%>" enctype="multipart/form-data">
									<div class="form-group">
									<label for="field-1" class="col-sm-3 control-label">Category</label>
									<div class="col-sm-5">
											<select name="blog_category" class="selectboxit" id="category" selected="<%=bv1.getBlog_category() %>">
											<option>Art</option>
											<option>Photography</option>
											<option>Literature</option>
											<option>Technical</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="field-1" class="col-sm-3 control-label">Name</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" id="field-1" name="blog_name" value="<%=bv1.getBlog_name() %>" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="field-1" class="col-sm-3 control-label">Enrollment
										Id</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" id="field-2" name="blog_enrollment" value=<%=session.getAttribute("enrollment") %> readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="field-1" class="col-sm-3 control-label">Title*</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" id="field-3" name="blog_title" value="<%=bv1.getBlog_title() %>"data-validate="required" data-message-required="Please enter title">
									</div>
								</div>
								<%String imagePath="";
								if(!bv1.getBlog_file().equals("")){			
								imagePath= bv1.getBlog_file().replace("\\", "/");
								String path[] = imagePath.split("images");
								imagePath = "../images"+path[1];} %>
								<div class="form-group">
										<label class="col-sm-3 control-label">File Upload</label>
										<div class="col-sm-5">
											<div class="fileinput fileinput-new"
												data-provides="fileinput">
												<div class="fileinput-new thumbnail"
													style="width: 200px; height: 150px;"
													data-trigger="fileinput">
													<img src="<%=request.getContextPath() %>/ImageServlet?imageID=<%=bv1.getBlog_file() %>" 
													onError="this.onerror=null;this.src='../images/blogdefault1.png';this.style.heigh='40';this.style.width='40';"alt="...">
												</div>
												<div class="fileinput-preview fileinput-exists thumbnail"
													style="max-width: 200px; max-height: 150px"></div>
												<div>
													<span class="btn btn-white btn-file"> <span
														class="fileinput-new">Select image</span> <span
														class="fileinput-exists">Change</span> <input type="file"
														name="document" accept="image/*">
													</span> <a href="#" class="btn btn-orange fileinput-exists"
														data-dismiss="fileinput">Remove</a>
												</div>
											</div>
										</div>
									</div>
								<div class="form-group">
									<label for="field-ta" class="col-sm-3 control-label">Description</label>
									<div class="col-sm-5">
										<textarea class="form-control" id="field-ta" name="blog_description"><%=bv1.getBlog_description() %></textarea>
									</div>
								</div>
						<p>
					<center>
							<div class="form-group">
							<button type="submit" class="btn btn-success" name="blog_submit">Submit</button>
							<a href="<%=request.getContextPath() %>/CTServlet?type=blog&operation=view"><button type="text" class="btn" name="blog_cancel">Cancel</button></a>
						</div>
					</center>
					</p>
					</form>
						</div>
					</div>
					</div>
					</div>
					
							<jsp:include page="/User/footer.jsp"></jsp:include>
							
							<link rel="stylesheet"
		href="../css/jquery.selectBoxIt.css"
		id="style-resource-1">
		
					<script src="../js/main-gsap.js"
						id="script-resource-1"></script>
					<script
						src="../js/jquery-ui-1.10.3.minimal.min.js"
						id="script-resource-2"></script>
					<script src="../js/bootstrap.js" id="script-resource-3"></script>
					<script src="../js/joinable.js" id="script-resource-4"></script>
					<script src="../js/resizeable.js" id="script-resource-5"></script>
					<script src="../js/neon-api.js" id="script-resource-6"></script>
					<script src="../js/cookies.min.js" id="script-resource-7"></script>
					<script src="../js/bootstrap-switch.min.js"
						id="script-resource-8"></script>
					<script src="../js/neon-chat.js" id="script-resource-9"></script>
					<script src="../js/jquery.selectBoxIt.min.js" id="script-resource-10"></script>
					<script src="../js/fileinput.js" id="script-resource-21"></script>
					<!-- JavaScripts initializations and stuff -->
					<script src="../js/neon-custom.js"
						id="script-resource-11"></script>
					<!-- Demo Settings -->
					<script src="../js/neon-demo.js" id="script-resource-12"></script>
					<script src="../js/neon-skins.js" id="script-resource-13"></script>
					<script src="../js/jquery.validate.min.js" id="script-resource-20"></script>
					<script src="../js/dept&semSelection.js"></script>
				
				<script type="text/javascript">
					var category = "<%=bv1.getBlog_category() %>";
					setCategory(category);
				</script>
					
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
<!-- Mirrored from demo.neontheme.com/forms/main/ by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 15 Sep 2015 16:23:29 GMT -->
</html>
<%}%>