<!DOCTYPE html>
<html lang="en" dir="ltr" style="font-family:Arial">

  <link rel="stylesheet" href="styleFINAL.css">
  <link rel="stylesheet" href="style.css">

  <meta charset="UTF-8">
  <title>Nuevo suplente</title>

</head>

<body>
  <?php
    echo " ";

        error_reporting(E_ALL);
        ini_set('display_errors', 1);

        $enlace = mysqli_connect("127.0.0.1", "adminphp", "Oreo.1989", "elecciones");

        if ($enlace)
            echo "Conexión exitosa. <br>";

        else
            die("Conexión fallida.");

        $idSuplente = $_POST['idSuplente'];
        $idMiembro = $_POST['idMiembro'];
        $Votante_idVotante = $_POST['Votante_idVotante'];

        $insert_query = mysqli_query($enlace, "INSERT INTO suplente (`idSuplente`, `Miembro_idMiembro`, `Votante_idVotante`) VALUES ('$idSuplente', '$idMiembro', '$Votante_idVotante');");

        echo mysqli_error($enlace);

        echo" ";

        echo"<h3>Se creó un suplente con el id $idSuplente</h3>";
        echo"<form name = 'nombre_form' action = 'Home.php' method = 'post'>

            <h4>Click here to go back</h4>
            <input type ='submit' name='home' value='Home'></input></form>";
      //echo $hash;
    ?>

 </body>
</html>
