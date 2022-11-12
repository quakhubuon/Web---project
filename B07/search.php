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

    <header>

        <?php include("header.php") ?>

    </header>

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

    <section class="dishes" id="dishes">

        <h3 class="sub-heading"> our dishes </h3>
        <h1 class="heading"> popular food </h1>

        <div class="box-container">
            <?php
            if(isset($_GET["tukhoa"])){
                $tukhoa = $_GET["tukhoa"];
                $options = "?tukhoa=".$tukhoa;
            }

            else{
                $tukhoa = '';
            }
            $sqlPro = "SELECT * FROM tbl_product WHERE `status2`=1 and tbl_product.pro_name LIKE '%".$tukhoa."%'";

            // $page: xem các sản phẩm ở trang số bao nhiêu
            $page = 1;
            if(isset($_GET["p"])){
                $page=$_GET["p"];
            }
            //số lượng sản phẩm mỗi trang
            $productsperpage=3;
            //lấy các sản phẩm bắt đầu từ chỉ số bao nhiêu trong bảng (0 tức là bắt đầu từ bản ghi đầu tiên)
            $from=($page-1)*$productsperpage;
            //lấy tổng số sản phẩm
            $totalProducts = mysqli_query($conn, $sqlPro) or die("Error");
            //tính tổng số trang có đc:
            $totalPages=ceil(mysqli_num_rows($totalProducts)/$productsperpage);

            //lấy các sản phẩm ở trang hiện thời
            $sqlPro .=" LIMIT $from,$productsperpage";
            $resultProHome = mysqli_query($conn, $sqlPro) or die("Error");

            $resultProHome = mysqli_query($conn, $sqlPro) or die("Error");
            if (mysqli_num_rows($resultProHome) > 0) {
                while($rowProHome = mysqli_fetch_assoc($resultProHome)) {
        ?>
            <div class="box">
                <a href="#" class="fas fa-heart"></a>
                <a href="detail.php?&id=<?php echo $rowProHome["pro_id"] ?>" class="fas fa-eye" target="_blank"></a>
                <img src="images/<?php echo $rowProHome["images"]; ?>" alt="<?php echo $rowProHome ["pro_name"] ?>">
                <h3><?php echo $rowProHome ["pro_name"] ?></h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <span>$<?php echo number_format($rowProHome ["price"],2,",","."); ?></span>
                <a href="cart.php?id=<?php echo $rowProHome["pro_id"] ?>" class="btn">add to cart</a>
            </div>
            <?php  }}  ?>
        </div>
        <section id="pagination">
            <?php for($i=1; $i<=$totalPages; $i++):?>
            <a class="page-item" href="search.php<?=$options?>&p=<?=$i?>"><?=$i?></a>
            <?php endfor;?>
        </section>
    </section>

    <!-- about section starts  -->

    <section class="about" id="about">

        <h3 class="sub-heading">about us</h3>
        <h1 class="heading">why choose us?</h1>

        <div class="row">

            <div class="image">
                <img src="images/logo.jpg" alt="">
            </div>

            <div class="content">
                <h3>best coofee in the country</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
                    Dolore, sequi corrupti corporis quaerat voluptatem ipsam neque
                    labore modi autem, saepe numquam quod reprehenderit rem? Tempora
                    aut soluta odio corporis nihil!</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                    Aperiam, nemo. Sit porro illo eos cumque deleniti iste alias, eum
                    natus.</p>
                <div class="icons-container">
                    <div class="icons">
                        <i class="fas fa-shipping-fast"></i> <span>free delivery</span>
                    </div>
                    <div class="icons">
                        <i class="fas fa-dollar-sign"></i> <span>easy payments</span>
                    </div>
                    <div class="icons">
                        <i class="fas fa-headset"></i> <span>24/7 service</span>
                    </div>
                </div>
                <a href="#" class="btn">learn more</a>
            </div>

        </div>

    </section>

    <!-- about section ends -->

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
                    <button class="modal-footer-button"><a>Close X </a></button>
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