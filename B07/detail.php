<?php
    include("connection.php");
    include("session.php");
    $cart = (isset($_SESSION["cart"]))? $_SESSION["cart"] : [];
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
    <link rel="stylesheet" href="css/style.css">

    <link rel="stylesheet" href="./fontawesome-free-6.0.0-web/css/all.css">

    <link rel="stylesheet" href="./themify-icons/themify-icons.css">

</head>

<body>

    <!-- header section starts      -->

    <?php include("header.php") ?>

    <!-- header section ends-->

    <!-- search form  -->

    <form action="index.php?page=search" method="POST">
        <input type="text" placeholder="search here..." name="tukhoa" id="search-box">
        <input type="submit" name="timkiem" for="search-box" id="search-submit" style="padding:20px;"></input>
        <i class="fas fa-times" id="close"></i>
    </form>

    <!-- home section starts  -->

    <section class="home2" id="home2">
        <div class="home-infor">
            <div class="home-title">monday - friday 10-23 | saturday 14-02</div>
            <div class="home-p">42 village St, New York</div>
            <div class="home-footer">willing to serve</div>
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
    <form method="GET" action="cart.php">
        <section class="about" id="about">
            <?php
        if(isset($_GET["id"])){
            $id = $_GET["id"];
            $sqlDetailPro = "SELECT * FROM tbl_product WHERE pro_id=$id";
            $resultDetailPro =  mysqli_query($conn, $sqlDetailPro) ;
            $rowProDetail = mysqli_fetch_row($resultDetailPro);
            // var_dump($rowProDetail);
            // die();
    ?>
            <h3 class="sub-heading">$ <?php echo number_format($rowProDetail[4],2,",","."); ?> </h3>
            <h1 class="heading"> <?php echo $rowProDetail[1]; ?> </h1>

            <div class="row">
                <div class="image">
                    <img style="height: 500px;" src="images/<?php echo $rowProDetail[3]; ?>"
                        alt="<?php echo $rowProDetail[1] ;?>">
                </div>

                <div class="content">
                    <h3>details</h3>
                    <p><?php echo $rowProDetail[5]; ?></p>
                    <div class="icons-container">
                        <div class="icons">
                            <i class="fas fa-shipping-fast"></i>
                            <span>free delivery</span>
                        </div>
                        <div class="icons">
                            <i class="fas fa-dollar-sign"></i>
                            <span>easy payments</span>
                        </div>
                        <div class="icons">
                            <i class="fas fa-headset"></i>
                            <span>24/7 service</span>
                        </div>
                    </div>
                    <div class="form-row">
                        <label for="number">Amount</label>
                        <input style="border: 1px solid black;" type="number" name="quantity" id="number"
                            placeholder="Enter Your Number" step="1" min="1" value=1>
                        <input type="hidden" name="id" value="<?php echo $rowProDetail[0] ?>">
                    </div>
                    <input class="btn btn-primary" type="submit" value="add to cart">
                </div>

            </div>
            <?php } ?>
        </section>
    </form>
    <!-- menu section ends -->

    <!-- review section starts  -->

    <section class="review" id="review">

        <h3 class="sub-heading"> customer's review </h3>
        <h1 class="heading"> what they say </h1>

        <div class="swiper-container review-slider">

            <div class="swiper-wrapper">

                <div class="swiper-slide slide">
                    <i class="fas fa-quote-right"></i>
                    <div class="user">
                        <img src="images/pic-1.png" alt="">
                        <div class="user-info">
                            <h3>john deo</h3>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                            </div>
                        </div>
                    </div>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit fugiat consequuntur repellendus
                        aperiam deserunt nihil, corporis fugit voluptatibus voluptate totam neque illo placeat eius quis
                        laborum aspernatur quibusdam. Ipsum, magni.</p>
                </div>

                <div class="swiper-slide slide">
                    <i class="fas fa-quote-right"></i>
                    <div class="user">
                        <img src="images/pic-2.png" alt="">
                        <div class="user-info">
                            <h3>john deo</h3>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                            </div>
                        </div>
                    </div>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit fugiat consequuntur repellendus
                        aperiam deserunt nihil, corporis fugit voluptatibus voluptate totam neque illo placeat eius quis
                        laborum aspernatur quibusdam. Ipsum, magni.</p>
                </div>

                <div class="swiper-slide slide">
                    <i class="fas fa-quote-right"></i>
                    <div class="user">
                        <img src="images/pic-3.png" alt="">
                        <div class="user-info">
                            <h3>john deo</h3>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                            </div>
                        </div>
                    </div>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit fugiat consequuntur repellendus
                        aperiam deserunt nihil, corporis fugit voluptatibus voluptate totam neque illo placeat eius quis
                        laborum aspernatur quibusdam. Ipsum, magni.</p>
                </div>

                <div class="swiper-slide slide">
                    <i class="fas fa-quote-right"></i>
                    <div class="user">
                        <img src="images/pic-4.png" alt="">
                        <div class="user-info">
                            <h3>john deo</h3>
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                            </div>
                        </div>
                    </div>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit fugiat consequuntur repellendus
                        aperiam deserunt nihil, corporis fugit voluptatibus voluptate totam neque illo placeat eius quis
                        laborum aspernatur quibusdam. Ipsum, magni.</p>
                </div>

            </div>

        </div>

    </section>


    <!-- order section starts  -->

    <section class="order" id="order">

        <h3 class="sub-heading"> order now </h3>
        <h1 class="heading"> free and fast </h1>

        <form action="">

            <div class="inputBox">
                <div class="input">
                    <span>your name</span>
                    <input type="text" placeholder="enter your name">
                </div>
                <div class="input">
                    <span>your number</span>
                    <input type="number" placeholder="enter your number">
                </div>
            </div>
            <div class="inputBox">
                <div class="input">
                    <span>your order</span>
                    <input type="text" placeholder="enter food name">
                </div>
                <div class="input">
                    <span>additional food</span>
                    <input type="test" placeholder="extra with food">
                </div>
            </div>
            <div class="inputBox">
                <div class="input">
                    <span>how much</span>
                    <input type="number" placeholder="how many orders">
                </div>
                <div class="input">
                    <span>date and time</span>
                    <input type="datetime-local">
                </div>
            </div>
            <div class="inputBox">
                <div class="input">
                    <span>your address</span>
                    <textarea name="" placeholder="enter your address" id="" cols="30" rows="10"></textarea>
                </div>
                <div class="input">
                    <span>your message</span>
                    <textarea name="" placeholder="enter your message" id="" cols="30" rows="10"></textarea>
                </div>
            </div>

            <input type="submit" value="order now" class="btn">

        </form>

    </section>

    <!-- order section ends -->

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
    <div class="loader-container">
        <img src="images/loader.gif" alt="">
    </div>

    <!-- Modal -->
    <div class="modal modal-js">
        <div class="modal-container">
            <p class="modal-header">search</p>
            <form action="" method="GET" class="modal-body">
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
                    <button class="modal-footer-button"><a>Close <i class="ti-close"></i></a></button>
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