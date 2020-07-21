$('document').ready(function() {
	let dataLocations = $('[data-locations]');
	let dataVehicles = $('[data-vehicles]');
	$.when(
		$.ajax({
			url: '/vehicles/list',
			type: 'GET',
			dataType: 'JSON',
			success: function (result) {
				if (result.success === true) {
					dataVehicles.data(result);
					$.each(result.vehicles, (key, value) => dataVehicles.append('<option value="' + value.vehId + '">' + value.vehPlateNumber + '</option>'));
				}
			}
		}),
		$.ajax({
	        url : '/locations/listByLastTimestamp',
	        type : 'GET',
	        dataType : 'JSON',
	        success : function(result) {
	            if (result.success === true) {
		            dataLocations.data(result);
	            }	
	        }
	    })
    ).fail(function() {
		location.reload();
	}).done(function() {
		dataLocations.DataTable({
			data: dataLocations.data().locations,
			columns: [
				{ data: 'locId' },
				{ data: 'vehId' },
				{ 
					data: 'vehId', 
					render: function (data) {
						let result = dataVehicles.data();
						return result.success === true ? result.vehicles.find((element) => element.vehId === data).vehPlateNumber : '';
					}
				},
				{ data: 'locLatitude' },
				{ data: 'locLongitude' },
				{
					data: 'locTimestamp',
					render: function (data) {
						return new Date(data);
					}
				}
			],
			order: [[1, 'asc']]
		});
		let dataMap = $('[data-map]');
		let map = new google.maps.Map(dataMap.get(0));
		let bounds = new google.maps.LatLngBounds();
		let infoWindow = new google.maps.InfoWindow();
		for (let location of dataLocations.data().locations) {
			let position = { lat: location.locLatitude, lng: location.locLongitude };
			let marker = new google.maps.Marker({
			    position: position,
			    label: '' + location.vehId,
			    map: map
			});
			let content = 
				'locId: ' + location.locId + '<br/>' +
				'vehId: ' + location.vehId + '<br/>' +
				'vehPlateNumber: ' + dataVehicles.data().vehicles.find((element) => element.vehId === location.vehId).vehPlateNumber + '<br/>' +
				'locLatitude: ' + location.locLatitude + '<br/>' +
				'locLongitude: ' + location.locLongitude + '<br/>' +
				'locTimestamp: ' + location.locTimestamp;
	        marker.addListener('click', function() {
	        	let currentPosition = infoWindow.getPosition();
	        	if (currentPosition === undefined || currentPosition.lat() !== position.lat || currentPosition.lng() !== position.lng) {
		        	infoWindow.setPosition(position);
		        	infoWindow.setContent(content);
	        	}
		        infoWindow.open(map, marker);
	        });
	        bounds.extend(position);
		}
		map.fitBounds(bounds);
		dataMap.data(map);
	});

	$('[data-add-submit]').click(function() {
		$.ajax({
			type: "POST",
			dataType: "JSON",
			url: "/locations/add",
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
});