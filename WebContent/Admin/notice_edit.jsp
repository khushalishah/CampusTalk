<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.NoticeVo"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Campus Talk | Notice</title>
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
</head>
<body class="page-body" data-url="http://demo.neontheme.com">

	<%
		ArrayList<NoticeVo> ls = (ArrayList) session.getAttribute("list");
		int nid = Integer.parseInt(request.getParameter("id"));
		NoticeVo nv = null;
		for (NoticeVo nv1 : ls) {
			if (nv1.getNotice_id() == nid) {
				nv = nv1;
				break;
			}
		}
	%>
	<div class="page-container horizontal-menu">
		<div class="main-content">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<br> <br>
						<div class="row">
							<h1 align="center">
								&nbsp;&nbsp;<u>Edit Notice</u>
							</h1>
							<br>
							<div class="col-md-12">
								<div class="panel panel-primary" data-collapsed="0">
									<div class="panel-body">

										<form role="form"
											class="validate form-horizontal form-groups-bordered"
											method="post"
											action="<%=request.getContextPath()%>/CTServlet?type=notice&operation=edit&id=<%=request.getParameter("id")%>&fid=<%=nv.getNotice_fEnrollment() %>"
											enctype="multipart/form-data">
											<div class="form-group">
												<label for="field-1" class="col-sm-3 control-label">Title
													*</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" id="field-3"
														name="notice_title" value="<%=nv.getNotice_title()%>"
														data-validate="required"
														data-message-required="Please enter title">
												</div>
											</div>
											<br>
											<%
												String startDate = nv.getNotice_startDate();
												String endDate = nv.getNotice_endDate();
												SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
												Date strdate = sdf.parse(startDate);
												Date endate = sdf.parse(endDate);
												sdf = new SimpleDateFormat("EEE, dd MMMM yyyy");
												String sDate = sdf.format(strdate);
												String eDate = sdf.format(endate);
											%>
											<div class="form-group">
												<label class="col-sm-3 control-label">Start Date *</label>
												<div class="col-sm-3">
													<div class="input-group">
														<input type="text" class="form-control datepicker"
															data-format="D, dd MM yyyy" name="notice_startDate"
															value="<%=sDate%>" data-validate="required"
															data-message-required="Please enter start date">
														<div class="input-group-addon">
															<a href="#"><i class="entypo-calendar"></i></a>
														</div>
													</div>
												</div>
											</div>
											<br>
											<div class="form-group">
												<label class="col-sm-3 control-label">End Date *</label>
												<div class="col-sm-3">
													<div class="input-group">
														<input type="text" class="form-control datepicker"
															data-format="D, dd MM yyyy" name="notice_endDate"
															value="<%=eDate%>" data-validate="required"
															data-message-required="Please enter start date">
														<div class="input-group-addon">
															<a href="#"><i class="entypo-calendar"></i></a>
														</div>
													</div>
												</div>
											</div>
											<br>
											<div class="form-group">
												<label for="field-1" class="col-sm-3 control-label">Upload
													File</label>
												<div class="col-sm-5">
													<input type="file" class="form-control" id="field-file"
														placeholder="Placeholder" name="document">

												</div>
												<label for="field-1" class="col-sm-1 control-label">
													<%
														String upload = nv.getNotice_document();
														String fileArray[] = upload.split("\\\\");
														String fileName = fileArray[fileArray.length - 1];
													%> <a href="#"> <%=fileName%></a>

												</label>

											</div>
											<br>
											<div class="form-group">
												<label for="field-ta" class="col-sm-3 control-label">Description</label>
												<div class="col-sm-5">
													<textarea class="form-control" id="field-ta"
														name="notice_description"> <%=nv.getNotice_description()%></textarea>
												</div>
											</div>
											<br>
									</div>
								</div>
								<p>
								<center>
									<div class="form-group">
										<button type="submit" class="btn btn-success" name="nSubmit">Submit</button>
										<a
											href="<%=request.getContextPath()%>/CTServlet?type=notice&operation=view&id=<%=session.getAttribute("enrollment")%>"><button
												type="button" class="btn" name="nReset">Cancel</button></a>
									</div>
								</center>
								</p>
								</form>

								<script src="../js/bootstrap-datepicker.js"
									id="script-resource-12"></script>
								<script src="../js/main-gsap.js" id="script-resource-1"></script>
								<script src="../js/jquery-ui-1.10.3.minimal.min.js"
									id="script-resource-2"></script>
								<script src="../js/bootstrap.js" id="script-resource-3"></script>
								<script src="../js/joinable.js" id="script-resource-4"></script>
								<script src="../js/resizeable.js" id="script-resource-5"></script>
								<script src="../js/neon-api.js" id="script-resource-6"></script>
								<script src="../js/cookies.min.js" id="script-resource-7"></script>
								<script src="../js/bootstrap-switch.min.js"
									id="script-resource-8"></script>
								<script src="../js/neon-chat.js" id="script-resource-9"></script>
								<script src="../js/jquery.validate.min.js"
									id="script-resource-20"></script>
								<!-- JavaScripts initializations and stuff -->
								<script src="../js/neon-custom.js" id="script-resource-10"></script>
								<!-- Demo Settings -->
								<script src="../../assets/js/neon-demo.js"
									id="script-resource-11"></script>
								<script src="../../assets/js/neon-skins.js"
									id="script-resource-12"></script>
								<script type="text/javascript">
									var _gaq = _gaq || [];
									_gaq
											.push([ '_setAccount',
													'UA-28991003-7' ]);
									_gaq.push([ '_setDomainName',
											'demo.neontheme.com' ]);
									_gaq.push([ '_trackPageview' ]);
									(function() {
										var ga = document
												.createElement('script');
										ga.type = 'text/javascript';
										ga.async = true;
										ga.src = ('https:' == document.location.protocol ? 'https://ssl'
												: 'http://www')
												+ '.google-analytics.com/ga.js';
										var s = document
												.getElementsByTagName('script')[0];
										s.parentNode.insertBefore(ga, s);
									})();
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