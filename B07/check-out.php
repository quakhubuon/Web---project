<?php
    include("connection.php");
    include("session.php");
    $cart = (isset($_SESSION["cart"]))? $_SESSION["cart"] : [];
    // var_dump($_SESSION["user"]);
    // die();
    include("header.php");
 
    if(isset($_SESSION["user"])){
        $user = $_SESSION["user"];
    }

    $phone = isset($_POST["phone"]) ? $_POST["phone"] : '';
    $address = isset($_POST["address"]) ? $_POST["address"] : '';

    if(isset($_POST["phone"])) {
        $user["phone"] = $_SESSION["user"]["phone"] = $phone;
    }

    if(isset($_POST["address"])) {
        $user["address"] = $_SESSION["user"]["address"] = $address;
    }

    if(isset($_POST["addNew"])) {
        
                   
        $user_id = $user["user_id"];
        $note = $_POST["note"];
        $phone = $_POST["phone"]; 
        $payment = $_POST["payment"];
        
        $total_price = 0;
        foreach ($cart as $value) {
        $totalprice += ($value["price"] * $value["quantity"]);
        $total_price = number_format(($totalprice),2,",",".");

        if(isset($_POST["checkBox"])){
            $address = $_POST["newaddress"];
        }else{
            $address = $_POST["address"];
        }

    }
    
        $query = mysqli_query($conn,"INSERT INTO tbl_orders(`user_id`, note, phone, `address`, payment, total_price) VALUES ('$user_id', '$note', '$phone', '$address', '$payment', '$total_price')");
        
        if($query) {
            $id = mysqli_insert_id($conn);
            foreach($cart as $value) {
                mysqli_query($conn,"INSERT INTO tbl_detail(detail_id, pro_id, quantity, price) VALUES('$id','$value[id]','$value[quantity]','$value[price]')");
            }
            unset($_SESSION["cart"]);
            header('location:index.php');
        }
    }

    // echo "<pre>";
    // print_r($_SESSION["user"]["phone"]);
    // print_r($_SESSION["user"]["address"])
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/cart.css">
    <link rel="stylesheet" href="./fontawesome-free-6.0.0-web/css/all.css">

    <link rel="stylesheet" href="./themify-icons/themify-icons.css">
    <style>
    body {
        margin-top: 100px;
        font-family: Arial;
        font-size: 17px;
        padding: 8px;
    }

    * {
        box-sizing: border-box;
    }



    .row {
        display: -ms-flexbox;
        /* IE10 */
        display: flex;
        -ms-flex-wrap: wrap;
        /* IE10 */
        flex-wrap: wrap;
        margin: 0 -16px;
    }

    .col-25 {
        -ms-flex: 25%;
        /* IE10 */
        flex: 25%;
    }

    .col-50 {
        -ms-flex: 50%;
        /* IE10 */
        flex: 50%;
    }

    .col-75 {
        -ms-flex: 75%;
        /* IE10 */
        flex: 75%;
    }

    .col-25,
    .col-50,
    .col-75 {
        padding: 0 16px;
    }

    .container {
        width: 800px;
        margin-left: 350px;
        background-color: #f2f2f2;
        padding: 5px 20px 15px 20px;
        border: 1px solid lightgrey;
        border-radius: 3px;
    }

    input[type=text] {
        width: 100%;
        margin-bottom: 20px;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 3px;
    }

    label {
        margin-bottom: 10px;
        display: block;
    }

    .icon-container {
        margin-bottom: 20px;
        padding: 7px 0;
        font-size: 24px;
    }

    .btn {
        background-color: #04AA6D;
        color: white;
        padding: 12px;
        margin: 10px 0;
        border: none;
        width: 100%;
        border-radius: 3px;
        cursor: pointer;
        font-size: 17px;
    }

    .btn:hover {
        background-color: #45a049;
    }

    a {
        color: none;
    }

    hr {
        border: 1px solid lightgrey;
    }

    span.price {
        float: right;
        color: grey;
    }

    /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
    @media (max-width: 800px) {
        .row {
            flex-direction: column-reverse;
        }

        .col-25 {
            margin-bottom: 20px;
        }
    }
    </style>

</head>

