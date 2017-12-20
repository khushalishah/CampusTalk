<%@page import="vo.EventsVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Campus Talk | Events</title>
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
		ArrayList<EventsVo> list = (ArrayList) session.getAttribute("list");
		int eid = Integer.parseInt(request.getParameter("id"));
		EventsVo ev1 = null;
		for (EventsVo ev : list) {
			if (ev.getEvent_id() == eid) {
				ev1 = ev;
				break;
			}
		}
	%>
	<div class="page-container">
		<div class="main-content">
			<div class="container">
				<div class="row">
					<div class="col-md-12">

						<br> <br>
						<div class="row">
							<h1 align="center">
								&nbsp;&nbsp;<u>Edit an Event</u>
							</h1>
							<br>
							<div class="col-md-12">
								<div class="panel panel-primary" data-collapsed="0">
									<div class="panel-body">

										<form role="form"
											class="validate form-horizontal form-groups-bordered"
											method="post"
											action="<%=request.getContextPath()%>/CTServlet?type=event&operation=edit&id=<%=request.getParameter("id")%>&fid=<%=ev1.getEvent_enrollment() %>"
											enctype="multipart/form-data">
											<div class="form-group">
												<label for="field-1" class="col-sm-3 control-label">Title
													*</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" id="field-3"
														name="event_title" value="<%=ev1.getEvent_title()%>"
														data-validate="required"
														data-message-required="Please enter title of an Event">
												</div>
											</div>
											<br />
											<%
												String strDate = ev1.getEvent_startDate();
												String endDate = ev1.getEvent_endDate();
												SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
												Date strdate = sdf.parse(strDate);
												Date enddate = sdf.parse(endDate);
												sdf = new SimpleDateFormat("EEE, dd MMMM yyyy");
												String sdate = sdf.format(strdate);
												String edate = sdf.format(enddate);
											%>
											<div class="form-group">
												<label class="col-sm-3 control-label">Start Date *</label>
												<div class="col-sm-3">
													<div class="input-group">
														<input type="text" class="form-control datepicker"
															data-format="D, dd MM yyyy" name="event_startDate"
															value="<%=sdate%>" data-validate="required"
															data-message-required="Please enter start date">
														<div class="input-group-addon">
															<a href="#"><i class="entypo-calendar"></i></a>
														</div>
													</div>
												</div>
											</div>
											<br />
											<div class="form-group">
												<label class="col-sm-3 control-label">End Date *</label>
												<div class="col-sm-3">
													<div class="input-group">
														<input type="text" class="form-control datepicker"
															data-format="D, dd MM yyyy" name="event_endDate"
															value="<%=edate%> " data-validate="required"
															data-message-required="Please enter end date">
														<div class="input-group-addon">
															<a href="#"><i class="entypo-calendar"></i></a>
														</div>
													</div>
												</div>
											</div>
											<br />
											<div class="form-group">
												<label class="col-sm-3 control-label">Event time *</label>
												<div class="col-sm-2">
													<div class="input-group">
														<input type="text" class="form-control timepicker"
															name="event_time" data-template="dropdown"
															data-show-seconds="true" data-default-time="11:25 AM"
															data-show-meridian="true" data-minute-step="5"
															data-second-step="5" value="<%=ev1.getEvent_time()%> "
															data-validate="required"
															data-message-required="Please enter event time">
														<div class="input-group-addon">
															<a href="#"><i class="entypo-clock"></i></a>
														</div>
													</div>
												</div>
											</div>
											<br />
											<%
												String imagePath = ev1.getEvent_document().replace("\\", "/");
												String path[] = imagePath.split("images");
												imagePath = "../images" + path[1];
											%>
											<div class="form-group">
												<label class="col-sm-3 control-label">Event image</label>
												<div class="col-sm-2">
													<div class="fileinput fileinput-new"
														data-provides="fileinput">
														<div class="fileinput-new thumbnail"
															style="width: 200px; height: 150px;"
															data-trigger="fileinput">
													<img src="<%=request.getContextPath() %>/ImageServlet?imageID=<%=ev1.getEvent_document() %>" alt="...">
														</div>
														<div class="fileinput-preview fileinput-exists thumbnail"
															style="max-width: 200px; max-height: 150px"></div>
														<div>
															<span class="btn btn-white btn-file"> <span
																class="fileinput-new">Select image</span> <span
																class="fileinput-exists">Change</span> <input
																type="file" name="document" accept="image/*">
															</span> <a href="#" class="btn btn-orange fileinput-exists"
																data-dismiss="fileinput">Remove</a>
														</div>
													</div>
												</div>
											</div>
											<br />
											<div class="form-group">
												<label for="field-ta" class="col-sm-3 control-label">Description</label>
												<div class="col-sm-5">
													<textarea class="form-control" id="field-5"
														name="event_description"><%=ev1.getEvent_description()%></textarea>
												</div>
											</div>
											<p>
											<center>
												<div class="form-group">
													<button type="submit" class="btn btn-success"
														name="blog_submit">Update</button>
													<a
														href="<%=request.getContextPath()%>/CTServlet?type=event&operation=view&id=<%=session.getAttribute("enrollment")%>"><button
															type="button" class="btn" name="nReset">Cancel</button></a>
												</div>
											</center>
											</p>
										</form>

									</div>
								</div>
							</div>
						</div>
						
					</div>
					<link rel="stylesheet" href="../css/jquery.selectBoxIt.css"
						id="style-resource-1">

					<script src="../js/main-gsap.js" id="script-resource-1"></script>
					<script src="../js/jquery-ui-1.10.3.minimal.min.js"
						id="script-resource-2"></script>
					<script src="../js/bootstrap-datepicker.js" id="script-resource-12"></script>
					<script src="../js/bootstrap.js" id="script-resource-3"></script>
					<script src="../js/joinable.js" id="script-resource-4"></script>
					<script src="../js/resizeable.js" id="script-resource-5"></script>
					<script src="../js/neon-api.js" id="script-resource-6"></script>
					<script src="../js/cookies.min.js" id="script-resource-7"></script>
					<script src="../js/bootstrap-switch.min.js" id="script-resource-8"></script>
					<script src="../js/neon-chat.js" id="script-resource-9"></script>
					<script src="../js/jquery.selectBoxIt.min.js"
						id="script-resource-10"></script>
					<script src="../js/bootstrap-timepicker.min.js"
						id="script-resource-13"></script>
					<!-- JavaScripts initializations and stuff -->
					<script src="../js/neon-custom.js" id="script-resource-11"></script>
					<script src="../js/jquery.validate.min.js" id="script-resource-20"></script>
					<script src="../js/fileinput.js" id="script-resource-21"></script>
					<!-- Demo Settings -->
					<script src="../js/neon-demo.js" id="script-resource-12"></script>
					<script src="../js/neon-skins.js" id="script-resource-13"></script>
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