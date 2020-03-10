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

        $idVotante = $_POST['idVotante'];
        $nombre = $_POST['name'];
        $direccion = $_POST['direccion'];
        $mexicano = $_POST['mexicano'];
        $fechaNacimiento = $_POST['fechaNacimiento'];
        $mesa_id = $_POST['mesa_idMesa'];

        $update_query = mysqli_query($enlace, "UPDATE votante SET nombre = '$nombre', direccion = '$direccion', mexicano = '$mexicano', fechaNacimiento = '$fechaNacimiento', mesa_idMesa = '$mesa_id' WHERE idVotante = '$idVotante';");

        echo mysqli_error($enlace);

        echo" ";

        echo"<h3>Se actualizó correctamente al usuario con el número $idVotante</h3>";
        echo"<form name = 'nombre_form' action = 'Home.php' method = 'post'>

            <h4>Click here to go back</h4>
            <input type ='submit' name='home' value='Home'></input></form>";
      //echo $hash;
    ?>

 </body>
</html>
