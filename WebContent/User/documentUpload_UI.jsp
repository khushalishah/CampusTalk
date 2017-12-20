<%@page import="vo.DocumentsVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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


		<section class="breadcrumb">
		<div class="container">
			<div class="row">
				<div class="col-sm-9">
					<h1>Upload Document
					</h1>
				</div>
			</div>
		</div>
		</section>
		<section class="blog">
		<div class="container">
			<div class="row">
				<div class="col-sm-10">
					<div class="panel panel-primary" data-collapsed="0">
						<div class="panel-body">
							<form role="form" class="form-horizontal form-groups-bordered"
								method="post"
								action="<%=request.getContextPath()%>/CTServlet?type=documents&operation=insert" enctype="multipart/form-data">

								<% ArrayList list = (ArrayList) session.getAttribute("documentsList");
								DocumentsVo dv=null;
								if(list.size()==0){
									dv = new DocumentsVo();
									dv.setDocument_10th("");
									dv.setDocument_12th("");
									dv.setDocument_birthC("");
									dv.setDocument_clgId("");
									dv.setDocument_drivingL("");
									dv.setDocument_other("");
									dv.setDocument_photo("");
									dv.setDocument_sem1("");
									dv.setDocument_sem2("");
									dv.setDocument_sem3("");
									dv.setDocument_sem4("");
									dv.setDocument_sem5("");
									dv.setDocument_sem6("");
									dv.setDocument_sem7("");
									dv.setDocument_sem8("");
									dv.setDocument_sign("");
									dv.setDocument_uniqueId("");
								}else{
									dv = (DocumentsVo) list.get(0);
								} %>

								<div class="form-group">
									<label class="col-sm-3 control-label">Photo</label>
									<div class="col-sm-5">
										<input type="file" class="form-control"
											name="document_profilePic" />
									</div>
									<%if(!(dv.getDocument_photo().equals(""))){
										String filepath[]=dv.getDocument_photo().split("\\\\");
										String path=filepath[filepath.length-1];%>
										<div class="col-sm-2">
									<a href="<%=request.getContextPath()%>/DownloadServlet?filePath=<%=dv.getDocument_photo()%>">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></a>
									</div><p><%=path %></p>
									<%}else{ %>
									<div class="col-sm-2">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button>
									</div><p class="col-sm-2">No File Available</p>
									<%} %>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label">Sign</label>
									<div class="col-sm-5">
										<input type="file" class="form-control" name="document_sign" />
									</div>
									
									<%if(!(dv.getDocument_sign().equals(""))){
										String filepath[]=dv.getDocument_sign().split("\\\\");
										String path=filepath[filepath.length-1];%>
										<div class="col-sm-2">
									<a href="<%=request.getContextPath()%>/DownloadServlet?filePath=<%=dv.getDocument_sign()%>">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></a></div><p><%=path %></p>
									<%}else{ %>
									<div class="col-sm-2">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></div><p>No File Available</p>
									<%} %>
									
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label">10th Marksheet</label>
									<div class="col-sm-5">
										<input type="file" class="form-control" name="document_10M" />
									</div>
									<%if(!(dv.getDocument_10th().equals(""))){
										String filepath[]=dv.getDocument_10th().split("\\\\");
										String path=filepath[filepath.length-1];%>
										<div class="col-sm-2">
									<a href="<%=request.getContextPath()%>/DownloadServlet?filePath=<%=dv.getDocument_10th()%>">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></a></div><p><%=path %></p>
									<%}else{ %>
									<div class="col-sm-2">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></div><p>No File Available</p>
									<%} %>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label">12th Marksheet</label>
									<div class="col-sm-5">
										<input type="file" class="form-control" name="document_12M" />
									</div>
									<%if(!(dv.getDocument_12th().equals(""))){
										String filepath[]=dv.getDocument_12th().split("\\\\");
										String path=filepath[filepath.length-1];%>
										<div class="col-sm-2">
									<a href="<%=request.getContextPath()%>/DownloadServlet?filePath=<%=dv.getDocument_12th()%>">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></a></div><p><%=path %></p>
									<%}else{ %>
									<div class="col-sm-2">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></div><p>No File Available</p>
									<%} %>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label">Semester-I
										Marksheet</label>
									<div class="col-sm-5">
										<input type="file" class="form-control" name="document_sem1M" />
									</div>
									<%if(!(dv.getDocument_sem1().equals(""))){
										String filepath[]=dv.getDocument_sem1().split("\\\\");
										String path=filepath[filepath.length-1];%>
										<div class="col-sm-2">
									<a href="<%=request.getContextPath()%>/DownloadServlet?filePath=<%=dv.getDocument_sem1()%>">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></a></div><p><%=path %></p>
									<%}else{ %>
									<div class="col-sm-2">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></div><p>No File Available</p>
									<%} %>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label">Semester-II
										Marksheet</label>
									<div class="col-sm-5">
										<input type="file" class="form-control" name="document_sem2M" />
									</div>
									<%if(!(dv.getDocument_sem2().equals(""))){
										String filepath[]=dv.getDocument_sem2().split("\\\\");
										String path=filepath[filepath.length-1];%>
										<div class="col-sm-2">
									<a href="<%=request.getContextPath()%>/DownloadServlet?filePath=<%=dv.getDocument_sem2()%>">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></a></div><p><%=path %></p>
									<%}else{ %>
									<div class="col-sm-2">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></div><p>No File Available</p>
									<%} %>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label">Semester-III
										Marksheet</label>
									<div class="col-sm-5">
										<input type="file" class="form-control" name="document_sem3M" />
									</div>
									<%if(!(dv.getDocument_sem3().equals(""))){
										String filepath[]=dv.getDocument_sem3().split("\\\\");
										String path=filepath[filepath.length-1];%>
										<div class="col-sm-2">
									<a href="<%=request.getContextPath()%>/DownloadServlet?filePath=<%=dv.getDocument_sem3()%>">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></a></div><p><%=path %></p>
									<%}else{ %>
									<div class="col-sm-2">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></div><p>No File Available</p>
									<%} %>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Semester-IV
										Marksheet</label>
									<div class="col-sm-5">
										<input type="file" class="form-control" name="document_sem4M" />
									</div>
									<%if(!(dv.getDocument_sem4().equals(""))){
										String filepath[]=dv.getDocument_sem4().split("\\\\");
										String path=filepath[filepath.length-1];%>
										<div class="col-sm-2">
									<a href="<%=request.getContextPath()%>/DownloadServlet?filePath=<%=dv.getDocument_sem4()%>">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></a></div><p><%=path %></p>
									<%}else{ %>
									<div class="col-sm-2">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></div><p>No File Available</p>
									<%} %>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Semester-V
										Marksheet</label>
									<div class="col-sm-5">
										<input type="file" class="form-control" name="document_sem5M" />
									</div>
									<%if(!(dv.getDocument_sem5().equals(""))){
										String filepath[]=dv.getDocument_sem5().split("\\\\");
										String path=filepath[filepath.length-1];%>
										<div class="col-sm-2">
									<a href="<%=request.getContextPath()%>/DownloadServlet?filePath=<%=dv.getDocument_sem5()%>">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></a></div><p><%=path %></p>
									<%}else{ %>
									<div class="col-sm-2">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></div><p>No File Available</p>
									<%} %>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Semester-VI
										Marksheet</label>
									<div class="col-sm-5">
										<input type="file" class="form-control" name="document_sem6M" />
									</div>
									<%if(!(dv.getDocument_sem6().equals(""))){
										String filepath[]=dv.getDocument_sem6().split("\\\\");
										String path=filepath[filepath.length-1];%>
										<div class="col-sm-2">
									<a href="<%=request.getContextPath()%>/DownloadServlet?filePath=<%=dv.getDocument_sem6()%>">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></a></div><p><%=path %></p>
									<%}else{ %>
									<div class="col-sm-2">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></div><p>No File Available</p>
									<%} %>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Semester-VII
										Marksheet</label>
									<div class="col-sm-5">
										<input type="file" class="form-control" name="document_sem7M" />
									</div>
									<%if(!(dv.getDocument_sem7().equals(""))){
										String filepath[]=dv.getDocument_sem7().split("\\\\");
										String path=filepath[filepath.length-1];%>
										<div class="col-sm-2">
									<a href="<%=request.getContextPath()%>/DownloadServlet?filePath=<%=dv.getDocument_sem7()%>">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></a></div><p><%=path %></p>
									<%}else{ %>
									<div class="col-sm-2">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></div><p>No File Available</p>
									<%} %>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Semester-VIII
										Marksheet</label>
									<div class="col-sm-5">
										<input type="file" class="form-control" name="document_sem8M" />
									</div>
									<%if(!(dv.getDocument_sem8().equals(""))){
										String filepath[]=dv.getDocument_sem8().split("\\\\");
										String path=filepath[filepath.length-1];%>
										<div class="col-sm-2">
									<a href="<%=request.getContextPath()%>/DownloadServlet?filePath=<%=dv.getDocument_sem8()%>">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></a></div><p><%=path %></p>
									<%}else{ %>
									<div class="col-sm-2">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></div><p>No File Available</p>
									<%} %>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label">College ID Card</label>
									<div class="col-sm-5">
										<input type="file" class="form-control"
											name="document_collegeID" />
									</div>
									<%if(!(dv.getDocument_clgId().equals(""))){
										String filepath[]=dv.getDocument_clgId().split("\\\\");
										String path=filepath[filepath.length-1];%>
										<div class="col-sm-2">
									<a href="<%=request.getContextPath() %>/DownloadServlet?filePath=<%=dv.getDocument_clgId() %>">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></a></div><p><%=path %></p>
									<%}else{ %>
									<div class="col-sm-2">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></div><p>No File Available</p>
									<%} %>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label">Unique ID
										Card(Aadhar Card)</label>
									<div class="col-sm-5">
										<input type="file" class="form-control"
											name="document_uniqueID" />
									</div>
									<%if(!(dv.getDocument_uniqueId().equals(""))){
										String filepath[]=dv.getDocument_uniqueId().split("\\\\");
										String path=filepath[filepath.length-1];%>
										<div class="col-sm-2">
									<a href="<%=request.getContextPath()%>/DownloadServlet?filePath=<%=dv.getDocument_uniqueId() %>">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></a></div><p><%=path %></p>
									<%}else{ %>
									<div class="col-sm-2">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></div><p>No File Available</p>
									<%} %>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label">Driving License</label>
									<div class="col-sm-5">
										<input type="file" class="form-control"
											name="document_drivingLicense" />
									</div>
									<%if(!(dv.getDocument_drivingL().equals(""))){
										String filepath[]=dv.getDocument_drivingL().split("\\\\");
										String path=filepath[filepath.length-1];%>
										<div class="col-sm-2">
									<a href="<%=request.getContextPath()%>/DownloadServlet?filePath=<%=dv.getDocument_drivingL()%>">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></a></div><p><%=path %></p>
									<%}else{ %>
									<div class="col-sm-2">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></div><p>No File Available</p>
									<%} %>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label">Birth Certificate</label>
									<div class="col-sm-5">
										<input type="file" class="form-control"
											name="document_birthCerti" />
									</div>
									<%if(!(dv.getDocument_birthC().equals(""))){
										String filepath[]=dv.getDocument_birthC().split("\\\\");
										String path=filepath[filepath.length-1];%>
										<div class="col-sm-2">
									<a href="<%=request.getContextPath()%>/DownloadServlet?filePath=<%=dv.getDocument_birthC()%>">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></a></div><p><%=path %></p>
									<%}else{ %>
									<div class="col-sm-2">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></div><p>No File Available</p>
									<%} %>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label">Other Document
										(Any One)</label>
									<div class="col-sm-5">
										<input type="file" class="form-control"
											name="document_otherDocument" />
									</div>
									<%if(!(dv.getDocument_other().equals(""))){
										String filepath[]=dv.getDocument_other().split("\\\\");
										String path=filepath[filepath.length-1];%>
										<div class="col-sm-2">
									<a href="<%=request.getContextPath()%>/DownloadServlet?filePath=<%=dv.getDocument_other()%>">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></a></div><p><%=path %></p>
									<%}else{ %>
									<div class="col-sm-2">
									<button type="button" class="btn btn-blue">
										Download <i class="entypo-down"></i>
									</button></div><p>No File Available</p>
									<%} %>
								</div>
							
								</div>
								</div>
								<p>
								<center>
									<div class="form-group">
										<button type="submit" class="btn btn-success"
											name="registration_submit">Submit</button>
										<a href="home_UI.jsp"><button type="button" class="btn" name="registration_cancel">Cancel</button></a>
									</div>
								</center>
								</p>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
		</section>
			<jsp:include page="/User/footer.jsp"></jsp:include>
	

		<link rel="stylesheet" href="../css/select2-bootstrap.css"
			id="style-resource-1">
		<link rel="stylesheet" href="../css/select2.css" id="style-resource-2">
		<link rel="stylesheet" href="../css/jquery.selectBoxIt.css"
			id="style-resource-3">

		<script src="../js/frontendjs/gsap/main-gsap.js"
			id="script-resource-1"></script>
		<script src="../js/frontendjs/bootstrap.js" id="script-resource-2"></script>
		<script src="../js/frontendjs/joinable.js" id="script-resource-3"></script>
		<script src="../js/frontendjs/resizeable.js" id="script-resource-4"></script>
		<!-- JavaScripts initializations and stuff -->
		<script src="../js/frontendjs/neon-custom.js" id="script-resource-5"></script>

		<script src="../js/main-gsap.js" id="script-resource-6"></script>
		<script src="../js/jquery-ui-1.10.3.minimal.min.js"
			id="script-resource-7"></script>
		<script src="../js/jquery.selectBoxIt.min.js" id="script-resource-8"></script>
		<script src="../js/select2.min.js" id="script-resource-9"></script>
		<script src="../js/bootstrap-tagsinput.min.js" id="script-resource-10"></script>
		<script src="../js/typeahead.min.js" id="script-resource-11"></script>
		<script src="../js/bootstrap.js" id="script-resource-12"></script>
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