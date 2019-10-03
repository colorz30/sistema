<?php

    $servidor="mysql:dbname=ferreteria;host=127.0.0.1";
    $usuario="root";
    $password="root";

        try{
            $pdo = new PDO($servidor, $usuario, $password);
            echo "CONECTADO";
        }catch(PDOException $e){
            echo "CONEXION MALA".$e->getMessage();
        }


?>