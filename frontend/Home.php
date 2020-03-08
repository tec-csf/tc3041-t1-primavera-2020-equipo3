<!DOCTYPE html>
<html>

    <head>
    <meta charset="UTF-8">
    <title>Home</title>
    </head>

    <body>
    
        <?php
        
            error_reporting(E_ALL);         //USADO PARA DEBUGEAR
            ini_set('display_errors', 1);

            $enlace = mysqli_connect("127.0.0.1", "adminVG", "demo.123", "elecciones");

            if ($enlace)
                echo "Conexión exitosa. <br>";
            else
                die("Conexión no exitosa.");
        
        ?>

    </body>

</html> 