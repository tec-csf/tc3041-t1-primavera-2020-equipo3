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

    <table>
        <tr align="center">
        <th>Nueva elección</th>
        </tr>

        <form action="formADDEF.php" method="post">

        <tr style="text-align: right">
        <td>
        Inserte el identificador de la mesa
        <input type="number" name="idMesa"></input>
        </td>
        </tr>

        <tr style="text-align: right">
        <td>
        Inserta la letra de la mesa
        <input type="text" name="letraMesa"></input>
        </td>
        </tr>

        <tr style="text-align: right">
        <td>
        Inserta el número de correlativos
        <input type="number" name="noCorrelativos"></input>
        </td>
        </tr>

        <tr style="text-align: right">
        <td>
        Inserta el ID de la elección
        <input type="number" name="idEleccion"></input>
        </td>
        </tr>

        <tr style="text-align:right">
        <td>
        <input type ="submit" name="accept" value="Aceptar"></input>
        </tr>
        </td>

        </form>
    </table>

    <button onclick="window.location.href = 'Mesas.php';">Regresar a mesas</button>

    </body>

</html> 