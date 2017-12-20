<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<title>Feedback Form</title>
<link rel="stylesheet" href="../css/entypo.css" id="style-resource-2">
<link rel="stylesheet" href="../css/frontendcss/neon.css"
	id="style-resource-3">
<link rel="stylesheet"
	href="../css/jquery-ui-1.10.3.custom.min.css"
	id="style-resource-4">
<link rel="stylesheet"
	href="../css/entypo.css"
	id="style-resource-5">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic"
	id="style-resource-6">
 
<link rel="stylesheet" href="../css/neon-core.css"
	id="style-resource-8">
 <link rel="stylesheet" href="../css/neon-theme.css"
	id="style-resource-9"> 
 <link rel="stylesheet" href="../css/neon-forms.css"
	id="style-resource-10"> 
<link rel="stylesheet" href="../css/custom.css"
	id="style-resource-11">

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
					<h1>Feedback Form</h1>
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
						<div class="form-horizontal form-groups-bordered">
							<form role="form" class="validate" action="<%=request.getContextPath()%>/CTServlet?type=feedback&operation=insert" method="post">
								<div class="form-group">
									<label class="col-sm-3 control-label">Department*</label>
									<div class="col-sm-5">
										<select class="form-control" name="fDepartment">
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
									<label class="col-sm-3 control-label">Semester*</label>
									<div class="col-sm-5">
										<select class="form-control" name="fSemester">
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
									<label for="field-1" class="col-sm-3 control-label">Division*</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" id="field-1" name="fDivision" data-validate="required" data-message-required="Please enter Division">
									</div>
								</div>
								<div class="form-group">
									<label for="field-2" class="col-sm-3 control-label">Name
										of Teacher*</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" id="field-2" name="fNameOfTeacher" data-validate="required" data-message-required="Please enter name of the teacher">
									</div>
								</div>
								<div class="form-group">
									<label for="field-3" class="col-sm-3 control-label">Course
										Code*</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" id="field-3" name="fCourseCode" data-validate="required" data-message-required="Please enter course code">
									</div>
								</div>
								<div class="form-group">
									<label for="field-3" class="col-sm-3 control-label">Course
										Title*</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" id="field-4" name="fCourseTitle" data-validate="required" data-message-required="Please enter course title">
									</div>
								</div>
								<label for="field-3" class="control-label"><b>(1 - strongly disagree, 2 - disagree, 3 - neither agree nor disagree, 4 - agree, 5 - strongly agree)</b> </label>
								
								<div class="form-group">
								<br/>
									<label class="col-sm-3 control-label">1.The teacher
										completes the entire syllabus in time.</label>
									<div class="col-sm-2">
										<select class="form-control" name="que1">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">2.The teacher
										discusses topics and interacts in the class.</label>
									<div class="col-sm-2">
										<select class="form-control" name="que2">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">3.The teacher
										communicates clearly and inspires me by his teaching.</label>
									<div class="col-sm-2">
										<select class="form-control" name="que3">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">4.The teacher is
										punctual in the class.</label>
									<div class="col-sm-2">
										<select class="form-control" name="que4">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">5.The teacher
										comes well prepared for the class.</label>
									<div class="col-sm-2">
										<select class="form-control" name="que5">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">6.The teacher
										encourages participation and discussion in the class.</label>
									<div class="col-sm-2">
										<select class="form-control" name="que6">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">7.The teacher
										uses modern teaching aids,handouts,suitable
										references,PPTs,web-resources etc.</label>
									<div class="col-sm-2">
										<select class="form-control" name="que7">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">8.The teacher's
										attitude towards the students is friendly and helpful.</label>
									<div class="col-sm-2">
										<select class="form-control" name="que8">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">9.The teacher is
										available and accessible in the department.</label>
									<div class="col-sm-2">
										<select class="form-control" name="que9">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">10.The evaluation
										process is fair and unbiased.</label>
									<div class="col-sm-2">
										<select class="form-control" name="que10">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">11.Regular and
										timely feedback is given on our performance.</label>
									<div class="col-sm-2">
										<select class="form-control" name="que11">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">12.Periodical
										assessments are conducted as per schedule.</label>
									<div class="col-sm-2">
										<select class="form-control" name="que12">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">13.I have learn
										and understood the subject material/s in this course.</label>
									<div class="col-sm-2">
										<select class="form-control" name="que13">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
								</div>

								<div class="form-group">
								<label for="field-ta" class="col-sm-3 control-label">Comments</label>
								<div class="col-sm-5">
									<textarea class="form-control" id="field-ta" name="fComment"></textarea>
								</div>
								</div>
								</div>
								</div>
								<p>
							<center>
						<div class="form-group">
							<button type="submit" class="btn btn-success">Submit</button>
							<button type="reset" class="btn">Reset</button>
						</div>
					</center>
					</p>
					</form>
					</div>
				</div>
			</div>
		</div>
		</section>
		<jsp:include page="/User/footer.jsp"></jsp:include>
</div>

<link rel="stylesheet"
		href="../css/select2-bootstrap.css"
		id="style-resource-1">
	<link rel="stylesheet" href="../css/select2.css"
		id="style-resource-2">
	<link rel="stylesheet"
		href="../css/jquery.selectBoxIt.css"
		id="style-resource-3">

	<script src="../js/frontendjs/gsap/main-gsap.js" id="script-resource-1"></script>
	<script src="../js/frontendjs/bootstrap.js" id="script-resource-2"></script>
	<script src="../js/frontendjs/joinable.js" id="script-resource-3"></script>
	<script src="../js/frontendjs/resizeable.js" id="script-resource-4"></script>
	<!-- JavaScripts initializations and stuff -->
	<script src="../js/frontendjs/neon-custom.js" id="script-resource-5"></script>
	
	<script src="../js/main-gsap.js" id="script-resource-6"></script>
	<script
		src="../js/jquery-ui-1.10.3.minimal.min.js"
		id="script-resource-7"></script>
		<script src="../js/jquery.selectBoxIt.min.js"
		id="script-resource-8"></script>
			<script src="../js/select2.min.js"
		id="script-resource-9"></script>
	<script src="../js/bootstrap-tagsinput.min.js"
		id="script-resource-10"></script>
	<script src="../js/typeahead.min.js" id="script-resource-11"></script>
	<script src="../js/bootstrap.js" id="script-resource-12"></script>
	<script src="../js/joinable.js" id="script-resource-13"></script>
	<script src="../js/resizeable.js" id="script-resource-14"></script>
	<script src="../js/neon-api.js" id="script-resource-15"></script>
	<script src="../js/cookies.min.js" id="script-resource-16"></script>
	<script src="../js/neon-custom.js" id="script-resource-17"></script>
	<script src="../js/neon-demo.js" id="script-resource-18"></script>
	<script src="../js/toastr.js" id="script-resource-20"></script>
	<script src="../js/jquery.validate.min.js" id="script-resource-21"></script>

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
		  for (var i=0;i<vars.length;i++) {
		    var pair = vars[i].split("=");
		    if (pair[0] == variable) {
		      return pair[1];
		    }
		  } 
		  
		}
		
	if(id==="success"){
	var opts = {
		"closeButton": true,
		"debug": false,
		"positionClass": "toast-top-right",
		"onclick": null,
		"showDuration": "300",
		"hideDuration": "1000",
		"timeOut": "5000",
		"extendedTimeOut": "1000",
		"showEasing": "swing",
		"hideEasing": "linear",
		"showMethod": "fadeIn",
		"hideMethod": "fadeOut"
		};
		
		toastr.success("", "Feedback submitted successfully.", opts);
	}
	
</script>
</body>
</html>
<%}%>