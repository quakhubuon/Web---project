<div class="col-md-6 col-sm-6">
    <div class="x_panel">
        <div class="x_title">
            <h2>Thêm mới danh mục</h2>
            <ul class="nav navbar-right panel_toolbox">
                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i
                            class="fa fa-wrench"></i></a>
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
            <?php 
                //ADD
                if($_SERVER["REQUEST_METHOD"] === 'POST'){
                    $cartName = $_POST['cat_name'];
                    $status = isset($_POST['status'])?1:0;
                    $date_create = date('Y-m-d H:i:s');
                    if(isset($_GET["id"]) && isset($_GET["edit"])){
                        $sqlUpdate = "UPDATE tbl_category SET cat_name='$cartName',`status`='$status',date_update='$date_create' WHERE cat_id=".$_GET["id"];
                        mysqli_query($conn,$sqlUpdate);
                        header("location:index.php?page=category");
                    }else{
                        $sql = "INSERT INTO tbl_category (cat_name,`status`,date_create) VALUES ('$cartName','$status','$date_create')";
                        mysqli_query($conn,$sql);
                    }
                }
                //EDITE
                $cat_name="";
                $status = false;
                if(isset($_GET["id"]) && isset($_GET["edit"])){
                    $sqlEdit = "SELECT * FROM tbl_category WHERE cat_id=".$_GET["id"];
                    $resultEdit = mysqli_query($conn, $sqlEdit);
                    $rowEdit = mysqli_fetch_row($resultEdit);
                    // echo "<pre>";
                    // print_r($rowEdit);
                    $cat_name = $rowEdit[1];
                    $status = ($rowEdit[2])?true:false;
                }
                //DELETE
                if(isset($_GET["id"]) && isset($_GET["del"])){
                    $sqlDelete="DELETE FROM tbl_category WHERE cat_id=".$_GET["id"];
                    mysqli_query($conn,$sqlDelete);
                    header("location:index.php?page=category");
                }
            ?>
            <form class="form-label-left input_mask" method="post">
                <div class="form-group row">
                    <label class="col-form-label col-md-3 col-sm-3 ">Tên sản phẩm</label>
                    <div class="col-md-9 col-sm-9 ">
                        <input type="text" class="form-control" value="<?php echo $cat_name; ?>" name="cat_name" id="cat_name"
                            placeholder="Tên danh mục">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-md-3 col-sm-3  control-label">Trạng thái</label>

                    <div class="col-md-9 col-sm-9 ">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="1" <?php echo ($status)?"checked":"" ?> name="status" id="status"> Ẩn / Hiện
                            </label>
                        </div>
                    </div>
                </div>
                <div class="ln_solid"></div>
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

<div class="cold-md-6 col-sm-6">
    <div class="x_panel">
        <div class="x_title">
            <h2>Danh sách danh mục</h2>
            <ul class="nav navbar-right panel_toolbox">
                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i
                            class="fa fa-wrench"></i></a>
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

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Tên danh mục</th>
                        <th>Trạng thái</th>
                        <th>Ngày tạo</th>
                        <th>#</th>
                    </tr>
                </thead>
                <tbody>
                    <?php 
                        $sqlSelect = "SELECT * FROM tbl_category";
                        $result = mysqli_query($conn, $sqlSelect) or die("Error");
                        if (mysqli_num_rows($result) > 0) {
                            $i=0;
                            while($row = mysqli_fetch_assoc($result)) {
                                $i++;
                    ?>
                        <tr>
                            <th scope="row"><?php echo $i; ?></th>
                            <td><?php echo $row["cat_name"]; ?></td>
                            <td><?php echo ($row["status"])?"Hiển thị":"Ẩn"; ?></td>
                            <td><?php echo date("d-m-Y H:i:s",strtotime($row["date_create"])); ?></td>
                            <td>
                                <a href="index.php?page=category&id=<?php echo $row["cat_id"]; ?>&edit=1"><i class="fa fa-pencil-square-o"></i> Sửa</a>
                                <a href="index.php?page=category&id=<?php echo $row["cat_id"]; ?>&del=1" onclick="return confirm('Are you sure you want to delete this item?');"><i class="fa fa-trash-o"></i> Xóa</a>
                            </td>
                    </tr>
                    <?php } }?>
                </tbody>
            </table>

        </div>
    </div>
</div>