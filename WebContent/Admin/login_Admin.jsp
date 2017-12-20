<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Campus Talk| Login</title>
<style type=text/css>
body {
	background-image: url(../images/boxed-pattern-3.png);
	background-repeat: no-repeat;
	background-size: 100% 100%;
	text-align: center;
	z-index: 1;
}
</style>
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
<script type="text/javascript">
	function openForm() {
		//This Script is used for load pop up div to forgot password screen
		$("#dialog").css({
			"display" : "block"
		});
		$("#dialog").dialog({
			minWidth : 600,
			modal : true
		});
	}

	function sendEmail() {

		var loginId = $('#userLogin').val();
		var emailId = $('#userEmailId').val();

		if (loginId != '' && emailId != '') {

			$.ajax({
				url : "forgetPasswordController&userLogin=" + loginId
						+ "&userEmailId=" + emailId,
				async : false,
				dataType : "json",
				success : function(data) {
					$('#userLogin').val('');
					$('#userEmailId').val('');
				}
			});
			return false;
		} else {
			//Display error message
		}
	}
</script>
<script src="../js/jquery-1.11.0.min.js"></script>
<script>
	$.noConflict();
</script>
</head>
<body>

	<form method="post" role="form" id="form_log"
		action="<%=request.getContextPath()%>/LoginServlet?type=Admin"
		class="validate">
		<center>
			<img alt="" src="../images/logo.png" width="350" height="150"
				style="margin-top: 10%">
		</center>
		<br />
		<h4 id="msg"></h4>
		<div class="col-sm-3" style="margin-left: 38%">

			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">
						<i class="entypo-user"></i>
					</div>
					<input type="text" class="form-control" name="username"
						id="username" placeholder="Username" autocomplete="off"
						maxlength="12" data-validate="required"
						data-message-required="Please enter Username" />
				</div>
			</div>
			<center>
				<div class="form-group">
					<div class="input-group">
						<div class="input-group-addon">
							<i class="entypo-key"></i>
						</div>
						<input type="password" class="form-control" name="password"
							id="password" placeholder="Password" autocomplete="off"
							data-validate="required"
							data-message-required="Please enter Username" />
					</div>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-success" name="nSubmit">Login</button>
					
					
				</div>
			<!-- 	<div class="form-group">
					<a href="#" onclick="return openForm();">Forgot your Password?</a>
				</div> -->
		</div>
		</center>
	</form>
	<div id="dialog" title="Forgot Password" style="display: none;">
		<input type="text" name="userLogin" id="userLogin" class="text-box">
		<input type="text" name="userEmailId" id="userEmailId"
			class="text-box"> <input type="button" value="Send"
			class="btn" onclick="sendEmail();" />
	</div>
	<script src="../js/main-gsap.js" id="script-resource-1"></script>
	<script src="../js/jquery-ui-1.10.3.minimal.min.js"
		id="script-resource-2"></script>
	<script src="../js/bootstrap.js" id="script-resource-3"></script>
	<script src="../js/joinable.js" id="script-resource-4"></script>
	<script src="../js/resizeable.js" id="script-resource-5"></script>
	<script src="../js/neon-api.js" id="script-resource-6"></script>
	<script src="../js/cookies.min.js" id="script-resource-7"></script>
	<script src="../js/bootstrap-switch.min.js" id="script-resource-8"></script>
	<script src="../js/neon-chat.js" id="script-resource-9"></script>
	<script src="../js/neon-custom.js" id="script-resource-10"></script>
	<!-- Demo Settings -->
	<script src="../js/neon-demo.js" id="script-resource-11"></script>
	<script src="../js/neon-skins.js" id="script-resource-12"></script>
	<script src="../js/jquery.validate.min.js" id="script-resource-30"></script>
	<script src="../js/jquery.validate.min.js" id="script-resource-10"></script>
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

		if (id == "error") {
			//document.getElementById('img1').innerHTML = '<img src="../images/right.png" width="20" height="20"/>';
			document.getElementById('msg').innerHTML = "\u274C Invalid Username or Password";
			document.getElementById('msg').style.color = "#E53935";

		} else if (id == "error") {
			document.getElementById('msg').innerHTML = "Error in sending mail";

		}
	</script>
</body>
</html>