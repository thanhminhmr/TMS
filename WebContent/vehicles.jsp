<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html xmlns:jsp="http://java.sun.com/JSP/Page" lang="en-US">
<head>
<title>Vehicles</title>
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
						<h1>Vehicles Master</h1>
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
								<a href="#">Vehicles Master</a>
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
					<button class="btn btn-danger" data-toggle="modal" data-target="#modal-delete">Delete</button>
				</div>
				<div class="card-body">
					<table class="table table-striped table-bordered" data-vehicles>
						<thead>
							<tr>
								<th></th>
								<th>Id</th>
								<th>Plate number</th>
								<th>Manufacturer</th>
								<th>Color</th>
								<th>Employee</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="card-footer card-header">
					<button class="btn btn-success" data-toggle="modal" data-target="#modal-add" data-add-btn>Add</button>
					<button class="btn btn-danger" data-toggle="modal" data-target="#modal-delete">Delete</button>
				</div>
			</div>
		</div>
	</div>
	<div id="modal-add" class="modal" role="dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Add Vehicle</h5>
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
						<label class="col-md-4">Plate number</label>
						<div class="col-md-8">
							<input type="text" class="form-control" required name="vehicle.vehPlateNumber">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4">Manufacturer</label>
						<div class="col-md-8">
							<input type="text" class="form-control" required name="vehicle.vehManufacturer">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4">Color</label>
						<div class="col-md-8">
							<input type="text" class="form-control" required name="vehicle.vehColor">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4">Employee</label>
						<div class="col-md-8">
							<select class="form-control" required name="vehicle.empId" data-employees>
							</select>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-add-submit>Save</button>
			</div>
		</div>
	</div>
	<div id="modal-edit" class="modal" role="dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Edit Vehicle</h5>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<form data-edit-form>
					<div class="form-group row">
						<label class="col-md-4">ID</label>
						<div class="col-md-8">
							<input type="text" class="form-control" readonly name="vehicle.vehId">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4">Plate number</label>
						<div class="col-md-8">
							<input type="text" class="form-control" required name="vehicle.vehPlateNumber">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4">Manufacturer</label>
						<div class="col-md-8">
							<input type="text" class="form-control" required name="vehicle.vehManufacturer">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4">Color</label>
						<div class="col-md-8">
							<input type="text" class="form-control" required name="vehicle.vehColor">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4">Employee</label>
						<div class="col-md-8">
							<select class="form-control" required name="vehicle.empId" data-employees>
							</select>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-edit-submit>Save</button>
			</div>
		</div>
	</div>
	<div id="modal-delete" class="modal" role="dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Delete Vehicle</h5>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				Please confirm that you want to delete all selected vehicle(s). This can't be undone.
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-delete-submit>Delete</button>
				<button type="button" class="btn" data-dismiss="modal">Cancel</button>
			</div>
		</div>
	</div>
	<jsp:include page="_linkJS.jsp" />
	<script src="/static/js/ajax_vehicles.js"></script>
</body>
</html>
