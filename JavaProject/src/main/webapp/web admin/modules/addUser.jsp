
<div class="x_panel">
    <div class="x_title">
        <h2>Add user</h2>
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
        <form action="insertUser" method="POST" id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left"
            novalidate="">

            <div class="item form-group">
                <label class="col-form-label col-md-3 col-sm-3 label-align" for="first-name">Name of user <span
                        class="required">*</span>
                </label>
                <div class="col-md-6 col-sm-6 ">
                    <input type="text" id="first-name" required="required" class="form-control " name="name">
                </div>
            </div>
            <div class="item form-group">
                <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Email <span
                        class="required">*</span>
                </label>
                <div class="col-md-6 col-sm-6 ">
                    <input type="text" id="last-name" required="required" class="form-control" name="email">
                </div>
            </div>
            <div class="item form-group">
                <label for="middle-name" class="col-form-label col-md-3 col-sm-3 label-align">password</label>
                <div class="col-md-6 col-sm-6 ">
                    <input id="middle-name" class="form-control" type="password" required="required" name="password">
                </div>
            </div>
            <div class="item form-group">
                <label for="middle-name" class="col-form-label col-md-3 col-sm-3 label-align">re-password</label>
                <div class="col-md-6 col-sm-6 ">
                    <input id="middle-name" class="form-control" type="password" required="required" name="cpassword">
                </div>
            </div>

            <div class="item form-group">
                <label for="middle-name" class="col-form-label col-md-3 col-sm-3 label-align">Role</label>
                <div class="col-md-6 col-sm-6  form-group has-feedback">
                    <select class="form-control" id="cat_id" name="gender">
                        <option value="">-- Choose role --</option>
                        <option value="user">user</option>
                        <option value="admin">admin</option>
                    </select>
                </div>
            </div>

            <div class="item form-group">
                <label class="col-form-label col-md-3 col-sm-3 label-align" for="first-name">Phone <span
                        class="required"></span>
                </label>
                <div class="col-md-6 col-sm-6 ">
                    <input type="text" id="first-name" class="form-control " name="phone">
                </div>
            </div>
            <div class="item form-group">
                <label class="col-form-label col-md-3 col-sm-3 label-align" for="first-name">Address <span
                        class="required"></span>
                </label>
                <div class="col-md-6 col-sm-6 ">
                    <input type="text" id="first-name" class="form-control " name="address">
                </div>
            </div>
            <div class="item form-group">
                <label for="middle-name" class="col-form-label col-md-3 col-sm-3 label-align">Role</label>
                <div class="col-md-6 col-sm-6  form-group has-feedback">
                    <select class="form-control" name="status4">
                        <option value="">-- Choose status --</option>
                        <option value="0">lock</option>
                        <option value="1">open</option>
                    </select>
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
