<?php
//Connexion à MySQL
$dbh = new mysqli ("localhost", "root", "", "site_mariage");
if ($dbh->connect_errno) {
    printf("Échec de la connexion : %s\n", $dbh->connect_error);
    exit();
}

//Variable table invitation
$idinvitation=$_POST["idinvitation"];

//On selectionne l'id rentré par l'utilisateur
$result = mysqli_query($dbh, "SELECT * FROM invitation WHERE idinvitation = '$idinvitation'");

//On verifie si il en existe un
if(mysqli_fetch_assoc($result) > 0) {
	header('Location: Accueil.html');
} else {
	header('Location: Identification.html');
}

//Fermeture de MySQL
$dbh->close();
?>