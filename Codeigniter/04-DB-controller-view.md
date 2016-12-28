# Workflow
## Create DB
## Create Controller
````
<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Items extends CI_Controller {

	/**
	 * List of Items
	 *
	 */
	public function index()
	{
        echo "Items controller";
//		$this->load->view('welcome_message');
	}

````
## Create view
````
cd ./application/views
sudo mkdir items
cd ./items
sudo touch list.php
sudo touch items/list.php
sudo chown -R $USER:$USER /var/www/example.com/public_html/CodeIgniter
<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Items extends CI_Controller {

	/**
	 * List of Items
	 *
	 */
	public function index()
	{
        $this->load->view('items/list');
	}

````
