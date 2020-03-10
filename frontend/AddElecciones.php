<!DOCTYPE html>
<html lang="en" dir="ltr" style="font-family:Arial">
    <link rel="stylesheet" href="style.css">

    <head>
    <meta charset="UTF-8">
    <title>Home</title>
    </head>

    <header>
        <div class="topnav">            
            <a href = "Partidos.php">Partidos</a>
            <a class ="active" href = "Elecciones.php">Elecciones</a>
            <a href = "Votantes.php">Votantes</a>
            <a href="home.php">Home</a>
        </div>
    </header>

    <body>

    <table>
        <tr align="center">
        <th>Nueva elección</th>
        </tr>

        <form action="formADDE.php" method="post">

        <tr style="text-align: right">
        <td>
        Inserte el identificador de la eleccion
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

    <button onclick="window.location.href = 'Elecciones.php';">Regresar a elecciones</button>

    </body>

</html> 