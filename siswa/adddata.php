<?php
include "conn.php";
$nis	= @$_REQUEST['nis'];
$nama	= @$_REQUEST['nama'];
$jk		= @$_REQUEST['jk'];
$alamat	= @$_REQUEST['alamat'];
$nomor	= @$_REQUEST['nomor'];
$connect->query("INSERT INTO siswa (nis, nama, jk, alamat, nomor) VALUES ('$nis', '$nama', '$jk', '$alamat', '$nomor')");

?>