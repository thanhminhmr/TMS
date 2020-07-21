$('document').ready(function() {
	let dataStations = $('[data-stations]');
	$.ajax({
        url : '/stations/list',
        type : 'GET',
        dataType : 'JSON',
        success : function(result) {
            if (result.success === true) {
				dataStations.data(result);
            }	
        }
    }).fail(function() {
		location.reload();
	}).done(function() {
		dataStations.DataTable({
			data: dataStations.data().stations,
			columns: [
				{ data: 'staId' },
				{ data: 'staName' },
				{ data: 'staAddress' }
			],
			order: [[1, 'asc']]
		});
	});
});
