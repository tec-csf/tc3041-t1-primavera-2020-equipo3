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
            <a class = "active" href = "ListaNominal.php">Lista Nominal</a>
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
    
        <button onclick="window.location.href = 'VerListaNominal.php';">Ver lista nominal</button>

        <button onclick="window.location.href = 'AddListaNominal.php';">Añadir a la lista nominal</button>

        <button onclick="window.location.href = 'RemListaNominal.php';">Quitar lista nominal</button>

        <button onclick="window.location.href = 'UpListaNominal.php';">Actualizar nominal</button>

    </body>

</html> 