<?php
    include("connection.php");
    include("session.php");
    $cart = (isset($_SESSION["cart"]))? $_SESSION["cart"] : [];
    // var_dump($_SESSION["user"]);
    // die();
    $cart = (isset($_SESSION["cart"]))? $_SESSION["cart"] : [];
 
    if(isset($_SESSION["user"])){
        $user = $_SESSION["user"];
    }else{
        header('location:login.php');
    }
    
    $sql_user = "SELECT * FROM tbl_user";
    $query_user = mysqli_query($conn,$sql_user);

    if(isset($_POST['submit'])){

        $name = mysqli_real_escape_string($conn, $_POST['name']);
        $phone = $_POST['phone'];
        $address = $_POST['address'];
        $id = $_SESSION["user"][0];
     
        $sql = "UPDATE tbl_user SET phone = '$phone', `address` ='$address' WHERE `user_id` = '$id' ";
        mysqli_query($conn, $sql);
    }
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complete Responsive Food Website Design Tutorial</title>

    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style2.css">

    <link rel="stylesheet" href="./fontawesome-free-6.0.0-web/css/all.css">

    <link rel="stylesheet" href="./themify-icons/themify-icons.css">

    <style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>

</head>

<body>

    <!-- header section starts      -->

    <?php include("header.php") ?>

    <!-- header section ends-->

    <!-- search form  -->




    <!-- home section starts  -->

    <!-- home section starts  -->

    <section style="margin-top: 50px" class="home" id="home">

        <div class="container">
            <form method="POST">
                <label for="fname">Name</label>
                <input type="text" id="fname" name="name" value="<?php echo $user["name"] ?>">

                <label for="lname">Email</label>
                <input type="text" id="lname" name="email" value="<?php echo $user["email"] ?>">

                <label for="lname">Phone</label>
                <input type="text" id="lname" name="phone" value="<?php echo $user["phone"] ?>">

                <label for="lname">Address</label>
                <input type="text" id="lname" name="address" value="<?php echo $user["address"] ?>">

                <input name="submit" type="submit" value="Submit">
            </form>
        </div>

    </section>



    <!-- home section ends -->

    <!-- dishes section starts  -->
    <!-- page content -->

    <?php
      if(isset($_GET["page"])){
        $page = $_GET["page"];
        $file=$page.".php";
        include($file);
      }
      if(isset($_GET["tukhoa"])){
        include("search.php");
      }
    ?>

    <!-- /page content -->
    <!-- dishes section ends -->
    <!-- menu section starts  -->

    <section class="menu" id="menu">

        <h3 class="sub-heading"> our menu </h3>
        <h1 class="heading"> dishes's speciality </h1>

        <div class="box-container">
            <?php
                $item_per_page = !empty($_GET['per_page'])?$_GET['per_page']:8;
                $current_page = !empty($_GET['pagination'])?$_GET['pagination']:1; //Trang hiện tại
                $offset = ($current_page - 1) * $item_per_page;
                $totalRecords = mysqli_query($conn, "SELECT * FROM tbl_product");
                $totalRecords = $totalRecords->num_rows;
                $totalPages = ceil($totalRecords / $item_per_page);
                $query = "SELECT * FROM tbl_product WHERE `status2` = 1 LIMIT ".$item_per_page." OFFSET ".$offset."";
                $result = mysqli_query($conn, $query) or die("Error");
                foreach($result as $item):?>
            <div class="box">
                <div class="image">
                    <img src="images/<?php echo $item["images"]; ?>">
                    <a href="detail.php?id=<?php echo $item["pro_id"] ?>" class="fas fa-eye"></a>
                </div>
                <div class="content">
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <h3><?php echo $item["pro_name"] ?></h3>
                    <p><?php echo $item["description"] ?></p>
                    <a href="cart.php?id=<?php echo $item["pro_id"] ?>" class="btn">add to cart</a>
                    <span class="price">$<?php echo number_format($item["price"],2,",","."); ?></span>
                </div>
            </div>
            <?php endforeach;?>

        </div>

        <?php include("pagination.php");?>
    </section>

    <!-- menu section ends -->

    <!-- review section starts  -->

    

    <!-- review section ends -->

    <!-- footer section starts  -->

    <section class="footer">

        <div class="box-container">

            <div class="box">
                <h3>locations</h3>
                <a href="#">india</a>
                <a href="#">japan</a>
                <a href="#">russia</a>
                <a href="#">USA</a>
                <a href="#">france</a>
            </div>

            <div class="box">
                <h3>quick links</h3>
                <a href="#">home</a>
                <a href="#">dishes</a>
                <a href="#">about</a>
                <a href="#">menu</a>
                <a href="#">reivew</a>
                <a href="#">order</a>
            </div>

            <div class="box">
                <h3>contact info</h3>
                <a href="#">+123-456-7890</a>
                <a href="#">+111-222-3333</a>
                <a href="#">shaikhanas@gmail.com</a>
                <a href="#">anasbhai@gmail.com</a>
                <a href="#">mumbai, india - 400104</a>
            </div>

            <div class="box">
                <h3>follow us</h3>
                <a href="#">facebook</a>
                <a href="#">twitter</a>
                <a href="#">instagram</a>
                <a href="#">linkedin</a>
            </div>

        </div>

    </section>

    <!-- footer section ends -->

    <!-- loader part  -->


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
    <script src="js/script.js"></script>
    <script src="js/cart.js"></script>
</body>

</html>