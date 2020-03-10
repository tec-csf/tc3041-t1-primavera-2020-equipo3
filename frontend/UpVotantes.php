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
            <a class="active" href = "Votantes.php">Votantes</a>
            <a href="home.php">Home</a>
        </div>
    </header>

    <body>

    <button onclick="window.location.href = 'Votantes.php';">Regresar a votantes</button>

    <h3>Ingresa el id y el campo que desea actualizar</h3>

    <table>
        <tr align="center">
        <th>Update votante</th>
        </tr>

        <form action="formUPV.php" method="post">

        <tr style="text-align: right">
        <td>
        Número de pasaporte/INE
        <input type="text" name="idVotante"></input>
        </td>
        </tr>

        <tr style="text-align: right">
        <td>
        Nombre
        <input type="text" name="name"></input>
        </td>
        </tr>

        <tr style="text-align: right">
        <td>
        Dirección
        <input type="text" name="direccion"></input>
        </td>
        </tr>

        <tr style="text-align: right">
        <td>
        Nacionalidad
        <input type="number" name="mexicano" min="0" max="1"></input>
        </td>
        </tr>

        <tr style="text-align: right">
        <td>
        Fecha de nacimiento
        <input type="date" name="fechaNacimiento"></input>
        </td>
        </tr>

        <tr style="text-align: right">
        <td>
        Mesa correspondiente
        <input type="text" name="mesa_idMesa">
        </td>
        </tr>

        <tr style="text-align:right">
        <td>
        <input type ="submit" name="accept" value="Aceptar"></input>
        </tr>
        </td>

        </form>
    </table>


    </body>

</html> 