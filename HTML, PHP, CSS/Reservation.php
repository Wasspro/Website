<?php
//Connexion à MySQL
$dbh = new mysqli ("localhost", "root", "", "site_mariage");
if ($dbh->connect_errno) {
    printf("Échec de la connexion : %s\n", $dbh->connect_error);
    exit();
}

//Variable table invitation
$ville = $_POST["ville"];

//On recupere la ville qui a été choisie
$result = mysqli_query($dbh, "SELECT ville FROM mariage WHERE ville = '$ville'");

//On stocke la ville dans un tableau
$test = mysqli_fetch_assoc($result);

//On vérifie avec un if quelle ville a été choisie pour orientée l'utilisateur sur le bon menu
if($test["ville"] == "paris" ) {
	header('Location: ReservationParis.html');
} else {
	header('Location: ReservationTunis.html');
}

//Fermeture de MySQL
$dbh->close();
?>