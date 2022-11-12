<header>

        <a href="#" class="logo"><i class="fa-solid fa-mug-hot"></i>
           Npp.
        </a>

        <ul class="navbar">
            <li><a class="active" href="index.php">home</a></li>
            <li><a href="#menu">menu <i class="fa-solid fa-caret-down"></i></a>
                <ul class="sub-nav">
                    <?php
                    $sqlSelect = "SELECT * FROM tbl_category WHERE `status` = 1";
                    $resultCat = mysqli_query($conn, $sqlSelect) or die("Error");
                    if (mysqli_num_rows($resultCat) > 0) {
                        while($rowCat = mysqli_fetch_assoc($resultCat)) {
                ?>
                    <li>
                        <a href="product.php?id=<?php echo $rowCat["cat_id"] ?>"><?php echo $rowCat["cat_name"] ?></a>
                    </li>
                    <?php  }}  ?>
                </ul>
            </li>
            <li><a href="#review1">picture</a></li>
            <li><a href="order.php">history</a></li>
        </ul>
        
        <div class="icons">
            <i class="fas fa-bars" id="menu-bars"></i>
            <i class="fas fa-search buy-js" id="search-icon"></i>
            <a href="profile.php" class="fas fa-user"></a>
            <?php 
                if(isset($_SESSION["user"])){
                    echo '<span style="font-size:13px; color: #192a56; font-weight: 900px";font-family: Helvetica, Arial, sans-serif;>'."Welcome, " .$_SESSION["user"]["name"].'</span>';
                }
            ?>
            <a href="logout.php" class="fa-solid fa-right-from-bracket"></a>
            <a href="view-cart.php" class="fas fa-shopping-cart"></a>
            <p id="cart"><?php echo count($cart) ?></p>
        </div>

    </header>