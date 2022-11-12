<?php
    if(isset($_GET["id"])){
        
        $order_id = $_GET["id"];
        $order_query = mysqli_query($conn,"SELECT * FROM tbl_orders WHERE order_id = $order_id");
        $order = mysqli_fetch_assoc($order_query);
        
        $user_id = $order["user_id"];
        $user_query = mysqli_query($conn,"SELECT * FROM tbl_user WHERE `user_id` = $user_id");
        $user = mysqli_fetch_assoc($user_query);

        $product = mysqli_query($conn,"SELECT DISTINCT tbl_detail.detail_id, tbl_detail.price, tbl_detail.quantity, tbl_product.images, tbl_product.pro_name FROM tbl_detail, tbl_product, tbl_orders WHERE tbl_detail.pro_id = tbl_product.pro_id AND tbl_detail.detail_id = $order_id ");
        $detail = mysqli_fetch_assoc($product);

        $price = mysqli_query($conn,"SELECT total_price FROM tbl_orders");
        $total_price = mysqli_fetch_assoc($price);
    }

    if(isset($_POST["status"])) {
        $status = $_POST["status"];
        $sql = "UPDATE tbl_orders SET status3 = '$status' WHERE order_id = $order_id ";
        $query = mysqli_query($conn,$sql);
        header('location:index.php?page=order');
    }
?>

<div class="x_panel">
    <div class="x_title">
        <h2>Thông tin khách hàng</h2>
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
        <form class="form-label-left input_mask">

            <div class="form-group row">
                <label class="col-form-label col-md-3 col-sm-3 ">Tên khách hàng: <?php echo $user["name"] ?> </label>
            </div>
            <div class="form-group row">
                <label class="col-form-label col-md-3 col-sm-3 ">Điện thoại: <?php echo $user["phone"] ?> </label>
            </div>
            <div class="form-group row">
                <label class="col-form-label col-md-3 col-sm-3 ">Địa chỉ giao hàng: <?php echo $user["address"] ?>
                </label>
            </div>
            <div class="form-group row">
                <label class="col-form-label col-md-3 col-sm-3 ">Ghi chú: <?php echo $order["note"] ?> </label>
            </div>

            <div class="form-group row">
                <label class="col-form-label col-md-3 col-sm-3 ">Ngày đặt hàng: <?php echo $order["created"] ?> </label>
            </div>

            <div class="form-group row">
                <label class="col-form-label col-md-3 col-sm-3 ">Trạng thái đơn hàng: 
                    <?php if($order["status3"] == 0) { ?> 
                        chưa xử lý
                    <?php }elseif($order["status3"] == 1) { ?> 
                        đang xử lý
                    <?php }elseif($order["status3"] == 2) { ?> 
                        đang giao hàng
                    <?php }elseif($order["status3"] == 3) { ?> 
                        đã giao hàng
                    <?php }else { ?> 
                        hủy
                    <?php } ?>
                </label>
            </div>
        </form>

    </div>
</div>


<div class="x_panel">
    <div class="x_title">
        <h2>Chi tiết đơn hàng</h2>
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
                    <th>STT</th>
                    <th>Tên sản phẩm</th>
                    <th>Ảnh</th>
                    <th>Số lượng</th>
                    <th>Giá</th>
                    <th>Thành tiền</th>
                </tr>
            </thead>
            <tbody>
                <?php $total_price = 0; ?>
                <?php foreach ($product as $key => $value): 
                    $total_price += ($value["price"] * $value["quantity"]);
            ?>
                <tr>
                    <th scope="row"><?php echo $key+1 ?></th>
                    <td><?php echo $value["pro_name"] ?></td>
                    <td><img style="width:100px" src="../images/<?php echo $value["images"]; ?>"></td>
                    <td><?php echo $value["quantity"] ?></td>
                    <td><?php echo $value["price"] ?></td>
                    <td><?php echo number_format(($value["price"] * $value["quantity"]),2,",",".") ?></td>
                </tr>
                <?php endforeach ?>
            </tbody>
            <tfoot>
                <tr class="bg-white">
                    <td colspan="12">
                        <center><span style="color: black;">Tổng tiền:
                                $<?php echo number_format(($total_price),2,",",".") ?></span></center>
                    </td>
                </tr>
            </tfoot>
        </table>
        <form action="" method="post">
            <div style="margin-top: 20px" class="form-group row">
                <div class="col-md-2 col-sm-2 ">
                    <select name="status" class="form-control">
                        <option value="0">Chưa xử lý</option>
                        <option value="1">Đã xử lý</option>
                        <option value="2">Đang giao hàng</option>
                        <option value="3">Đã giao hàng</option>
                        <option value="4">Hủy</option>
                    </select>
                </div>
            </div>
            <button type="submit" class="btn btn-success">Cập nhật</button>
        </form>
    </div>
</div>