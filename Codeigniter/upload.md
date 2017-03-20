# <form>
enctype="multipart/form-data"

# view
<div class="form-group">
    <label class="control-label col-md-3 col-sm-3 col-xs-12"
           for="logo"><?php echo $this->lang->line("logo"); ?>
    </label>
    <div class="col-md-2 col-sm-2 col-xs-12">
        <input type="file" id="logo" name="userfile">
    </div>
</div>

# controller
````
if (isset($_POST['save'])) {
    $this->load->helper(['form']);

    $config = [
        'upload_path'   => FCPATH . 'assets/images/insurances',
        'allowed_types' => 'gif|jpg|png',
        'overwrite' => TRUE,
        'max_size'      => '100000',
        'max_width'     => '1024',
        'max_height'    => '768',
    ];
    $this->load->library('upload', $config);

    if ($this->upload->do_upload('userfile')) {
        echo 'Upload';
        die();
    } else {
        $error = array('error' => $this->upload->display_errors());

        var_dump($error);
        die();
    }
````