<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date" %>
<%@page import="javax.print.attribute.standard.Sides"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.EventsVo"%>
<!DOCTYPE html>
<%if(session.getAttribute("enrollment") == null){
	response.sendRedirect("login.jsp");
}else{ %>
<html lang="en">

<!-- Mirrored from demo.neontheme.com/extra/timeline/ by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 15 Sep 2015 16:27:34 GMT -->
<head>
<jsp:include page="/User/masterPage.jsp"></jsp:include>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Neon Admin Panel" />
<meta name="author" content="Laborator.co" />
<title>Neon | Timeline</title>
<style>

</style>
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
</head>
<body class="page-body" data-url="http://demo.neontheme.com">
	<!-- TS14423340351198: Xenon - Boostrap Admin Template created by Laborator / Please buy this theme and support the updates -->
	<div class="page-container">
		<!-- TS144233403511292: Xenon - Boostrap Admin Template created by Laborator / Please buy this theme and support the updates -->
		<div class="main-content">
				<!-- Raw Links -->
			 <section class="breadcrumb">
		<div class="container">
			<div class="row">
				<div class="col-sm-9">
					<h1>Events</h1>
				</div>
			</div>
		</div>
		</section>
		<script type="text/javascript">
			// Setup Gallery Lightbox
			jQuery(document).ready(function($) {
				$(".cbp_tmtime .image").nivoLightbox();
			});
		</script>
			<br>
			<%ArrayList<EventsVo> ls=(ArrayList)session.getAttribute("list"); 
			System.out.println("size of main"+ls.size());
			%>
			
			<ul class="cbp_tmtimeline">
				<li><time class="cbp_tmtime" datetime="2015-09-15T18:30">
					</time>
					<div class="cbp_tmicon">
						<i class="entypo-user"></i>
					</div>
					<div class="cbp_tmlabel empty">
					</div></li>
				<%	for(int i=0;i<ls.size();i++){
				ArrayList<EventsVo> ls1 = new ArrayList();
				try{
				
				ls1.add(ls.get(i));	
				ls1.add(ls.get(++i));
				ls1.add(ls.get(++i));
				}catch(Exception e){}
				System.out.println(ls1.size());
			%>
				<li><time class="cbp_tmtime" datetime="2015-09-15T03:45">
						<span><%=ls1.get(0).getEvent_time() %></span>
						<%SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
						Date strdate=sdf.parse(ls1.get(0).getEvent_startDate());
						Date endate=sdf.parse(ls1.get(0).getEvent_endDate());
												
						sdf=new SimpleDateFormat("dd-MM-yyyy");
						String strtDate=sdf.format(strdate);
						String endDate=sdf.format(endate);
						
						%> <span><%=strtDate %><br> to<br> <%=endDate %></span>
					</time>
					<div class="cbp_tmicon bg-success">
						<i class="entypo-doc-text"></i>
					</div>
					<div class="cbp_tmlabel">
					  
						<h2>
						 <span style="color:#263238"><strong><%=ls1.get(0).getEvent_title() %></strong></span>
						</h2>
						<p><%=ls1.get(0).getEvent_description() %></p>
						<hr>
						<div class="row" >
			              <%	String imagePath="";
			              		if(!ls1.get(0).getEvent_document().equals("")){
			              		imagePath = ls1.get(0).getEvent_document().replace("\\", "/");
								String path[] = imagePath.split("images");
								imagePath = "../images"+path[1];}%>
							<div class="col-xs-5">
								<a href="<%=imagePath %>"
								data-lightbox-gallery="gallery1" class="image"
								title="San Francisco"> <img
									src="<%=request.getContextPath()%>/ImageServlet?imageID=<%=ls1.get(0).getEvent_document() %>" alt="..." 
									class="img-responsive img-rounded full-width" 
									onError="this.onerror=null;this.src='../images/blogdefault1.png';this.style.heigh='40';this.style.width='40';"/>
								</a>
							</div>
						</div>
						</div>
					</li>
					<%if(ls1.size()>1){ %>
				<li><time class="cbp_tmtime" datetime="2015-09-14T13:22">
						<span><%=ls1.get(1).getEvent_time() %></span>
						<%SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
						Date strdate1=sdf1.parse(ls1.get(1).getEvent_startDate());
						Date endate1=sdf1.parse(ls1.get(1).getEvent_endDate());
						sdf1=new SimpleDateFormat("dd-MM-yyyy");
						String strtDate1=sdf1.format(strdate1);
						String endDate1=sdf1.format(endate1);
						%> <span><%=strtDate1 %><br>to<br> <%=endDate1 %></span>
						 
					</time>
					<div class="cbp_tmicon bg-secondary">
						<i class="entypo-doc-text"></i>
					</div>
					<div class="cbp_tmlabel">
						<h2>
						  <span style="color:#263238"><strong><%=ls1.get(1).getEvent_title() %></strong></span>
						</h2>
						<p>
						 <%=ls1.get(1).getEvent_description() %>
						</p>
						<hr>
						<div class="row">
							<%	String imagePath1="";
								if(!ls1.get(1).getEvent_document().equals("")){
							    imagePath1 = ls1.get(1).getEvent_document().replace("\\", "/");
								String path1[] = imagePath1.split("images");
								imagePath1 = "../images"+path1[1];} 
							%>
							<div class="col-xs-5 ">
								<a href="#"> <img
									src="<%=request.getContextPath()%>/ImageServlet?imageID=<%=ls1.get(1).getEvent_document() %>" alt="..." 
									class="img-responsive img-rounded full-width" 
									onError="this.onerror=null;this.src='../images/blogdefault1.png';this.style.heigh='40';this.style.width='40';"/>
									</a>
							</div>
						</div>
					</div>
					
					</li>
				<%if(ls1.size()>2){ %>
				<li><time class="cbp_tmtime " >
						<span><%=ls1.get(2).getEvent_time() %></span> 
						<%SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
						Date strdate2=sdf2.parse(ls1.get(2).getEvent_startDate());
						Date endate2=sdf2.parse(ls1.get(2).getEvent_endDate());
						sdf2=new SimpleDateFormat("dd-MM-yyyy");
						String strtDate2=sdf2.format(strdate2);
						String endDate2=sdf2.format(endate2);
						%> <span><%=strtDate2 %><br> to<br> <%=endDate2 %></span>
					
						
					</time>
					<div class="cbp_tmicon bg-warning">
					<i class="entypo-doc-text"></i>
					</div>
					<div class="cbp_tmlabel">
						<h2>
							 <span style="color:#263238"><strong><%=ls1.get(2).getEvent_title() %></strong></span> 
						</h2>
						
						<p><%=ls1.get(2).getEvent_description()%></p>
						<hr>
                      <div class="row">
							<%  String imagePath2="";
								if(!ls1.get(2).getEvent_document().equals("")){
								imagePath2 = ls1.get(2).getEvent_document().replace("\\", "/");
								String path2[] = imagePath2.split("images");
								imagePath2= "../images"+path2[1];} %>
							<div class="col-xs-5">
								<a href="#"> <img
									src="<%=request.getContextPath()%>/ImageServlet?imageID=<%=ls1.get(2).getEvent_document() %>" alt="..." 
									class="img-responsive img-rounded full-width" 
									onError="this.onerror=null;this.src='../images/blogdefault1.png';this.style.heigh='40';this.style.width='40';"/>
								</a>
							</div>
						</div>
					</div></li>
					<%} %>
					<%} %>
					<%} %>
			</ul>
			<jsp:include page="/User/footer.jsp"></jsp:include>
			</div>
			
					
			
			<script type="text/javascript"
				src="http://maps.google.com/maps/api/js?sensor=false"></script>
			<script type="text/javascript">
				function initialize() {
					var $ = jQuery, map_canvas = $("#sample-checkin");
					var location = new google.maps.LatLng(36.738888,
							-119.783013), map = new google.maps.Map(
							map_canvas[0], {
								center : location,
								zoom : 14,
								mapTypeId : google.maps.MapTypeId.ROADMAP,
								scrollwheel : false
							});
					var marker = new google.maps.Marker({
						position : location,
						map : map
					});
				}
				google.maps.event.addDomListener(window, 'load', initialize);
			</script>
		</div>
		<script type="text/javascript"
			src="http://maps.google.com/maps/api/js?sensor=false"></script>
		<script type="text/javascript">
			function initialize() {
				var $ = jQuery, map_canvas = $("#sample-checkin");
				var location = new google.maps.LatLng(36.738888, -119.783013), map = new google.maps.Map(
						map_canvas[0], {
							center : location,
							zoom : 14,
							mapTypeId : google.maps.MapTypeId.ROADMAP,
							scrollwheel : false
						});
				var marker = new google.maps.Marker({
					position : location,
					map : map
				});
			}
			google.maps.event.addDomListener(window, 'load', initialize);
		</script>
	<!-- Imported styles on this page -->
	<link rel="stylesheet" href="../css/component.css"
		id="style-resource-1">
	<script src="../js/gsap/main-gsap.js" id="script-resource-1"></script>
	<script src="../js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"
		id="script-resource-2"></script>
	<script src="../js/bootstrap.js" id="script-resource-3"></script>
	<script src="../js/joinable.js" id="script-resource-4"></script>
	<script src="../js/resizeable.js" id="script-resource-5"></script>
	<script src="../js/neon-api.js" id="script-resource-6"></script>
	<script src="../js/cookies.min.js" id="script-resource-7"></script>
	<script src="../neon-chat.js" id="script-resource-8"></script>
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
<!-- Mirrored from demo.neontheme.com/extra/timeline/ by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 15 Sep 2015 16:27:35 GMT -->
</html>
<%}%>