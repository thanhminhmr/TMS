<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html xmlns:jsp="http://java.sun.com/JSP/Page" lang="en-US">
<head>
<title>Stations</title>
<meta charset="utf-8">
<jsp:include page="_linkCSS.jsp" />
</head>
<body>
	<jsp:include page="_left.jsp" />
	<div id="right-panel" class="right-panel">
		<header id="header" class="header">
			<div class="header-menu">
				<div class="col-sm-7">
					<a id="menuToggle" class="menutoggle pull-left">
						<i class="fa fa fa-tasks"></i>
					</a>
					<div class="header-left">Transport Management System</div>
				</div>
			</div>
		</header>
		<div class="breadcrumbs">
			<div class="col-sm-4">
				<div class="page-header float-left">
					<div class="page-title">
						<h1>Stations Master</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li>
								<a href="#">Master Screens</a>
							</li>
							<li>
								<a href="#">Stations Master</a>
							</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
		<div class="content mt-3">
			<div class="card">
				<div class="card-body">
					<table class="table table-striped table-bordered" data-stations>
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Address</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="_linkJS.jsp" />
	<script src="/static/js/ajax_stations.js"></script>
</body>
</html>
