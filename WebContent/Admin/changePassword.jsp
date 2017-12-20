<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Campus Talk| Login</title>

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
		action="<%=request.getContextPath()%>/ChangePwdServlet?id=<%=session.getAttribute("enrollment")%>"
		class="validate">
		<center>
			<img alt="" src="../images/logo.png" width="350" height="150"
				style="margin-top: 10%">
		</center>
		<br />
		<h4 id="msg" align="center"></h4>
		<div class="col-sm-3" style="margin-left: 38%">

			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">
						<i class="entypo-key"></i>
					</div>
					<input type="password" class="form-control" name="opwd"
						id="password" placeholder="Old Password" autocomplete="off"
						data-validate="required"
						data-message-required="Please enter old password" />
				</div>
			</div>

			<center>
				<div class="form-group">

					<div class="input-group">
						<div class="input-group-addon">
							<i class="entypo-key"></i>
						</div>
						<input type="password" class="form-control" name="npwd"
							id="npassword" placeholder="New Password" autocomplete="off"
							data-validate="required"
							data-message-required="Please enter new password"
							onchange="checkPassword()" />
					</div>
					<h6 id="message"></h6>
				</div>
				<div class="form-group">

					<div class="input-group">
						<div class="input-group-addon">
							<i class="entypo-key"></i>
						</div>
						<input type="password" class="form-control" name="cpwd"
							id="cpassword" placeholder="Confirm Password" autocomplete="off"
							data-validate="required"
							data-message-required="Please confirm your new password"
							onchange="checkPassword()" />
					</div>

				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-success" name="nSubmit">Change
						Password</button>
					<label id="btnHolder"></label>
				</div>
				
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
		function checkPassword() {
			var password = document.getElementById('npassword').value;
			var confirmPassword = document.getElementById('cpassword').value;
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
			document.getElementById('msg').innerHTML = "\u274C Invalid Password";
			document.getElementById('msg').style.color = "#E53935";

		} else if (id == "success") {
			//document.getElementById('img1').innerHTML = '<img src="../images/right.png" width="20" height="20"/>';
			document.getElementById('msg').innerHTML = "&#10004 Password has been changed successfully.Now Login again";
			document.getElementById('msg').style.color = "#4CAF50";
			document.getElementById('btnHolder').innerHTML = '<a href="login_Admin.jsp"><input type="button" class="btn btn-success" value="Login" /></a>';
			//document.getElementById('btn1').setvisible = "true";
		}
	</script>
</body>
</html>