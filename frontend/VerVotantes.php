<!DOCTYPE html>
<html lang="en" dir="ltr" style="font-family:Arial">
    <link rel="stylesheet" href="style.css">

    <head>
    <meta charset="UTF-8">
    <title>Home</title>
    </head>

    <header>
        <div class="topnav">            
            <a href = "Partidos.php">Partidos</a>
            <a href = "Elecciones.php">Elecciones</a>
            <a class="active" href = "Votantes.php">Votantes</a>
            <a href="home.php">Home</a>
        </div>
    </header>

    <body>

    <?php

        error_reporting(E_ALL);
        ini_set('display_errors', 1);

        $enlace = mysqli_connect("127.0.0.1", "adminphp", "Oreo.1989", "elecciones");

        if ($enlace)
            echo "Conexión exitosa. <br>";

        else
            die("Conexión fallida.");

        
        $sql = "SELECT idVotante, nombre, direccion, fechaNacimiento FROM votante";
        $result = $enlace->query($sql);

        if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
            echo "id: " . $row["idVotante"]. " - Nombre: " . $row["nombre"]. " -Dirección: " . $row["direccion"]. " - Fecha nacimiento: ". $row["fechaNacimiento"]. "<br>";
        }
        } else {
            echo "0 results";
        }

        echo mysqli_error($enlace);

        echo '<p>Connection OK '. $enlace->host_info.'</p>';
        echo '<p>Server '.$enlace->server_info.'</p>';
        $enlace->close();

    ?>


    </body>

</html> 