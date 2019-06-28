<?php
  $mysqlhost="localhost";
  $mysqluser="bondrus_oda";
  $mysqlpass="rrfhfylfi";
  $mysqldp="bondrus_oda";

    /* Соединяемся, выбираем базу данных */
    $link = mysql_connect($mysqlhost, $mysqluser, $mysqlpass)
        or die("Could not connect : " . mysql_error());
    mysql_select_db($mysqldp) or die("Could not select database");

?>