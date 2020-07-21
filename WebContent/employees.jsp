<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html xmlns:jsp="http://java.sun.com/JSP/Page" lang="en-US">
<head>
    <title>Employees</title>
    <meta charset="utf-8">
    <jsp:include page="_linkCSS.jsp"/>
</head>
<body>
<jsp:include page="_left.jsp"/>
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
                    <h1>Employees Master</h1>
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
                            <a href="#">Employees Master</a>
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
                <form data-delete-form>
                    <table class="table table-striped table-bordered" data-employees>
                        <thead>
                        <tr>
                            <th></th>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Position</th>
                            <th>Station</th>
                            <th>Address</th>
                            <th>Phone</th>
                            <th>Experience Years</th>
                            <th>Contract</th>
                        </tr>
                        </thead>
                    </table>
                </form>
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
            <h5 class="modal-title">Add Employee</h5>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
            <form data-add-form>
                <div class="form-group row">
                    <label for="add_empId" class="col-md-4">ID</label>
                    <div class="col-md-8">
                        <input id="add_empId" type="text" class="form-control" readonly>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="add_empName" class="col-md-4">Name</label>
                    <div class="col-md-8">
                        <input id="add_empName" type="text" class="form-control" required name="employee.empName">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="add_empPosition" class="col-md-4">Position</label>
                    <div class="col-md-8">
                        <input id="add_empPosition" type="text" class="form-control" required name="employee.empPosition">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="add_empAddress" class="col-md-4">Address</label>
                    <div class="col-md-8">
                        <input id="add_empAddress" type="text" class="form-control" required name="employee.empAddress">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="add_empPhone" class="col-md-4">Phone</label>
                    <div class="col-md-8">
                        <input id="add_empPhone" type="text" class="form-control" required name="employee.empPhone">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="add_empExpYear" class="col-md-4">Experience Years</label>
                    <div class="col-md-8">
                        <input id="add_empExpYear" type="text" class="form-control" required name="employee.empExpYear">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="add_staId" class="col-md-4">Station</label>
                    <div class="col-md-8">
                        <select id="add_staId" class="form-control" required name="employee.staId" data-stations>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="add_conId" class="col-md-4">Contract</label>
                    <div class="col-md-8">
                        <select id="add_conId" class="form-control" required name="employee.conId" data-contracts>
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
            <h5 class="modal-title">Edit Employee</h5>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
            <form data-edit-form>
                <div class="form-group row">
                    <label for="edit_empId" class="col-md-4">ID</label>
                    <div class="col-md-8">
                        <input id="edit_empId" type="text" class="form-control" readonly name="employee.empId">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="edit_empName" class="col-md-4">Name</label>
                    <div class="col-md-8">
                        <input id="edit_empName" type="text" class="form-control" required name="employee.empName">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="edit_empPosition" class="col-md-4">Position</label>
                    <div class="col-md-8">
                        <input id="edit_empPosition" type="text" class="form-control" required
                               name="employee.empPosition">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="edit_empAddress" class="col-md-4">Address</label>
                    <div class="col-md-8">
                        <input id="edit_empAddress" type="text" class="form-control" required
                               name="employee.empAddress">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="edit_empPhone" class="col-md-4">Phone</label>
                    <div class="col-md-8">
                        <input id="edit_empPhone" type="text" class="form-control" required name="employee.empPhone">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="edit_empExpYear" class="col-md-4">Experience Years</label>
                    <div class="col-md-8">
                        <input id="edit_empExpYear" type="text" class="form-control" required
                               name="employee.empExpYear">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="edit_staId" class="col-md-4">Station</label>
                    <div class="col-md-8">
                        <select id="edit_staId" class="form-control" required name="employee.staId" data-stations>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="edit_conId" class="col-md-4">Contract</label>
                    <div class="col-md-8">
                        <select id="edit_conId" class="form-control" required name="employee.conId" data-contracts>
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
            <h5 class="modal-title">Delete Employee</h5>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
            Please confirm that you want to delete all selected employee(s). This can't be undone.
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-delete-submit>Delete</button>
            <button type="button" class="btn" data-dismiss="modal">Cancel</button>
        </div>
    </div>
</div>
<jsp:include page="_linkJS.jsp"/>
<script src="/static/js/ajax_employees.js"></script>
</body>
</html>
