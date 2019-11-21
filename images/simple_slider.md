````
<script>
    $('.a-image').click(function () {
        var path = $(this).data('value');
        $("#big-image").attr("src", path);
    });
</script>
````