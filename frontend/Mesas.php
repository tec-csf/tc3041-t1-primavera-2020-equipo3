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
            <a class = "active" href = "Mesas.php">Mesas</a>
            <a href = "ListaNominal.php">Lista Nominal</a>
            <a href = "TiposdeEleccion.php">Tipos de elecciones</a>
            <a href = "Colegio.php">Colegios</a>
            <a href = "Apoderado.php">Apoderados</a>
            <a href = "Partidos.php">Partidos</a>
            <a href = "Elecciones.php">Elecciones</a>
            <a href = "Votantes.php">Votantes</a>
            <a href="home.php">Home</a>
        </div>
    </header>

    <body>
    
        <button onclick="window.location.href = 'VerMesas.php';">Ver lista de mesas</button>

        <button onclick="window.location.href = 'AddMesas.php';">Añadir a la lista de mesas</button>

        <button onclick="window.location.href = 'RemMesas.php';">Quitar de la lista de mesas</button>

        <button onclick="window.location.href = 'UpMesas.php';">Actualizar la lista de mesas</button>

    </body>

</html> 