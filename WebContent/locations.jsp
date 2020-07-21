<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html xmlns:jsp="http://java.sun.com/JSP/Page" lang="en-US">
<head>
<title>Locations</title>
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
						<h1>Locations Master</h1>
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
								<a href="#">Locations Master</a>
							</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
		<div class="content mt-3">
			<div class="card">
				<div class="card-header">
					<button class="btn btn-success" data-toggle="modal" data-target="#modal-add" data-add-btn>Add</button>
				</div>
				<div class="card-body">
					<table class="table table-striped table-bordered" data-locations>
						<thead>
							<tr>
								<th>ID</th>
								<th>Vehicle ID</th>
								<th>Vehicle Plate Number</th>
								<th>Latitude</th>
								<th>Longitude</th>
								<th>Last Update</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="card-footer card-header">
					<button class="btn btn-success" data-toggle="modal" data-target="#modal-add" data-add-btn>Add</button>
				</div>
			</div>

			<div class="card">
				<div class="card-body">
					<div style="height: 80vh;" data-map></div>
				</div>
			</div>
		</div>
	</div>
	<div id="modal-add" class="modal" role="dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Add Location</h5>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<form data-add-form>
					<div class="form-group row">
						<label class="col-md-4">ID</label>
						<div class="col-md-8">
							<input type="text" class="form-control" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4">Vehicle Plate Number</label>
						<div class="col-md-8">
							<select class="form-control" required name="location.vehId" data-vehicles>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4">Latitude</label>
						<div class="col-md-8">
							<input type="number" class="form-control" required name="location.locLatitude">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4">Longitude</label>
						<div class="col-md-8">
							<input type="number" class="form-control" required name="location.locLongitude">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4">Last Update</label>
						<div class="col-md-8">
							<input type="text" class="form-control" readonly>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-add-submit>Save</button>
			</div>
		</div>
	</div>
	<jsp:include page="_linkJS.jsp" />
	<script src="/static/js/ajax_locations.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDIV-77ur7AyC_V1CEuGm7zwq3qlY5d8gY"></script>
</body>
</html>