<body>

    <script language="javascript">
    function enableDisable(num, textBox) {
        if (num == true) {
            document.getElementById(textBox).disabled = false;
            document.getElementById(textBox).focus() = false;
        } else {
            document.getElementById(textBox).disabled = true;
            document.getElementById(textBox).focus() = true;
        }
    }
    </script>

    <form method="POST">
        <?php if(isset($_SESSION["user"])) {?>
        <div id="check" class="row">
            <div class="col-75">
                <div class="container">
                    <form>

                        <div class="row">
                            <div class="col-50">
                                <h3>Billing Address</h3>
                                <label for="fname"><i class="fa fa-user"></i> Full Name</label>
                                <input type="text" id="fname" name="name" value="<?php echo $user["name"] ?>">
                                <label for="email"><i class="fa fa-envelope"></i> Email</label>
                                <input type="text" id="email" name="email" value="<?php echo $user["email"] ?>">
                                <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
                                <input type="text" id="adr" name="address" value="<?php echo $user["address"] ?>">
                                <label>
                                    <input type="checkbox" id="checkBox" name="checkBox"
                                        onclick="enableDisable(this.checked, 'textBox')"> Shipping to new address
                                </label>
                                <label style="margin-top: 30px" for="adr"><i class="fa fa-address-card-o"></i> New
                                    address</label>
                                <input name="newaddress" type="text" id="textBox" disabled>
                                <label for="adr"> Phone</label>
                                <input type="text" id="adr" name="phone" value="<?php echo $user["phone"] ?>" required>
                                <label for="adr"> Note</label>
                                <input type="text" id="note" name="note">
                                <label for="adr"> Payment</label>
                                <select name="payment" style=" width:200px;" class="form-select"
                                    aria-label="Disabled select example" required>
                                    <option value="COD">COD</option>
                                </select>
                            </div>

                        </div>

                        <button id="addNew" name="addNew" type="submit" class="btn bg-info">Check
                            out</button>
                    </form>
                </div>
            </div>
            <div class="col-25">
                <div class="container">
                    <?php $total_price = 0 ?>
                    <?php foreach ($cart as $key => $value): 
                                    $total_price += ($value["price"] * $value["quantity"]);
                        ?>
                    <p><?php echo $value["name"] ?> <span
                            class="price">$<?php echo number_format(($value["price"] * $value["quantity"]),2,",",".")  ?></span>
                    </p>

                    <?php endforeach ?>
                    <hr>
                    <p>Total <span class="price"
                            style="color:black"><b>$<?php echo number_format(($total_price),2,",",".")  ?></b></span>
                    </p>
                </div>
            </div>
        </div>
        <?php }else {?>

    </form>
    <div class="alert alert-danger">
        <center>Please login!!! <a href="login.php?action=check-out" title="">Login</a></center>
    </div>
    <?php } ?>

    <!-- Modal -->
    <div class="modal modal-js">
        <div class="modal-container">
            <p class="modal-header">search</p>
            <form action="search.php" method="GET" class="modal-body">
                <label for="modal-user-name" class="modal-label">
                    Name
                </label>
                <input type="text" id="modal-user-name" class="modal-input" placeholder="Enter product's name..."
                    name="tukhoa">

                <!-- <label for="modal-password" class="modal-label">
                    price
                </label> -->
                <!-- <input type="text" id="modal-password" style="width:48%" name="start_price" class="modal-input"
                    placeholder="Enter price..."
                    value="<?php if(isset($_POST['start_price'])){echo $_POST['start_price'];} else{echo"";} ?>">
                <input type="text" id="modal-password" name="end_price"
                    class="modal-input" placeholder="Enter price..."
                    value="<?php if(isset($_POST['end_price'])){echo $_POST['end_price'];} else{echo"";} ?>"> -->
                <div class="  form-group has-feedback">
                    <!-- <?php 
                    $sqlSelectCat = "SELECT * FROM tbl_category WHERE status = 1";
                    $result = mysqli_query($conn, $sqlSelectCat) or die("Error");
                ?>
                    <select class="form-control" id="cat_id" name="cat_id">
                        <option value="">-- Chọn danh mục --</option>
                        <?php 
                    if (mysqli_num_rows($result) > 0) {
                    while($rowCat = mysqli_fetch_assoc($result)) {
                ?>
                        <option value="<?php echo $rowCat["cat_id"] ?>"><?php echo $rowCat["cat_name"] ?></option>
                        <?php }} ?>
                    </select> -->

                </div>

                <button style="text-transform: uppercase;" id="pay">Submit</button>
            </form>
            <div id="modal-footer">
                Need <a href="#">help?</a>
                <div id="btn">
                    <button class="modal-footer-button"><a>Close X</a></button>
                </div>
            </div>
        </div>
    </div>


    <script>
    const buytns = document.querySelectorAll('.buy-js');
    const modal = document.querySelector('.modal-js');
    const modalRed = document.querySelector('.modal-footer-button');

    function showTicket() {
        modal.classList.add('open');
    }

    function removeTicket() {
        modal.classList.remove('open');
    }

    for (const buybtn of buytns) {
        buybtn.addEventListener('click', showTicket);
    }

    modalRed.addEventListener('click', removeTicket);
    </script>

    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- custom js file link  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="js/script.js"></script>
    <script src="js/cart.js"></script>
    <script src="js/jquery-3.6.0.js"></script>
</body>

</html>