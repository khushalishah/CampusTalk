<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Campus Talk | Notice</title>
</head>
<body class="page-body" data-url="http://demo.neontheme.com">
	<div class="page-container horizontal-menu">
		<jsp:include page="/Admin/masterPage_admin.jsp"></jsp:include>
		<div class="main-content">
			<div class="container">
				<div class="row">
					<div class="col-md-12">

						<br> <br>
						<div class="row">
							<h1 align="center">
								&nbsp;&nbsp;<u>Add Notice</u>
							</h1>
							<br>
							<div class="col-md-12">
								<div class="panel panel-primary" data-collapsed="0">
									<div class="panel-body">
										<form role="form"
											class="validate form-horizontal form-groups-bordered "
											method="post"
											action="<%=request.getContextPath()%>/CTServlet?type=notice&operation=insert"
											enctype="multipart/form-data">
											<div class="form-group">
												<label class="col-sm-3 control-label">Semester *</label>
												<div class="col-sm-2">
													<select class="form-control" name="notice_semester">
														<option>1</option>
														<option>2</option>
														<option>3</option>
														<option>4</option>
														<option>5</option>
														<option>6</option>
														<option>7</option>
														<option>8</option>
														<option>All</option>
													</select>
												</div>
											</div>


											<div class="form-group">
												<label for="field-1" class="col-sm-3 control-label">Title
													*</label>
												<div class="col-sm-5">
													<input type="text" class="form-control" id="field-3"
														name="notice_title" data-validate="required"
														data-message-required="Please enter title of Notice">
												</div>
											</div>
											<br />
											<div class="form-group">
												<label class="col-sm-3 control-label">Start Date *</label>
												<div class="col-sm-3">
													<div class="input-group">
														<input type="text" class="form-control datepicker"
															data-format="D, dd MM yyyy" name="notice_startDate"
															data-validate="required"
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
															data-format="D, dd MM yyyy" name="notice_endDate"
															data-validate="required"
															data-message-required="Please enter end date">
														<div class="input-group-addon">
															<a href="#"><i class="entypo-calendar"></i></a>
														</div>
													</div>
												</div>
											</div>
											<br />
											<div class="form-group">
												<label for="field-1" class="col-sm-3 control-label">Upload
													File</label>
												<div class="col-sm-5">
													<input type="file" class="form-control" id="field-file"
														placeholder="Placeholder" name="document">
												</div>
											</div>
											<br />
											<div class="form-group">
												<label for="field-ta" class="col-sm-3 control-label">Description</label>
												<div class="col-sm-5">
													<textarea class="form-control" id="field-ta"
														name="notice_description"></textarea>
												</div>
											</div>
											<br />
									</div>
								</div>
								<p>
								<center>
									<div class="form-group">
										<button type="submit" class="btn btn-success" name="nSubmit">Submit</button>
										<button type="reset" class="btn" name="nReset">Reset</button>
									</div>
								</center>
								</p>
								</form>
							</div>
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
							<!-- JavaScripts initializations and stuff -->
							<script src="../js/neon-custom.js" id="script-resource-10"></script>
							<!-- Demo Settings -->
							<script src="../../assets/js/neon-demo.js"
								id="script-resource-11"></script>
							<script src="../../assets/js/neon-skins.js"
								id="script-resource-12"></script>
							<script src="../js/jquery.validate.min.js"
								id="script-resource-20"></script>

							<script type="text/javascript">
								var _gaq = _gaq || [];
								_gaq.push([ '_setAccount', 'UA-28991003-7' ]);
								_gaq.push([ '_setDomainName',
										'demo.neontheme.com' ]);
								_gaq.push([ '_trackPageview' ]);
								(function() {
									var ga = document.createElement('script');
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
			<script src="../js/toastr.js" id="script-resource-13"></script>
			<script src="../js/jquery.validate.min.js" id="script-resource-20"></script>

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
			<script type="text/javascript">
				var id = getQueryVariable("msg");

				function getQueryVariable(variable) {
					var query = window.location.search.substring(1);
					var vars = query.split("&");
					for (var i = 0; i < vars.length; i++) {
						var pair = vars[i].split("=");
						if (pair[0] == variable) {
							return pair[1];
						}
					}

				}

				if (id === "success") {
					var opts = {
						"closeButton" : true,
						"debug" : false,
						"positionClass" : "toast-top-right",
						"onclick" : null,
						"showDuration" : "300",
						"hideDuration" : "1000",
						"timeOut" : "5000",
						"extendedTimeOut" : "1000",
						"showEasing" : "swing",
						"hideEasing" : "linear",
						"showMethod" : "fadeIn",
						"hideMethod" : "fadeOut"
					};

					toastr
							.success("Notice is successfully submitted..!!",
									opts);
				}
			</script>
</body>
</html>