### Delete sorting in one column
````
$('#datatable-responsive').dataTable({
    "columnDefs": [ {
        "targets"  : 'no-sort',
        "orderable": false,
        "order": []
    }]
});
````