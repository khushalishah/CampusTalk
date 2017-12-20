<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	
	
</script>
<script src="../js/jquery-1.11.0.min.js"></script>
<script>
	$.noConflict();
</script>

</head>

<body> 

				
				<form method="post" role="form" id="form_log"
					action="<%=request.getContextPath()%>/MailServlet">
					
					<div align="center" style="margin-top: 2%">
					<h2 id="msg" style="margin-top:10%"></h2>
					</div>
					<center>
					<img alt="" src="../images/ctlogo copy.png" width="350" height="150" style="margin-top:10%"></center>	
					<br/><br/><br/>
					<div class="col-sm-3" style="margin-left:38%">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="entypo-user"></i>
								</div>
								
								<input type="text" class="form-control" name="uname"
									id="username" placeholder="Username" autocomplete="off" maxlength="12" />
							
							</div>
								<label	id="invalid"></label>
						</div>
						<br>
						<center>
						<div class="form-group">
							<button type="submit" class="btn btn-success" name="nSubmit" onclick="document.getElementById('btn1').style.display = 'block'; this.style.display = 'none';">Submit</button>
						<label id="btnHolder"></label>
						</div>			
						</div>
					
		            </center>
				</form>
			<div id="dialog" title="Forgot Password" style="display: none;">
    <input type="text" name="userLogin" id="userLogin" class="text-box">
    <input type="text" name="userEmailId" id="userEmailId"
                class="text-box">
    <input type="button" value="Send" class="btn"
        onclick="sendEmail();" />
</div>
</div>	
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
		
	if(id=="success"){
		//document.getElementById('img1').innerHTML = '<img src="../images/right.png" width="20" height="20"/>';
		document.getElementById('msg').innerHTML = "&#10004 Mail has been sent successfully";
		document.getElementById('msg').style.color = "#4CAF50";
		 document.getElementById('btnHolder').innerHTML = '<a href="login.jsp"><input type="button" class="btn btn-success" value="Login" /></a>';
		//document.getElementById('btn1').setvisible = "true";
	}
	else if(id=="invalid")
		{
		document.getElementById('invalid').innerHTML = "\u274C Invalid Username";
		document.getElementById('invalid').style.color = "#E53935";
		}
	else if(id=="error")
	{
	document.getElementById('msg').innerHTML = "\u274C Error in sending mail";
	document.getElementById('msg').style.color = "#E53935";
	}
		</script>
</body>
</html>