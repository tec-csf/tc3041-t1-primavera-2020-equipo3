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
            <a class = "active" href = "TiposdeEleccion.php">Tipos de elecciones</a>
            <a href = "Colegio.php">Colegios</a>
            <a href = "Apoderado.php">Apoderados</a>
            <a href = "Partidos.php">Partidos</a>
            <a href = "Elecciones.php">Elecciones</a>
            <a href = "Votantes.php">Votantes</a>
            <a href="home.php">Home</a>
        </div>
    </header>

    <body>

    <button onclick="window.location.href = 'TiposdeEleccion.php';">Regresar a tipos de elecciones</button>


    <?php

        echo " ";

        error_reporting(E_ALL);
        ini_set('display_errors', 1);

        $enlace = mysqli_connect("127.0.0.1", "adminphp", "Oreo.1989", "elecciones");

        if ($enlace)
            echo "Conexión exitosa. <br>";

        else
            die("Conexión fallida.");

        
        $sql = "SELECT eleccion_idEleccion, Partido_siglas, noVotos FROM federales";
        $result = $enlace->query($sql);

        echo "<table border='1'>
        <tr>
        <th>ID de elecciones</th>
        <th>Siglas del partido</th>
        <th>Número de votos</th>
        </tr>";

        if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
            
            echo "<tr>";
            echo "<td>" . $row['eleccion_idEleccion'] . "</td>";
            echo "<td>" . $row['Partido_siglas'] . "</td>";
            echo "<td>" . $row['noVotos'] . "</td>";
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