<?php

$connect = new mysqli("localhost","root","","taxi_app");

if($connect){
	 
}else{
	echo "Fallo, revise ip o firewall";
	exit();
}