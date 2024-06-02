<?php
$connect = new mysqli("localhost", "root", "", "flutter_siswa");
if($connect){
	// echo "Success";
}else{
	echo "Failed";
	exit();
}