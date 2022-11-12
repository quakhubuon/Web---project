<?php
    include("connection.php");
    include("session.php");
   
    if(isset($_GET["id"])){
        $id = $_GET["id"];
    }
    $action = (isset($_GET["action"])) ? $_GET["action"] : 'add';
    $quantity = (isset($_GET["quantity"])) ? $_GET["quantity"] : 1;
    if($quantity <= 0) {
        $quantity = 1;
    }
    // echo $action;
    // echo "<br>";
    // echo $id;
    // var_dump($action);
    // die();

    $query = mysqli_query($conn,"SELECT * FROM tbl_product WHERE pro_id = $id");
   
    if($query) {
        $product = mysqli_fetch_assoc($query);
    }
    // session_destroy();
    // die();
    $item = [
        "id"=>$product["pro_id"],
        "name"=>$product["pro_name"],
        "images"=>$product["images"],
        "price"=>$product["price"],
        "quantity"=>$quantity
    ];

    if($action == "add"){
        if(isset($_SESSION["cart"][$id])) {
            $_SESSION["cart"][$id]["quantity"] += $quantity;
        }
        else{
            $_SESSION["cart"][$id] = $item;
        }
    }

    if($action == "update"){
        $_SESSION["cart"][$id]["quantity"] = $quantity;
    }

    if($action == "delete"){
        // var_dump("ok"); die();
        unset($_SESSION["cart"][$id]);
    }

    if($action == "deleteAll"){
        unset($_SESSION["cart"]);
        header("location:index.php");
    }

    header("location:view-cart.php");
    // echo "<pre>";
    // print_r($_SESSION["cart"]);

?>