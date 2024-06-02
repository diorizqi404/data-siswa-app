<?php
include "conn.php";
$nis	= @$_REQUEST['nis'];
$nama	= @$_REQUEST['nama'];
$jk		= @$_REQUEST['jk'];
$alamat	= @$_REQUEST['alamat'];
$nomor	= @$_REQUEST['nomor'];
$connect->query("UPDATE siswa SET nama = '$nama', jk = '$jk', alamat = '$alamat', nomor = '$nomor' WHERE nis = '$nis'");
?>