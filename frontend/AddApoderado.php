<!DOCTYPE html>
<html lang="en" dir="ltr" style="font-family:Arial">
    <link rel="stylesheet" href="style.css">

    <head>
    <meta charset="UTF-8">
    <title>Apoderado</title>
    </head>

    <header>
        <div class="topnav">
            <a href = "Suplente.php">Suplentes</a>
            <a href = "Miembros.php">Miembros</a>
            <a href = "Mesas.php">Mesas</a>
            <a href = "ListaNominal.php">Lista Nominal</a>
            <a href = "TiposdeEleccion.php">Tipos de elecciones</a>
            <a href = "Colegio.php">Colegios</a>
            <a class = "active" href = "Apoderado.php">Apoderados</a>            
            <a href = "Partidos.php">Partidos</a>
            <a href = "Elecciones.php">Elecciones</a>
            <a href = "Votantes.php">Votantes</a>
            <a href="home.php">Home</a>
        </div>
    </header>

    <body>


    <table>
        <tr align="center">
        <th>Nuevo apoderado</th>
        </tr>

        <form action="formADDAP.php" method="post">

        <tr style="text-align: right">
        <td>
        ID del apoderado
        <input type="text" name="idApoderado"></input>
        </td>
        </tr>

        <tr style="text-align: right">
        <td>
        Nombre
        <input type="text" name="nombre"></input>
        </td>
        </tr>

        <tr style="text-align: right">
        <td>
        Siglas del partido
        <input type="text" name="Partido_siglas"></input>
        </td>
        </tr>

        <tr style="text-align:right">
        <td>
        <input type ="submit" name="accept" value="Aceptar"></input>
        </tr>
        </td>

        </form>
    </table>

    <button onclick="window.location.href = 'Apoderado.php';">Regresar a apoderados</button>

    </body>

</html> 