<?php

    $txtNombre=(isset($_POST['txtNombre']))?$_POST['txtNombre']:"";
    $txtApellido=(isset($_POST['txtApellido']))?$_POST['txtApellido']:"";
    $txtIdSede=(isset($_POST['txtIdSede']))?$_POST['txtIdSede']:"";
    $txtPuesto=(isset($_POST['txtPuesto']))?$_POST['txtPuesto']:"";
    $txtHorario=(isset($_POST['txtHorario']))?$_POST['txtHorario']:"";

    $accion=(isset($_POST['accion']))?$_POST['accion']:"";

    include ("../conexion/conexion.php");

    switch($accion){
        
        case "btnAgregar":
            $sentencia=$pdo->prepare("INSERT INTO empleados(nombre,apellido,id_sede,puesto,id_horario) VALUES(:nombre,:apellido,:id_sede,:puesto,:id_horario)");
            mysqli_

            $sentencia->bindParam(':nombre', $txtNombre);
            $sentencia->bindParam(':apellido', $txtApellido);
            $sentencia->bindParam(':id_sede', $txtIdSede);
            $sentencia->bindParam(':puesto', $txtPuesto);
            $sentencia->bindParam(':id_horario', $txtHorario);

            $sentencia->execute();
            
            echo $txtNombre;
            echo "Presionaste btnAgregar";

        break;

        case "btnModificar":

            echo $txtID;
            echo "Presionaste btnAgregar";
            
        break;

        case "btnEliminar":

            echo $txtID;
            echo "Presionaste btnAgregar";
            
        break;

        case "btnCancelar":

            echo $txtID;
            echo "Presionaste btnAgregar";
            
        break;
        

    }

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


    <title>EMPLEADOS</title>

</head>
<body>
    
    <div class="container">

        <form action="" method="post" ectype="multipart/form-data">

            <label for="">Nombre:</label>
            <input type="text" name="txtNombre" placeholder="" id="txtNombre" require="">
            <br>

            <label for="">Apellido:</label>
            <input type="text" name="txtApellido" placeholder="" id="txtApellido" require="">
            <br>

            <label for="">ID de la Sede:</label>
            <input type="text" name="txtIdSede" placeholder="" id="txtIdSede" require="">
            <br>

            <label for="">Puesto:</label>
            <input type="text" name="txtPuesto" placeholder="" id="txtPuesto" require="">
            <br>

            <label for="">Horario:</label>
            <input type="text" name="txtHorario" placeholder="" id="txtHorario" require="">
            <br>

            

            <button value="btnAgregar" type="submint" name="accion"> AGREGAR </button>
            <button value="btnModificar" type="submint" name="accion"> MODIFICAR </button>
            <button value="btnEliminar" type="submint" name="accion"> ELIMINAR </button>
            <button value="btnCancelar" type="submint" name="accion"> CANCELAR </button>


        
        </form>
    
    </div>


</body>
</html>