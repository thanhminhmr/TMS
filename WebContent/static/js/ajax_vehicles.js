$('document').ready(function() {
	let dataVehicles = $('[data-vehicles]');
	let dataEmployees = $('[data-employees]');
	$.when(
		$.ajax({
			url: '/employees/list',
			type: 'GET',
			dataType: 'JSON',
			success: function (result) {
				if (result.success === true) {
					dataEmployees.data(result);
					$.each(result.employees, (key, value) => dataEmployees.append('<option value="' + value.empId + '">' + value.empName + '</option>'));
				}
			}
		}),
		$.ajax({
	        url : '/vehicles/list',
	        type : 'GET',
	        dataType : 'JSON',
	        success : function(result) {
	            if (result.success === true) {
		            dataVehicles.data(result);
	            }	
	        }
	    })
    ).fail(function() {
		location.reload();
	}).done(function() {
		dataVehicles.DataTable({
			data: dataVehicles.data().vehicles,
			columns: [
				{ 
					data: 'vehId',
					searchable: false,
					render: function (data) { 
						return '<input type="checkbox" name="vehicles.empId" value="' + data + '">'; 
					}
				},
				{ 
					data: 'vehId',
					searchable: false,
					render: function (data) { 
						return '<a href="#" data-toggle="modal" data-target="#modal-edit" data-edit-btn>' + data + '</a>'; 
					}
				},
				{ data: 'vehPlateNumber' },
				{ data: 'vehManufacturer' },
				{ data: 'vehColor' },
				{ 
					data: 'empId', 
					render: function (data) {
						let result = dataEmployees.data();
						return result.success === true ? result.employees.find((element) => element.empId === data).empName : '';
					}
				}
			],
			order: [[1, 'asc']]
		});
	});

	$('[data-add-submit]').click(function() {
		$.ajax({
			type: "POST",
			dataType: "JSON",
			url: "/vehicles/add",
			data: $("[data-add-form]").serialize(),
			success: function (result) {
				if (result.success === true) {
					location.reload();
				}
			}
		});
	});
	
	$('[data-add-btn]').click(function() {
		$('[data-add-form]').trigger('reset');
	});
	
	$('[data-edit-submit]').click(function() {
		$.ajax({
			type: "POST",
			dataType: "JSON",
			url: "/vehicles/edit",
			data: $("[data-edit-form]").serialize(),
			success: function (result) {
				if (result.success === true) {
					location.reload();
				}
			}
		});
	});

	dataVehicles.on('click', '[data-edit-btn]', function() {
		let result = dataVehicles.data();
		let data = $(this).text();
		let vehicle = result.vehicles.find((element) => element.vehId === data);
		$.each(vehicle, (key, value) => $('[name="vehicle.' + key + '"]', '[data-edit-form]').val(value));
	});
	
	$('[data-delete-submit]').click(function() {
		$.ajax({
			type: "POST",
			dataType: "JSON",
			url: "/vehicles/delete",
			data: $("[data-delete-form]").serialize(),
			success: function (result) {
				if (result.success === true) {
					location.reload();
				}
			}
		});
	});
});