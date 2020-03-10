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
            <a href = "Votantes.php">Votantes</a>
            <a class = "active" href="home.php">Home</a>
        </div>
    </header>

    <body>
    
    <h1>HELLO THERE!</h1>

    <h3>Seleccione una de las opciones del menú de arriba.</h3>

    <?php

        error_reporting(E_ALL);
        ini_set('display_errors', 1);

        $enlace = mysqli_connect("127.0.0.1", "adminphp", "Oreo.1989", "elecciones");

        if ($enlace)
            echo "Conexión exitosa. <br>";

        else
            die("Conexión fallida.");

        $enlace->close();

    ?>


    </body>

</html> 