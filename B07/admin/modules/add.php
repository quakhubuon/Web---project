<?php

    if(isset($_POST["addNew"])){
        $name = $_POST["name"];
        $email = $_POST["email"];
        $pass = md5($_POST["password"]);
        $cpass = md5($_POST["cpassword"]);
        $user_type = $_POST["gender"];
        $phone = $_POST["phone"];
        $address = $_POST["address"];
        $status4 = isset($_POST["status4"])?1:0;

        $select = "SELECT * FROM tbl_user WHERE email = '$email' AND password = '$pass';";
        $query = mysqli_query($conn, $select);

        if(mysqli_num_rows($query) > 0) {
            $error[] = 'user already exist!';
        }
        else {
            if($pass != $cpass)
            {
                $error[] = 'password not matched!';
            }
            else{
                $insert = "INSERT INTO tbl_user(name, email, password, user_type, phone, address, status4) VALUES('$name','$email','$pass','$user_type','$phone','$address','$status4')";
                mysqli_query($conn, $insert);
            }
        }
    };
?>



<div class="x_panel">
    <div class="x_title">
        <h2>Thêm mới người dùng</h2>
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
        <form method="POST" id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left"
            novalidate="">

            <div class="item form-group">
                <label class="col-form-label col-md-3 col-sm-3 label-align" for="first-name">Tên người dùng <span
                        class="required">*</span>
                </label>
                <div class="col-md-6 col-sm-6 ">
                    <input type="text" id="first-name" required="required" class="form-control " name="name">
                </div>
            </div>
            <div class="item form-group">
                <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Địa chỉ email <span
                        class="required">*</span>
                </label>
                <div class="col-md-6 col-sm-6 ">
                    <input type="text" id="last-name" required="required" class="form-control" name="email">
                </div>
            </div>
            <div class="item form-group">
                <label for="middle-name" class="col-form-label col-md-3 col-sm-3 label-align">Mật khẩu</label>
                <div class="col-md-6 col-sm-6 ">
                    <input id="middle-name" class="form-control" type="password" required="required" name="password">
                </div>
            </div>
            <div class="item form-group">
                <label for="middle-name" class="col-form-label col-md-3 col-sm-3 label-align">Nhập lại mật khẩu</label>
                <div class="col-md-6 col-sm-6 ">
                    <input id="middle-name" class="form-control" type="password" required="required" name="cpassword">
                </div>
            </div>

            <div class="item form-group">
                <label for="middle-name" class="col-form-label col-md-3 col-sm-3 label-align">Danh mục</label>
                <div class="col-md-6 col-sm-6  form-group has-feedback">
                    <select class="form-control" id="cat_id" name="gender">
                        <option value="">-- Chọn danh mục --</option>
                        <option value="user">user</option>
                        <option value="admin">admin</option>
                    </select>
                </div>
            </div>

            <div class="item form-group">
                <label class="col-form-label col-md-3 col-sm-3 label-align" for="first-name">Số điện thoại <span
                        class="required"></span>
                </label>
                <div class="col-md-6 col-sm-6 ">
                    <input type="text" id="first-name" class="form-control " name="phone">
                </div>
            </div>
            <div class="item form-group">
                <label class="col-form-label col-md-3 col-sm-3 label-align" for="first-name">Địa chỉ <span
                        class="required"></span>
                </label>
                <div class="col-md-6 col-sm-6 ">
                    <input type="text" id="first-name" class="form-control " name="address">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-form-label col-md-3 col-sm-3 label-align">Trạng thái</label>

                <div class="col-md-9 col-sm-9 ">
                    <div class="checkbox">
                        <label>
                            <input style="margin-top: 10px" type="checkbox" value="1" name="status4" id="status4"> Khóa
                            / Mở
                        </label>
                    </div>
                </div>
            </div>

            <div class="ln_solid"></div>
            <div class="item form-group">
                <div class="col-md-6 col-sm-6 offset-md-3">
                    <button class="btn btn-primary" type="button">Cancel</button>
                    <button class="btn btn-primary" type="reset">Reset</button>
                    <button name="addNew" type="submit" class="btn btn-success">Submit</button>
                </div>
            </div>

        </form>
    </div>
</div>