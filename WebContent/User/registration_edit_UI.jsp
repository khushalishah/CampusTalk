<%@page import="vo.RegVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%if(session.getAttribute("enrollment") == null){
	response.sendRedirect("login.jsp");
}else{ %>
<html lang="en">
<!-- Mirrored from demo.neontheme.com/forms/main/ by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 15 Sep 2015 16:23:28 GMT -->
<head>
<jsp:include page="/User/masterPage.jsp"></jsp:include>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Neon Admin Panel" />
<meta name="author" content="Laborator.co" />
<title>My Profile</title>
<link rel="stylesheet" href="../css/jquery-ui-1.10.3.custom.min.css"
	id="style-resource-1">
<link rel="stylesheet" href="../css/entypo.css" id="style-resource-2">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic"
	id="style-resource-3">
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
<!-- TS1442333969: Neon - Responsive Admin Template created by Laborator -->
</head>
<body class="page-body" data-url="http://demo.neontheme.com">

	<div class="page-container">
		<div class="main-content">

			<section class="breadcrumb" style="color: #ff00FF">
				<div class="container">
					<div class="row">
						<div class="col-sm-9">
							<h1>Edit Your Profile</h1>
						</div>
					</div>
				</div>
			</section>

			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-primary" data-collapsed="0">

						<div class="panel-body">
							<div class="form-horizontal form-groups-bordered">
								<form role="form" method="post" class="form-horizontal form-groups-bordered validate"
									action="<%=request.getContextPath()%>/CTServlet?type=registration&operation=edit" 
									enctype="multipart/form-data" id="identicalForm">

									<%ArrayList list = (ArrayList) session.getAttribute("list_studentDetails");
									RegVo regVo = (RegVo)list.get(0);
									%>

									<div class="form-group">
										<label for="field-1" class="col-sm-2 control-label">Name</label>
										<div class="col-sm-5">
											<input type="text" name="registration_name"
												data-validate="required"
												data-message-required="Please enter name."
												class="form-control" id="field-1" value=<%=regVo.getRegistration_name() %>>
										</div>
									</div>

									<%String gender = regVo.getRegistration_gender();
										if(gender.equals("Male")){%>
									<div class="form-group">
										<label for="field-4" class="col-sm-2 control-label">Gender</label>
										<div class="col-sm-5">
											<div class="radio">
												<label> <input type="radio"
													name="registration_gender" id="optionsRadios1" value="Male"
													checked="">Male
												</label>
											</div>
											<div class="radio">
												<label> <input type="radio"
													name="registration_gender" id="optionsRadios2"
													value="Female">Female
												</label>
											</div>
										</div>
									</div>
									<%}
										else{%>
										<div class="form-group">
										<label for="field-4" class="col-sm-2 control-label">Gender</label>
										<div class="col-sm-5">
											<div class="radio">
												<label> <input type="radio"
													name="registration_gender" id="optionsRadios1" value="Male"
													>Male
												</label>
											</div>
											<div class="radio">
												<label> <input type="radio"
													name="registration_gender" id="optionsRadios2"
													value="Female" checked="">Female
												</label>
											</div>
										</div>
									</div>
									<%} %>


									<div class="form-group">
										<label for="field-5" class="col-sm-2 control-label">Date
											of Birth</label>
										<div class="col-sm-3">
											<div class="input-group">
												<input type="text" class="form-control datepicker"
													data-format="D, dd MM yyyy" name="registration_date" value="<%=regVo.getRegistration_date() %>">
												<div class="input-group-addon">
													<a href="#"><i class="entypo-calendar"></i></a>
												</div>
											</div>
										</div>
									</div>
									<%
									String imagePath= "";
									if(!regVo.getRegistration_profilePic().equals("")){
									imagePath = regVo.getRegistration_profilePic().replace("\\", "/");
									String path[] = imagePath.split("images");
									imagePath = "../images"+path[1];} %>

									 <div class="form-group">
										<label class="col-sm-2 control-label">Profile Pic</label>
										<div class="col-sm-5">
											<div class="fileinput fileinput-new"
												data-provides="fileinput">
												<div class="fileinput-new thumbnail"
													style="width: 200px; height: 150px;"
													data-trigger="fileinput">
													<img src="<%=request.getContextPath() %>/ImageServlet?imageID=<%=regVo.getRegistration_profilePic() %>" alt="...">
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

									 <!-- <div class="form-group">
									<label class="col-sm-2 control-label">Photo Upload</label>
									<div class="col-sm-5">
										<input type="file" class="form-control"
											 name="document"/>
									</div> 
								</div> -->
									<div class="form-group">
										<label class="col-sm-2 control-label">Email</label>
										<div class="col-sm-5">
											<div class="input-group minimal">
												<span class="input-group-addon"><i
													class="entypo-mail"></i></span> <input type="email"
													class="form-control" data-validate="required"
													data-message-required="Please enter email address."
													name="registration_email" id="reg_email" value="<%=regVo.getRegistration_email()%>">
											</div>
										</div>
									</div>


									<div class="form-group">
										<label class="col-sm-2 control-label">Phone</label>
										<div class="col-sm-5">
											<input type="text" class="form-control"
												maxlength="10" name="registration_phone" value="<%=regVo.getRegistration_phone()%>">
										</div>
									</div>


									<div class="form-group">
										<label class="col-sm-2 control-label">Alternate Phone</label>
										<div class="col-sm-5">
											<input type="text" class="form-control"
												maxlength="10" name="registration_alternatePhone" value="<%=regVo.getRegistration_alternatePhone()%>">
										</div>
									</div>
									
									
									<div class="form-group">
										<label for="field-2" class="col-sm-2 control-label">Enrollment</label>
										<div class="col-sm-5">
											<input type="text" class="form-control" id="field-3"
												data-validate="required,number"
												data-message-required="Please enter enrollment number."
												maxlength="12" name="registration_enrollment" value="<%=regVo.getRegistration_enrollment() %>" readonly>
										</div>
									</div>


									<div class="form-group">
										<label class="col-sm-2 control-label">User Name</label>
										<div class="col-sm-5">
											<div class="input-group minimal">
												<input type="text" class="form-control"
													data-validate="required"
													data-message-required="Please enter username."
													name="registration_uname" value="<%=regVo.getRegistration_uname() %>" readonly> <span
													class="input-group-addon"><i class="entypo-user"></i></span>
											</div>
										</div>
									</div>


									<div class="form-group">
										<label for="field-3" class="col-sm-2 control-label">Password</label>
										<div class="col-sm-5">
											<input type="password" class="form-control"
												data-validate="required"
												data-message-required="Please enter password."
												name="registration_password" id="password" onblur="checkPassword()" value="<%=regVo.getRegistration_password()%>">
										</div>
									</div>


									<div class="form-group">
										<label for="field-3" class="col-sm-2 control-label">Confirm
											Password</label>
										<div class="col-sm-5">
											<input type="password" class="form-control"
												data-validate="required"
												data-message-required="Please enter password."
												name="registration_cPassword" id="cpassword"
												onblur="checkPassword()" value="<%=regVo.getRegistration_password()%>">
										</div>
										<h6 id="message"></h6>
									</div>

								
									<div class="form-group">
										<label class="col-sm-2 control-label">Department</label>
										<div class="col-sm-5">
											<select class="form-control" name="registration_department" id="department">
												<option>Mechanical</option>
												<option>Electrical</option>
												<option>Civil</option>
												<option>Computer</option>
												<option>IT</option>
												<option>E&C</option>
												<option>I&C</option>
												<option>Environment</option>
												<option>Textile</option>
												<option>Plastic</option>
												<option>Rubber</option>
												<option>Chemical</option>
												<option>Bio Medical</option>
												<option>Applied Mechanics</option>
												<option>General</option>
											</select>
										</div>
									</div>


									<div class="form-group">
										<label class="col-sm-2 control-label">Semester</label>
										<div class="col-sm-5">
											<select class="form-control" name="registration_semester" id="semester" value="<%=regVo.getRegistration_semester()%>">
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
												<option>6</option>
												<option>7</option>
												<option>8</option>
											</select>
										</div>
									</div>


									<div class="form-group">
										<label for="field-2" class="col-sm-2 control-label">Passing
											Year</label>
										<div class="col-sm-5">
											<input type="text" class="form-control" id="field-4"
												data-validate="number,required"
												data-message-required="Please enter passing year."
												maxlength="4" name="registration_passingyear"
												value="<%=regVo.getRegistration_passingyear()%>">
										</div>
									</div>


									<div class="form-group">
										<label for="field-ta" class="col-sm-2 control-label">Training
											Details</label>
										<div class="col-sm-5">
											<textarea class="form-control autogrow" id="field-ta"
												style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 48px;"
												name="registration_tdetails"><%=regVo.getRegistration_tdetails() %></textarea>
										</div>
									</div>


									<div class="form-group">
										<label for="field-ta" class="col-sm-2 control-label">Project
											Details</label>
										<div class="col-sm-5">
											<textarea class="form-control autogrow" id="field-ta"
												style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 48px;"
												name="registration_pdetails"><%=regVo.getRegistration_pdetails() %></textarea>
										</div>
									</div>


									<div class="form-group">
										<label for="field-ta" class="col-sm-2 control-label">Other
											Details</label>
										<div class="col-sm-5">
											<textarea class="form-control autogrow" id="field-ta"
												style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 48px;"
												name="registration_odetails"><%=regVo.getRegistration_odetails() %></textarea>
										</div>
									</div>
									<p>
									<center>
										<div class="form-group">
											<button type="submit" class="btn btn-success"
												name="registration_submit">Update</button>
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
					<jsp:include page="/User/footer.jsp"></jsp:include>
				</div>
			
				</div>
			
				
				
				
			

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
				<!-- JavaScripts initializations and stuff -->
				<script src="../js/neon-custom.js" id="script-resource-10"></script>
				<!-- Demo Settings -->
				<script src="../js/neon-demo.js" id="script-resource-11"></script>
				<script src="../js/neon-skins.js" id="script-resource-12"></script>
				<script src="../js/fileinput.js" id="script-resource-13"></script>
				<script src="../js/jquery.validate.min.js" id="script-resource-14"></script>
				<script src="../js/dept&semSelection.js"></script>
				
				<script type="text/javascript">
					var department = "<%=regVo.getRegistration_department()%>";
					var semester = "<%=regVo.getRegistration_semester()%>";
					setDept(department);
					setSemester(semester);
				</script>
				
				<script type="text/javascript">
					function checkPassword() {
						var password = document.getElementById('password').value;
						var confirmPassword = document
								.getElementById('cpassword').value;
						if (confirmPassword !== password) {
							document.getElementById('cpassword').value = "";
							document.getElementById('message').style.color = "red";
							document.getElementById('message').innerHTML = "Not match";
						} else {
							document.getElementById('message').style.color = "green";
							document.getElementById('message').innerHTML = "Match";
						}
					}
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