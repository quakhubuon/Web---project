<?php
    
    if(isset($_POST["submit"])) {

        $id = $_POST["order_id"];
        $date = date('Y-m-d', strtotime($_POST["date_delivery"]));
        
        // echo"$id <> $date";
        
        $sql = "UPDATE `tbl_orders` SET `date_delivery` = '$date' WHERE `tbl_orders`.`order_id` = $id;";
        $query = mysqli_query($conn, $sql);
    }

?>





<div class="x_panel">
    <div class="x_title">
        <h2>Thêm ngày giao hàng</h2>
        <ul class="nav navbar-right panel_toolbox">
            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                    aria-expanded="false"><i class="fa fa-wrench"></i></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a class="dropdown-item" href="#">Settings 1</a>
                    </li>
                    <li><a class="dropdown-item" href="#">Settings 2</a>
                    </li>
                </ul>
            </li>
            <li><a class="close-link"><i class="fa fa-close"></i></a>
            </li>
        </ul>
        <div class="clearfix"></div>
    </div>
    <div class="x_content">
        <br>
        <form action="" method="POST">

            <div class="item form-group">
                <label name="address" class="col-form-label col-md-3 col-sm-3 label-align" for="first-name">Mã đơn hàng: <span
                        class="required"></span>
                </label>
                <div class="col-md-6 col-sm-6 ">
                    <input type="number" id="first-name " name="order_id" class="form-control ">
                </div>
            </div>
            <div class="item form-group">
                <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Ngày giao:
                    <span class="required"></span>
                </label>
                <div class="col-md-6 col-sm-6 ">
                    <input name="date_delivery" class="date-picker form-control" placeholder="dd-mm-yyyy" type="date"
                        onfocus="this.type='date'" onmouseover="this.type='date'" onclick="this.type='date'"
                        onblur="this.type='text'" onmouseout="timeFunctionLong(this)">
                </div>
            </div>

            <div class="ln_solid"></div>
            <div class="item form-group">
                <div class="col-md-6 col-sm-6 offset-md-3">
                    <button class="btn btn-primary" type="reset">Reset</button>
                    <button type="submit" name="submit" class="btn btn-success">Submit</button>
                </div>
            </div>

        </form>
    </div>
</div>



<div class="x_panel">
    <div class="x_title">
        <h2>Danh sách đơn hàng</h2>
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
        <!-- <?php
                if(isset($_GET["id"]) && isset($_GET["del"])){
                    $id = $_GET["id"];
                    $sql = "DELETE FROM tbl_orders WHERE order_id = $id";
                    $query = mysqli_query($conn,$sql);
                    header("location: index.php?page=order");
                }
        ?> -->
        <div class="table-responsive">
            <table class="table table-striped jambo_table bulk_action">
                <thead>
                    <tr class="headings">
                        <th class="column-title">Mã đơn hàng</th>
                        <th class="column-title">Tên khách hàng</th>
                        <th class="column-title">Tổng tiền</th>
                        <th class="column-title">Ngày đặt</th>
                        <th class="column-title">Địa chỉ</th>
                        <th class="column-title">Ghi chú</th>
                        <th class="column-title">Ngày giao hàng</th>
                        <th class="column-title">Trạng thái</th>
                        <th>#</th>
                        </th>
                        <th class="bulk-actions" colspan="7">
                            <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span
                                    class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                        </th>
                    </tr>
                </thead>

                <tbody>
                    <?php 
                        $sqlSelect = "SELECT tbl_orders.*, tbl_user.name FROM tbl_user, tbl_orders WHERE tbl_user.user_id = tbl_orders.user_id";
                        $result = mysqli_query($conn, $sqlSelect) or die("Error");
                        if (mysqli_num_rows($result) > 0) {
                            $i=0;
                            while($row = mysqli_fetch_assoc($result)) {
                                $i++;
                    ?>
                    <tr class="even pointer">
                        <td class="a-center "><?php echo $row["order_id"]; ?></td>
                        <td class=" "><?php echo $row["name"]; ?></td>
                        <td class=" ">$<?php echo number_format(($row["total_price"]),2,",","."); ?> </td>
                        <td class=" "><?php echo $row["created"]; ?></td>
                        <td class=" "><?php echo $row["address"]; ?></td>
                        <td class=" "><?php echo $row["note"]; ?></td>
                        <td class=" "><?php echo $row["date_delivery"]; ?></td>
                        <td class=" ">
                            <?php if($row["status3"] == 0) { ?>
                            chưa xử lý
                            <?php }elseif($row["status3"] == 1) { ?>
                            đang xử lý
                            <?php }elseif($row["status3"] == 2) { ?>
                            đang giao hàng
                            <?php }elseif($row["status3"] == 3) { ?>
                            đã giao hàng
                            <?php }else { ?>
                            hủy
                            <?php } ?>
                        </td>

                        <td>
                            <a href="index.php?page=detail&id=<?php echo $row["order_id"]; ?>"><i
                                    class="fa fa-pencil-square-o"></i> Chi tiết</a>
                            <a href="index.php?page=order&id=<?php echo $row["order_id"]; ?>&del=1"
                                onclick="return confirm('Are you sure you want to delete this item?');"><i
                                    class="fa fa-trash-o"></i> Xóa</a>
                        </td>
                    </tr>
                    <?php } }?>
                </tbody>
            </table>
        </div>


    </div>
</div>