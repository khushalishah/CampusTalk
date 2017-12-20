<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%if(session.getAttribute("enrollment") == null){
	response.sendRedirect("login.jsp");
}else{ %>
<jsp:include page="/User/masterPage.jsp"></jsp:include>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Neon Admin Panel" />
<meta name="author" content="Laborator.co" />
<title>Q-A Forum</title>

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

</head>
<body class="page-body">
<%if(session.getAttribute("enrollment") == null){
    response.sendRedirect("login.jsp");
} %>
	<div class="page-container">

		<div class="main-content">
			<section class="breadcrumb">
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<h1>Question-Answer Forum</h1>
					</div>
				</div>
			</div>
			</section>

			<div class="container">
				<br>
				<div class="input-group">
					<input type="text" class="form-control"
						placeholder="Type to search..." id="searchParameter"> <span
						class="input-group-btn">
						<button class="btn btn-info btn-icon" type="button" onclick="onSearchClick()">
							Search<i class="entypo-search"></i>
						</button>
					</span>
				</div>
				<br> <br>
				<div class="row">
					<div class="col-sm-12">
						<h1>
							<b>Post Your Question</b>
						</h1>
					</div>
					<div class="col-sm-12">
						<textarea rows="4" class="form-control" id="queTextArea"
							placeholder="Post Your Query Here..!"></textarea>
						<br>
						<div align="right">
							<button class="btn btn-info" onclick="onPostClick()">
								Post Question<i class="entypo-help-circled"></i>
							</button>
						</div>
					</div>
				</div>
				<hr>
				<br>


				<div class="row">
					<div class="col-md-12">
					<%ArrayList<Object[]> list = (ArrayList) session.getAttribute("list");
					System.out.println(list.size());
					Set<Integer> queIds= new HashSet();
						for(Object[] obj:list){
							int id = (Integer) obj[0];
							queIds.add(id);
						}
						int i=0;
						for(Object obj:queIds){
							ArrayList<Object[]> ansObj= new ArrayList();
							int queId = (Integer) obj;
							for(Object[] mainObj:list){
								
								int objQueID = (Integer) mainObj[0];
								if(queId==objQueID){
									ansObj.add(mainObj);
								}
							}
						
						%>
						<div class="panel panel-primary">
							<div class="panel-heading">
								<div class="panel-title"><strong><%=ansObj.get(0)[1] %></strong></div>
								<% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
								String strDate = (String) ansObj.get(0)[2];
								try{
								Date date = sdf.parse(strDate);
								sdf = new SimpleDateFormat("dd MMM yyyy");
								strDate = sdf.format(date);
								}catch(Exception e){
									
								} %>
								<div class="panel-options">
									<a href="#">Posted On: <%=strDate %></a>
									<a href="javascript:;" id="answer1" onclick="onClickAnswer(<%=ansObj.get(0)[0] %>,'<%=ansObj.get(0)[1]%>')"
										 style="height:25px;background: #ff9600;padding: 5px;text-align: center;border-radius: 3px;color: white;font-weight: bold;text-decoration: none !important;">Answer</a>
									<%if(ansObj.get(0)[3] != null){ %>
									<a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
									<%} else{%>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<%} %>
									
					
								</div>
							</div>
							<%for(Object[] ansBaseObject:ansObj){ 
							
								SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
								String strDate1 = (String) ansBaseObject[5];
								try{
								Date date = sdf1.parse(strDate1);
								sdf1 = new SimpleDateFormat("dd MMM yyyy");
								strDate1 = sdf1.format(date);
								}catch(Exception e){}
								
								
							%>
							<div class="panel-body" style="display: none;">
								<div class="row">
									<div class="col-md-12">
										<p>
											<strong><%=ansBaseObject[8] %></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Semester
												: <%=ansBaseObject[7] %></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Department
												: <%=ansBaseObject[6] %></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><%=strDate1 %>
												</strong>
										</p>
										<blockquote>
											<p>
												<%=ansBaseObject[4] %>
											</p>
										</blockquote>
										<hr />
										
									</div>
								</div>
								</div>
								<%} %>
							
						</div>
						<%} %>
						
					</div>
				</div>
				
			</div>
		</div>
	</div>


	<div class="modal fade" id="modal-6">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<b><strong><h4 class="modal-title">Write your answer here !</h4></strong></b>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="field-1" class="control-label">Answer</label>
								<textarea rows="5" class="form-control" id="answerTextArea" placeholder="Type Your Answer Here..!"></textarea>
							</div>
						</div>

					</div>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-info" onclick="submitAnswer()">Submit</button>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="/User/footer.jsp"></jsp:include>

	<script src="../js/frontendjs/gsap/main-gsap.js" id="script-resource-1"></script>
	<script src="../js/frontendjs/bootstrap.js" id="script-resource-2"></script>
	<script src="../js/frontendjs/joinable.js" id="script-resource-3"></script>
	<script src="../js/frontendjs/resizeable.js" id="script-resource-4"></script>
	<!-- JavaScripts initializations and stuff -->
	<script src="../js/frontendjs/neon-custom.js" id="script-resource-5"></script>


	<script src="../js/jquery-ui-1.10.3.minimal.min.js"
		id="script-resource-7"></script>
	<script src="../js/jquery.selectBoxIt.min.js" id="script-resource-8"></script>
	<script src="../js/select2.min.js" id="script-resource-9"></script>
	<script src="../js/bootstrap-tagsinput.min.js" id="script-resource-10"></script>
	<script src="../js/typeahead.min.js" id="script-resource-11"></script>

	<script src="../js/joinable.js" id="script-resource-13"></script>
	<script src="../js/resizeable.js" id="script-resource-14"></script>
	<script src="../js/neon-api.js" id="script-resource-15"></script>
	<script src="../js/cookies.min.js" id="script-resource-16"></script>


	<script src="../js/neon-custom.js" id="script-resource-17"></script>
	<script src="../js/neon-demo.js" id="script-resource-18"></script>


	<script type="text/javascript">
		var queid;
		
		function onClickAnswer(id,question){
			//alert("method called"+id);
			queid=id;	
			var que = question;
			$("h4.modal-title").text(que);
			jQuery('#modal-6').modal('show', {backdrop: 'static'});
		}
		
		function submitAnswer() {
			//alert("Answer submitted successfully..."+queid);
			var ans = document.getElementById("answerTextArea").value;
			if(ans.trim() === ""){
				document.getElementById('answerTextArea').style.border = "solid 1px red";
			}else{
				var path = "<%=request.getContextPath()%>/CTServlet?type=answer&operation=insert";
				post(path, {
					queID : queid,answer:ans
				});
			}
		}
		
		function onPostClick(){
			//alert("function called");
			
			var que = document.getElementById("queTextArea").value;
			if(que.trim() === ""){
				document.getElementById('queTextArea').style.border = "solid 1px red";
			}else{
				
				var path = "<%=request.getContextPath()%>/CTServlet?type=question&operation=insert";
				post(path, {
					que_title : que
				});

			}
			}
		
			function onSearchClick(){
				var searchParameter = document.getElementById("searchParameter").value;
				var path = "<%=request.getContextPath()%>/CTServlet?type=question&operation=view";
				post(path,{search:searchParameter});
			}
			function post(path, params) {
				var method = "post"; // Set method to post by default if not specified.

				// The rest of this code assumes you are not using a library.
				// It can be made less wordy if you use one.
				var form = document.createElement("form");
				form.setAttribute("method", method);
				form.setAttribute("action", path);

				for ( var key in params) {
					if (params.hasOwnProperty(key)) {
						var hiddenField = document.createElement("input");
						hiddenField.setAttribute("type", "hidden");
						hiddenField.setAttribute("name", key);
						hiddenField.setAttribute("value", params[key]);

						form.appendChild(hiddenField);
					}
				}

				document.body.appendChild(form);
				form.submit();
			

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
</html>
<%}%>