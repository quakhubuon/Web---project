<?php
    $sql_category = "SELECT * FROM tbl_category";
    $query_category = mysqli_query($conn,$sql_category);

    if(isset($_POST["addNew"])){
        $pro_name = $_POST["pro_name"];

        $image = $_FILES["image"]["name"];
        $image_tmp = $_FILES["image"]["tmp_name"];

        $price = $_POST["price"];
        $quantity= $_POST["quantity"];
        $cat_id= $_POST["cat_id"];
        $description = $_POST["description"];
        $status = isset($_POST['status2'])?1:0;
        $date_create = date('Y-m-d H:i:s');

        $sql = "INSERT INTO tbl_product (pro_name,cat_id,images,price,quantity,description,status2,date_create)
                VALUES ('$pro_name','$cat_id','$image','$price','$quantity','$description','$status','$date_create')";
        $query = mysqli_query($conn,$sql);
        move_uploaded_file($image_tmp, 'images/'.$image);
}
?>

<div class="row">
    <div class="col-md-8 md-offset-2 ">
        <div class="x_panel">
            <div class="x_title">
                <h2>Thêm mới sản phẩm</small></h2>
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                            aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="#">Settings 1</a>
                            <a class="dropdown-item" href="#">Settings 2</a>
                        </div>
                    </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <br>
                <form class="form-label-left input_mask" method="post" enctype="multipart/form-data">
                    <div class="col-md-6 col-sm-6  form-group has-feedback">
                        <input type="text" class="form-control" id="pro_name" name="pro_name"
                            placeholder="Tên sản phẩm">
                    </div>

                    <div class="col-md-6 col-sm-6  form-group has-feedback">
                        <?php 
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
                        </select>

                    </div>

                    <div class="col-md-12 col-sm-6  form-group has-feedback">
                        <label for="image">Ảnh sản phẩm</label>
                        <br>
                        <input type="file" name="image" id="image">
                    </div>

                    <div class="col-md-6 col-sm-6  form-group has-feedback">
                        <input type="text" class="form-control" name="price" id="price" placeholder="Giá sản phẩm">
                    </div>

                    <div class="col-md-6 col-sm-6  form-group has-feedback">
                        <input type="text" class="form-control" name="quantity" id="quantity" placeholder="Số lượng">
                    </div>

                    <div class="col-md-12 col-sm-12  form-group has-feedback">
                        <input type="text" class="form-control" id="description" name="description"
                            placeholder="Mô tả">
                    </div>

                    <div class="col-md-12 col-sm-6  form-group has-feedback">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="1" name="status2" id="status2"> Ẩn / Hiện
                            </label>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-md-9 col-sm-9  offset-md-3">
                            <a href="index.php"><button type="button" class="btn btn-primary">Cancel</button></a>
                            <button class="btn btn-primary" type="reset">Reset</button>
                            <button type="submit" class="btn btn-success" name="addNew">Submit</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>

    </div>
</div>