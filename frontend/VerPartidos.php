<!DOCTYPE html>
<html lang="en" dir="ltr" style="font-family:Arial">
    <link rel="stylesheet" href="style.css">

    <head>
    <meta charset="UTF-8">
    <title>Home</title>
    </head>

    <header>
        <div class="topnav"> 
            <a href = "Suplente.php">Suplentes</a>
            <a href = "Miembros.php">Miembros</a>
            <a href = "Mesas.php">Mesas</a>
            <a href = "ListaNominal.php">Lista Nominal</a>
            <a href = "TiposdeEleccion.php">Tipos de elecciones</a>
            <a href = "Colegio.php">Colegios</a>
            <a href = "Apoderado.php">Apoderados</a>           
            <a href = "Partidos.php">Partidos</a>
            <a href = "Elecciones.php">Elecciones</a>
            <a class="active" href = "Votantes.php">Votantes</a>
            <a href="home.php">Home</a>
        </div>
    </header>

    <body>

    <button onclick="window.location.href = 'Partidos.php';">Regresar a partidos</button>


    <?php

        echo " ";

        error_reporting(E_ALL);
        ini_set('display_errors', 1);

        $enlace = mysqli_connect("127.0.0.1", "adminphp", "Oreo.1989", "elecciones");

        if ($enlace)
            echo "Conexión exitosa. <br>";

        else
            die("Conexión fallida.");

        
        $sql = "SELECT siglas, nombre, presidente_idVotante FROM partido";
        $result = $enlace->query($sql);

        echo "<table border='1'>
        <tr>
        <th>Siglas</th>
        <th>Nombre</th>
        </tr>";

        if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
            
            echo "<tr>";
            echo "<td>" . $row['siglas'] . "</td>";
            echo "<td>" . $row['nombre'] . "</td>";
            echo "</tr>";
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