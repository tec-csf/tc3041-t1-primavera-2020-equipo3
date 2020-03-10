<!DOCTYPE html>
<html lang="en" dir="ltr" style="font-family:Arial">
    <link rel="stylesheet" href="style.css">

    <head>
    <meta charset="UTF-8">
    <title>Home</title>
    </head>

    <header>
        <div class="topnav">            
            <a class ="active" href = "Partidos.php">Partidos</a>
            <a href = "Elecciones.php">Elecciones</a>
            <a href = "Votantes.php">Votantes</a>
            <a href="home.php">Home</a>
        </div>
    </header>

    <body>

    <table>
        <tr align="center">
        <th>Nuevo partido</th>
        </tr>

        <form action="formADDV.php" method="post">

        <tr style="text-align: right">
        <td>
        Inserte las siglas
        <input type="text" name="siglas"></input>
        </td>
        </tr>

        <tr style="text-align: right">
        <td>
        Nombre del partido
        <input type="text" name="nombre"></input>
        </td>
        </tr>

        <tr style="text-align: right">
        <td>
        Presidente del partido
        <input type="text" name="presidente_idVotante"></input>
        </td>
        </tr>

        <tr style="text-align:right">
        <td>
        <input type ="submit" name="accept" value="Aceptar"></input>
        </tr>
        </td>

        </form>
    </table>

    <button onclick="window.location.href = 'Partidos.php';">Regresar a partidos</button>

    </body>

</html> 