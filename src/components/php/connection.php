<?php
$servername='cssql.seattleu.edu';
$username='uemurar';
$password='HgVXuk6P';
$dbname=cs5021team5;

$conn = mysqli_connect($servername, $username, $password, $dbname);
if(!$conn){
  die("Connection failed: " . mysqli_connect_error());
}

?>