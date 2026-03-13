<?php
class Database{
	private $con;
	public function connect(){
		include_once("defines.php");
		$this->con = new Mysqli(HOST,USER,PASS,DB);
		if($this->con){return $this->con;}
		return "Database Connection Failed";
	}
}


?>