<?php

	include 'conexion.php';
	
	$SITIO = $_POST['SITIO'];
	$NOMBRE_LIDER = $_POST['NOMBRE_LIDER'];
	$TELEFONO = $_POST['TELEFONO'];
	$DOMICILIO = $_POST['DOMICILIO'];
	
	
	$connect->query("INSERT INTO flotilla (SITIO,NOMBRE_LIDER,TELEFONO,DOMICILIO) VALUES ('".$SITIO."','".$NOMBRE_LIDER."','".$TELEFONO."','".$DOMICILIO."')")

?>