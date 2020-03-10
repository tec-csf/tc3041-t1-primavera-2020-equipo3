<!DOCTYPE html>
<html lang="en" dir="ltr" style="font-family:Arial">
    <link rel="stylesheet" href="style.css">

    <head>
    <meta charset="UTF-8">
    <title>Home</title>
    </head>

    <header>
        <div class="topnav">
            <a class = "active" href = "Suplente.php">Suplentes</a>
            <a href = "Miembros.php">Miembros</a>
            <a href = "Mesas.php">Mesas</a>
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

    <table>
        <tr align="center">
        <th>Nuevo miembro</th>
        </tr>

        <form action="formADDEF.php" method="post">

        <tr style="text-align: right">
        <td>
        Inserte el número del suplente
        <input type="number" name="idSuplente"></input>
        </td>
        </tr>

        <tr style="text-align: right">
        <td>
        Inserta el id del miembro
        <input type="text" name="idMiembro"></input>
        </td>
        </tr>

        <tr style="text-align: right">
        <td>
        Inserta el ID de la persona
        <input type="text" name="Votante_idVotante"></input>
        </td>
        </tr>

        <tr style="text-align:right">
        <td>
        <input type ="submit" name="accept" value="Aceptar"></input>
        </tr>
        </td>

        </form>
    </table>

    <button onclick="window.location.href = 'Suplente.php';">Regresar a suplentes</button>

    </body>

</html> 