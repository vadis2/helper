# Workflow
## Create Controller
````
<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Items extends CI_Controller {

	public function __construct()
    {
        parent::__construct();
        
        $this->load->database();
        $this->load->model('Item_model');
    }
    
    /**
	 * List of Items
	 *
	 */
	public function index()
	{
        $items = $this->Item_model->getAll();
        var_dump($items);
        die();
		$this->load->view('items/list');
	}
}
````
## Create model
````
<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Item_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }
    
    public function getAll()
    {
        $query = $this->db->get('items');
    
        return $query->result();
    }
    
    public function get_last_ten_entries()
    {
        $query = $this->db->get('entries', 10);
        
        return $query->result();
    }
    
    public function insert_entry()
    {
        $this->title   = $_POST['title']; // please read the below note
        $this->content = $_POST['content'];
        $this->date    = time();
        
        $this->db->insert('entries', $this);
    }
    
    public function update_entry()
    {
        $this->title   = $_POST['title'];
        $this->content = $_POST['content'];
        $this->date    = time();
        
        $this->db->update('entries', $this, ['id' => $_POST['id']]);
    }   
}
````
