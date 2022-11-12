<?php 

 if(isset($_GET["id"])){
    $id = $_GET["id"];

    $sql = "SELECT * FROM tbl_product WHERE pro_id = $id";
    $qr = mysqli_query($conn,$sql);
    $rows = mysqli_fetch_assoc($qr);

}

    if(isset($_POST["sua"])){
        $pro_name = $_POST["pro_name"];

        if($_FILES["image"]["name"]==""){
            $image = $rows["images"];
        }else{
            $image = $_FILES["image"]["name"];
            $image_tmp = $_FILES["image"]["tmp_name"];
            move_uploaded_file($image_tmp, 'images/'.$image);
        }

        $price = $_POST["price"];
        $quantity= $_POST["quantity"];
        $cat_id= $_POST["cat_id"];
        $description = $_POST["description"];
        $status = isset($_POST['status2'])?1:0;
        $date_create = date('Y-m-d H:i:s');

        $sqlUpdate = "UPDATE tbl_product SET pro_name ='$pro_name',`status2`='$status',date_create='$date_create',images='$image', quantity='$quantity', `description`='$description', price='$price', cat_id='$cat_id' WHERE pro_id=$id";
        mysqli_query($conn,$sqlUpdate);
        header("location:index.php?page=listproduct");
    }
?>

<form class="form-label-left input_mask" method="POST" enctype="multipart/form-data">
    <div class="col-md-6 col-sm-6  form-group has-feedback">
        <input type="text" class="form-control" id="pro_name" name="pro_name" placeholder="Tên sản phẩm"
            value="<?php echo $rows["pro_name"];?>">
    </div>

    <div class="col-md-6 col-sm-6  form-group has-feedback">
        <?php 
            $sqlSelectCat = "SELECT * FROM tbl_category";
            $result = mysqli_query($conn, $sqlSelectCat) or die("Error");
        ?>
        <select class="form-control" id="cat_id" name="cat_id">
            <option value="">-- Chọn danh mục --</option>
            <?php 
                foreach($result as $key => $value) { ?>
            <option value="<?php echo $value["cat_id"] ?>"
                <?php echo (($value["cat_id"] == $rows["cat_id"])? 'selected' : '') ?>><?php echo $value["cat_name"] ?>
            </option>
            <?php } ?>
        </select>

    </div>

    <div class="col-md-12 col-sm-6  form-group has-feedback">
        <label for="image">Ảnh sản phẩm</label>
        <br>
        <input type="file" name="image" id="image" value="<?php echo $rows["images"];?>">
    </div>

    <div class="col-md-6 col-sm-6  form-group has-feedback">
        <input type="text" class="form-control" name="price" id="price" placeholder="Price"
            value="<?php echo number_format(($rows["price"]),2,",",".");?>">
    </div>

    <div class="col-md-6 col-sm-6  form-group has-feedback">
        <input type="text" class="form-control" name="quantity" id="quantity" placeholder="Quantity"
            value="<?php echo $rows["quantity"];?>">
    </div>

    <div class="col-md-12 col-sm-12  form-group has-feedback">
        <input type="text" class="form-control" id="description" name="description" placeholder="Description"
            value="<?php echo $rows["description"];?>">
    </div>

    <div class="col-md-12 col-sm-6  form-group has-feedback">
        <div class="checkbox">
            <label>
                <input type="checkbox" value="1" <?php echo $rows["status2"]?"checked":"" ?> name="status2"
                    id="status2"> Ẩn / Hiện
            </label>
        </div>
    </div>

    <div class="form-group row">
        <div class="col-md-9 col-sm-9  offset-md-3">
            <a href="index.php?page=listproduct"><button type="button" class="btn btn-primary">Cancel</button></a>
            <button class="btn btn-primary" type="reset">Reset</button>
            <button type="submit" class="btn btn-success" name="sua" id="sua">Sửa</button>
        </div>
    </div>

</form>