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
                    $sql = "DELETE FROM tbl_user WHERE `user_id` = $id";
                    $query = mysqli_query($conn,$sql);
                }
        ?> -->
        <div class="table-responsive">
            <table class="table table-striped jambo_table bulk_action">
                <thead>
                    <tr class="headings">
                        <th class="column-title">Tên người dùng</th>
                        <th class="column-title">Email</th>
                        <th class="column-title">Loại</th>
                        <th class="column-title">Số điện thoại</th>
                        <th class="column-title">Địa chỉ</th>
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
                        $sqlSelect = "SELECT * FROM tbl_user";
                        $result = mysqli_query($conn, $sqlSelect) or die("Error");
                        if (mysqli_num_rows($result) > 0) {
                            $i=0;
                            while($row = mysqli_fetch_assoc($result)) {
                                $i++;
                    ?>
                    <tr class="even pointer">

                        <td class=" "><?php echo $row["name"]; ?></td>
                        <td class=" "><?php echo $row["email"]; ?></td>
                        <td class=" "><?php echo $row["user_type"]; ?></td>
                        <td class=" "><?php echo $row["phone"]; ?></td>
                        <td class=" "><?php echo $row["address"]; ?></td>
                        <td class=" "><?php if($row["status4"] == 1) {
                            echo "Active";
                        }else{
                            echo "No active";
                        } ?></td>

                        <td>
                            <a href="index.php?page=update_user&id=<?php echo $row["user_id"]; ?>"><i
                                    class="fa fa-pencil-square-o"></i> Cập nhật</a>
                            <a href="index.php?page=manager&id=<?php echo $row["user_id"]; ?>&del=1"
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