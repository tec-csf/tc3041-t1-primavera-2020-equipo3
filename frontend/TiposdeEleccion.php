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
        <br>    
        <button onclick="window.location.href = 'VerEleccionesM.php';">Ver elecciones municipales</button>
        <button onclick="window.location.href = 'AddEleccionesM.php';">Añadir elecciones municipales</button>
        <button onclick="window.location.href = 'RemEleccionesM.php';">Quitar elecciones municipales</button>
        <button onclick="window.location.href = 'UpEleccionesM.php';">Actualizar elecciones municipales</button>
        </br>

        <br>
        <button onclick="window.location.href = 'VerEleccionesF.php';">Ver elecciones federales</button>
        <button onclick="window.location.href = 'AddEleccionesF.php';">Añadir elecciones federales</button>
        <button onclick="window.location.href = 'RemEleccionesF.php';">Quitar elecciones federales</button>
        <button onclick="window.location.href = 'UpEleccionesF.php';">Actualizar elecciones federales</button>
        </br>

    </body>

</html> 