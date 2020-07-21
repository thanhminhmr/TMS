$('document').ready(function (){
	let dataEmployees = $('[data-employees]');
	let dataStations = $('[data-stations]');
	let dataContracts = $('[data-contracts]');
	$.when(
		$.ajax({
			url: '/stations/list',
			type: 'GET',
			dataType: 'JSON',
			success: function (result) {
				if (result.success === true) {
					dataStations.data(result);
					$.each(result.stations, (key, value) => dataStations.append('<option value="' + value.staId + '">' + value.staName + '</option>'));
				}
			}
		}),
		$.ajax({
			url: '/contracts/list',
			type: 'GET',
			dataType: 'JSON',
			success: function (result) {
				if (result.success === true) {
					dataContracts.data(result);
					$.each(result.contracts, (key, value) => dataContracts.append('<option value="' + value.conId + '">' + value.conName + '</option>'));
				}
			}
		}),
		$.ajax({
			url: '/employees/list',
			type: 'GET',
			dataType: 'JSON',
			success: function (result) {
				if (result.success === true) {
					dataEmployees.data(result);
				}
			}
		})
	).fail(function() {
		location.reload();
	}).then(function() {
		dataEmployees.DataTable({
			data: dataEmployees.data().employees,
			columns: [
				{ 
					data: 'empId',
					searchable: false,
					render: function (data) { 
						return '<input type="checkbox" name="employees.empId" value="' + data + '">'; 
					}
				},
				{ 
					data: 'empId',
					searchable: false,
					render: function (data) { 
						return '<a href="#" data-toggle="modal" data-target="#modal-edit" data-edit-btn>' + data + '</a>'; 
					}
				},
				{ data: 'empName' },
				{ data: 'empPosition' },
				{ 
					data: 'staId', 
					render: function (data) {
						let result = dataStations.data();
						return result.success === true ? result.stations.find((element) => element.staId === data).staName : '';
					}
				},
				{ data: 'empAddress' },
				{ data: 'empPhone' },
				{ data: 'empExpYear' },
				{ 
					data: 'conId', 
					render: function (data) {
						let result = dataContracts.data();
						return result.success === true ? result.contracts.find((element) => element.conId === data).conName : '';
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
			url: "/employees/add",
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
			url: "/employees/edit",
			data: $("[data-edit-form]").serialize(),
			success: function (result) {
				if (result.success === true) {
					location.reload();
				}
			}
		});
	});

	dataEmployees.on('click', '[data-edit-btn]', function() {
		let result = $('[data-employees]').data();
		let data = $(this).text();
		let employee = result.employees.find((element) => element.empId === data);
		$.each(employee, (key, value) => $('[name="employee.' + key + '"]', '[data-edit-form]').val(value));
	});
	
	$('[data-delete-submit]').click(function() {
		$.ajax({
			type: "POST",
			dataType: "JSON",
			url: "/employees/delete",
			data: $("[data-delete-form]").serialize(),
			success: function (result) {
				if (result.success === true) {
					location.reload();
				}
			}
		});
	});
});