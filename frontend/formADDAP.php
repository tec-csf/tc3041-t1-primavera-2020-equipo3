<!DOCTYPE html>
<html lang="en" dir="ltr" style="font-family:Arial">

  <link rel="stylesheet" href="styleFINAL.css">
  <link rel="stylesheet" href="style.css">

  <meta charset="UTF-8">
  <title>Nuevo apoderado</title>

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

        $idApoderado = $_POST['idApoderado'];
        $nombre = $_POST['nombre'];
        $Partido_siglas = $_POST['Partido_siglas'];


     //$hashP = password_hash($password, PASSWORD_DEFAULT);
        $insert_query = mysqli_query($enlace, "INSERT INTO apoderado (`idApoderado`, `nombre`, `Partido_siglas`) VALUES ('$idApoderado', '$nombre', '$Partido_siglas');");

        echo mysqli_error($enlace);

        echo" ";

        echo"<h3>Se ingresó el apoderado $nombre correctamente</h3>";
        echo"<form name = 'nombre_form' action = 'Home.php' method = 'post'>

            <h4>Click here to go back</h4>
            <input type ='submit' name='home' value='Home'></input></form>";
      //echo $hash;
    ?>

 </body>
</html>
