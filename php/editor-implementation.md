# Editor implementation
````
<form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left"
                                  method="post" onSubmit="myEditor()">
                                  
<div id="editor-one" class="editor-wrapper"></div>

                                                <textarea name="description" id="descr" style="display:none;"></textarea>                          
                                  
                                  
<script>
  function myEditor() {
      document.getElementById("descr").innerHTML = $('#editor-one').html();
  }
</script>
````