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

    <table>
        <tr align="center">
        <th>Nueva elección</th>
        </tr>

        <form action="formADDEM.php" method="post">

        <tr style="text-align: right">
        <td>
        Inserte el identificador de la eleccion
        <input type="number" name="idEleccion"></input>
        </td>
        </tr>

        <tr style="text-align: right">
        <td>
        Inserta las siglas del partido
        <input type="text" name="Partido_siglas"></input>
        </td>
        </tr>

        <tr style="text-align: right">
        <td>
        Inserta la cantidad de votos
        <input type="number" name="noVotos"></input>
        </td>
        </tr>

        <tr style="text-align:right">
        <td>
        <input type ="submit" name="accept" value="Aceptar"></input>
        </tr>
        </td>

        </form>
    </table>

    <button onclick="window.location.href = 'TiposdeEleccion.php';">Regresar a tipos de eleccion</button>

    </body>

</html> 