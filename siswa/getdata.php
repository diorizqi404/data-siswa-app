<?php
include "conn.php";
$queryResult = $connect->query("SELECT * FROM siswa");
$result = array();
while($fetchData = $queryResult->fetch_assoc()){
	$result[] = $fetchData;
}
echo json_encode($result);
?>