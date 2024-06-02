<?php
include "conn.php";
$nis = @$_REQUEST['nis'];
$connect->query("DELETE FROM siswa WHERE nis = '$nis'");
?>