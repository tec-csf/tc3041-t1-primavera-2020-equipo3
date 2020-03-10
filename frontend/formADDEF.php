<!DOCTYPE html>
<html lang="en" dir="ltr" style="font-family:Arial">

  <link rel="stylesheet" href="styleFINAL.css">
  <link rel="stylesheet" href="style.css">

  <meta charset="UTF-8">
  <title>Nuevo votante</title>

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

        $Eleccion_idEleccion = $_POST['idEleccion'];
        $Partido_siglas = $_POST['Partido_siglas'];
        $noVotos = $_POST['noVotos'];

        $insert_query = mysqli_query($enlace, "INSERT INTO federales (`idEleccion`, `Partido_siglas`, `noVotos`) VALUES ('$idEleccion', '$Partido_siglas', '$noVotos');");

        echo mysqli_error($enlace);

        echo" ";

        echo"<h3>Se creó una elección con el número $idEleccion</h3>";
        echo"<form name = 'nombre_form' action = 'Home.php' method = 'post'>

            <h4>Click here to go back</h4>
            <input type ='submit' name='home' value='Home'></input></form>";
      //echo $hash;
    ?>

 </body>
</html>
