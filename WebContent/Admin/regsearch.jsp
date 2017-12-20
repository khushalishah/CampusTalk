<%@page import="dao.RegDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.RegVo"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Campus Talk | Registration</title>
</head>
<body class="page-body" data-url="http://demo.neontheme.com">
	<div class="page-container horizontal-menu">
		<jsp:include page="/Admin/masterPage_superadmin.jsp"></jsp:include>
		<div class="main-content">
			<div class="container">
				<div class="row">
					<div class="row draggable-portlets">
						<h1 align="center">
							&nbsp;&nbsp;<u>Registration details</u>
						</h1>
						<br>
						<table class="table table-bordered datatable" id="table-1">
							<thead>
								<tr>
									<th>EnrollmentID</th>
									<th>Name</th>
									<th>Department</th>
									<th>Semester</th>
									<th>Action</th>

								</tr>
							</thead>
							<tbody>
								<%
									ArrayList<RegVo> ls = (ArrayList) session.getAttribute("list_studentDetails");

									for (RegVo rv : ls) {
								%>
								<tr class="odd gradeX">
									<td><%=rv.getRegistration_enrollment()%></td>
									<td><%=rv.getRegistration_name()%></td>
									<td><%=rv.getRegistration_department()%></td>
									<td><%=rv.getRegistration_semester()%></td>
									<td><a
										href="<%=request.getContextPath()%>/CTServlet?type=registration&operation=delete&id=<%=rv.getRegistration_enrollment()%>"
										class="btn btn-danger btn-sm btn-icon icon-left"> <i
											class="entypo-cancel"></i> Delete
									</a>

										<button class="btn btn-info btn-sm btn-icon icon-left"
											data-toggle="popover" data-trigger="click"
											data-placement="left" data-html="true"
											data-content="<table>
												<tr><td>Name : <td><%=rv.getRegistration_name()%></tr>
												<tr><td>Department : <td><%=rv.getRegistration_department()%></tr>
												<tr><td>Semester : <td><%=rv.getRegistration_semester()%></tr>
												<tr><td>Enrollment : <td><%=rv.getRegistration_enrollment()%></tr>
												<tr><td>Passing Year : <td><%=rv.getRegistration_passingyear()%></tr>
												<tr><td>Gender : <td><%=rv.getRegistration_gender()%></tr>
												<tr><td>Date of Birth : <td><%=rv.getRegistration_date()%></tr>
												<tr><td>Email ID : <td><%=rv.getRegistration_email()%></tr>
												<tr><td>Phone No : <td><%=rv.getRegistration_phone()%></tr>
												<tr><td>Alternate Phone No : <td><%=rv.getRegistration_alternatePhone()%></tr>
												<tr><td>Training Details : <td><%=rv.getRegistration_tdetails()%></tr>
												<tr><td>Project Details : <td><%=rv.getRegistration_pdetails()%>
												<tr><td>Other Details : <td><%=rv.getRegistration_odetails()%></tr>
												</table>"
											data-original-title="<%=rv.getRegistration_name()%>">
											<i class="entypo-info"></i> View
										</button></td>
								</tr>
								<%
									}
								%>
							
						</table>
						<script type="text/javascript">
							var responsiveHelper;
							var breakpointDefinition = {
								tablet : 1024,
								phone : 480
							};
							var tableContainer;
							jQuery(document)
									.ready(
											function($) {
												tableContainer = $("#table-1");
												tableContainer
														.dataTable({
															"sPaginationType" : "bootstrap",
															"aLengthMenu" : [
																	[ 10, 25,
																			50,
																			-1 ],
																	[ 10, 25,
																			50,
																			"All" ] ],
															"bStateSave" : true,

															// Responsive Settings
															bAutoWidth : false,
															fnPreDrawCallback : function() {
																// Initialize the responsive datatables helper once.
																if (!responsiveHelper) {
																	responsiveHelper = new ResponsiveDatatablesHelper(
																			tableContainer,
																			breakpointDefinition);
																}
															},
															fnRowCallback : function(
																	nRow,
																	aData,
																	iDisplayIndex,
																	iDisplayIndexFull) {
																responsiveHelper
																		.createExpandIcon(nRow);
															},
															fnDrawCallback : function(
																	oSettings) {
																responsiveHelper
																		.respond();
															}
														});
												$(".dataTables_wrapper select")
														.select2(
																{
																	minimumResultsForSearch : -1
																});
											});
						</script>
						<br />


						<script type="text/javascript">
							jQuery(window)
									.load(
											function() {
												var $ = jQuery;
												$("#table-2")
														.dataTable(
																{
																	"sPaginationType" : "bootstrap",
																	"sDom" : "t<'row'<'col-xs-6 col-left'i><'col-xs-6 col-right'p>>",
																	"bStateSave" : false,
																	"iDisplayLength" : 8,
																	"aoColumns" : [
																			{
																				"bSortable" : false
																			},
																			null,
																			null,
																			null,
																			null ]
																});
												$(".dataTables_wrapper select")
														.select2(
																{
																	minimumResultsForSearch : -1
																});
												// Highlighted rows
												$(
														"#table-2 tbody input[type=checkbox]")
														.each(
																function(i, el) {
																	var $this = $(el), $p = $this
																			.closest('tr');
																	$(el)
																			.on(
																					'change',
																					function() {
																						var is_checked = $this
																								.is(':checked');
																						$p[is_checked ? 'addClass'
																								: 'removeClass']
																								('highlight');
																					});
																});
												// Replace Checboxes
												$(".pagination a")
														.click(
																function(ev) {
																	replaceCheckboxes();
																});
											});
							// Sample Function to add new row
							var giCount = 1;
							function fnClickAddRow() {
								$('#table-2')
										.dataTable()
										.fnAddData(
												[
														'<div class="checkbox checkbox-replace"><input type="checkbox" /></div>',
														giCount + ".2",
														giCount + ".3",
														giCount + ".4",
														giCount + ".5" ]);
								replaceCheckboxes(); // because there is checkbox, replace it
								giCount++;
							}
						</script>
						<br /> <br />

						<script type="text/javascript">
							jQuery(document)
									.ready(
											function($) {
												var table = $("#table-3")
														.dataTable(
																{
																	"sPaginationType" : "bootstrap",
																	"aLengthMenu" : [
																			[
																					10,
																					25,
																					50,
																					-1 ],
																			[
																					10,
																					25,
																					50,
																					"All" ] ],
																	"bStateSave" : true
																});
												table
														.columnFilter({
															"sPlaceHolder" : "head:after"
														});
											});
						</script>
						<br />

						<script type="text/javascript">
							jQuery(document)
									.ready(
											function($) {
												var table = $("#table-4")
														.dataTable(
																{
																	"sPaginationType" : "bootstrap",
																	"sDom" : "<'row'<'col-xs-6 col-left'l><'col-xs-6 col-right'<'export-data'T>f>r>t<'row'<'col-xs-6 col-left'i><'col-xs-6 col-right'p>>",
																	"oTableTools" : {},
																});
											});
						</script>

					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			jQuery(document)
					.ready(
							function($) {
								var table = $("#table-4")
										.dataTable(
												{
													"sPaginationType" : "bootstrap",
													"sDom" : "<'row'<'col-xs-6 col-left'l><'col-xs-6 col-right'<'export-data'T>f>r>t<'row'<'col-xs-6 col-left'i><'col-xs-6 col-right'p>>",
													"oTableTools" : {},
												});
							});
		</script>
		<br />
	</div>
	</div>
	<!-- Imported styles on this page -->
	<link rel="stylesheet" href="../css/datatables.responsive.css"
		id="style-resource-1">
	<link rel="stylesheet" href="../css/select2-bootstrap.css"
		id="style-resource-2">
	<link rel="stylesheet" href="../css/select2.css" id="style-resource-3">
	<script src="../js/main-gsap.js" id="script-resource-1"></script>
	<script src="../js/jquery-ui-1.10.3.minimal.min.js"
		id="script-resource-2"></script>
	<script src="../js/bootstrap.js" id="script-resource-3"></script>
	<script src="../js/joinable.js" id="script-resource-4"></script>
	<script src="../js/resizeable.js" id="script-resource-5"></script>
	<script src="../js/neon-api.js" id="script-resource-6"></script>
	<script src="../js/cookies.min.js" id="script-resource-7"></script>
	<script src="../js/jquery.dataTables.min.js" id="script-resource-8"></script>
	<script src="../js/datatables/TableTools.min.js" id="script-resource-9"></script>
	<script src="../js/dataTables.bootstrap.js" id="script-resource-10"></script>
	<script src="../js/jquery.dataTables.columnFilter.js"
		id="script-resource-11"></script>
	<script src="../js/lodash.min.js" id="script-resource-12"></script>
	<script src="../js/datatables.responsive.js" id="script-resource-13"></script>
	<script src="../js/select2.min.js" id="script-resource-14"></script>
	<script src="../js/neon-chat.js" id="script-resource-15"></script>
	<!-- JavaScripts initializations and stuff -->
	<script src="../js/neon-custom.js" id="script-resource-16"></script>
	<!-- Demo Settings -->
	<script src="../js/neon-demo.js" id="script-resource-17"></script>
	<script src="../js/neon-skins.js" id="script-resource-18"></script>
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