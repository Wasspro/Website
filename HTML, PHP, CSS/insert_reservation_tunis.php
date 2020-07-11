<?php
//Connexion à MySQL
$dbh = new mysqli ("localhost", "root", "", "site_mariage");
if ($dbh->connect_errno) {
    printf("Échec de la connexion : %s\n", $dbh->connect_error);
    exit();
}

//Variable table reservation
$nom=$_POST["nom"];
$prenom=$_POST["prenom"];
//Variable table menu
$entree=$_POST["entree"];
$plat=$_POST["plat"];
$dessert=$_POST["dessert"];
//Variable table buffet
$numtable=$_POST["numtable"];

//Selectionne le prenom rentree par l'utilisateur
$result = mysqli_query($dbh, "SELECT * FROM reservation WHERE prenom = '$prenom'");

//Vérifie si son prenom existe deja sinon effectuer la requete
if(mysqli_fetch_assoc($result) > 0) {
	header('Location: ReservationTunis.html');
} else {
	
//On insere dans la table reservation
$query = "INSERT INTO reservation(nom,prenom) VALUES ('$nom','$prenom')";
mysqli_query($dbh ,$query) or die(mysqli_error($dbh));

//Recupere l'id du nom, prenom
$test1 = mysqli_query($dbh, "SELECT idreservation from reservation WHERE nom = '$nom' AND prenom = '$prenom'");

//On stock l'id dans un tableau sous forme de string
$test2 = mysqli_fetch_assoc($test1);

//Retranscription en entier
$idreservation = $test2["idreservation"];

//On insere dans la table menu
$query2 = "INSERT INTO menu VALUES ('$entree','$plat','$dessert', $idreservation)";
mysqli_query($dbh, $query2) or die(mysqli_error($dbh));

//On insere dans la table buffet, ici le lieu est tunis car nous somme sur la page de reservation pour tunis
$query3 = "INSERT INTO buffet VALUES ('$numtable','tunis',$idreservation)";
mysqli_query($dbh, $query3) or die(mysqli_error($dbh));

//Redirection vers la page de confirmation
header('Location: Confirmation.html');
}

//Fermeture de MySQL
$dbh->close();
?>