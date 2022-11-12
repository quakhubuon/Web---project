<div class="x_panel">
    <div class="x_title">
        <h2>Danh sách sản phẩm</h2>
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
        <?php
                if(isset($_GET["id"]) && isset($_GET["del"])){
                    $id = $_GET["id"];
                    $sql = "DELETE FROM tbl_product WHERE pro_id = $id";
                    $query = mysqli_query($conn,$sql);
                    header("location:index.php?page=listproduct");
                }
        ?>
        <div class="table-responsive">
            <table class="table table-striped jambo_table bulk_action">
                <thead>
                    <tr class="headings">
                        <th class="column-title"># </th>
                        <th class="column-title">Tên sản phẩm</th>
                        <th class="column-title">Hình </th>
                        <th class="column-title">Giá </th>
                        <th class="column-title">Mô tả </th>
                        <th class="column-title">Ngày tạo </th>
                        <th class="column-title">Số lượng </th>
                        <th class="column-title">Danh mục </th>
                        <th class="column-title">Trang thái </th>
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
                        $sqlSelect = "SELECT * FROM tbl_product, tbl_category WHERE tbl_product.cat_id = tbl_category.cat_id ";
                        $result = mysqli_query($conn, $sqlSelect) or die("Error");
                        if (mysqli_num_rows($result) > 0) {
                            $i=0;
                            while($row = mysqli_fetch_assoc($result)) {
                                $i++;
                    ?>
                    <tr class="even pointer">
                        <td class="a-center "><?php echo $i; ?></td>
                        <td class=" "><?php echo $row["pro_name"]; ?></td>
                        <td class=" ">
                            <img style="width:100px" src="images/<?php echo $row["images"]; ?>">
                        </td>
                        <td class=" ">$<?php echo number_format(($row["price"]),2,",","."); ?> </td>
                        <td class=" "><?php echo $row["description"]; ?></td>
                        <td class=" "><?php echo date("d-m-Y H:i:s",strtotime($row["date_create"])); ?></td>
                        <td class="a-right a-right "><?php echo $row["quantity"]; ?></td>
                        <td class=" "><?php echo $row["cat_name"]; ?> </td>
                        <td><?php echo ($row["status2"])?"Hiển thị":"Ẩn"; ?></td>
                        <td>
                            <a href="index.php?page=update&id=<?php echo $row["pro_id"]; ?>"><i class="fa fa-pencil-square-o"></i> Sửa</a>
                            <a href="index.php?page=listproduct&id=<?php echo $row["pro_id"]; ?>&del=1" onclick="return confirm('Are you sure you want to delete this item?');"><i class="fa fa-trash-o"></i> Xóa</a>
                        </td>
                    </tr>
                    <?php } }?>
                </tbody>
            </table>
        </div>


    </div>
</div>