$(document).ready(function() {
	
	$(".datatable-simple").dataTable({
		"bJQueryUI": true,
		"bRetrieve": false,
		"bDestroy": false,
		"bFilter": false,
		"bPaginate": false,
		"bSort": false,
		"bInfo": false,
		"sDom": 'T<"clear">lfrtip',
	});
	
	$(".datatable-multiple").dataTable({
		"bJQueryUI": true,
		"bRetrieve": true,
		"bDestroy": true,
		"bFilter": true,
		"bPaginate": true,
		"bSort": true,
		"sDom": 'T<"clear">lfrtip',
	});
	
});