<div class="x_panel">
    <div class="x_title">
        <h2>Lọc đơn hàng</h2>
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
        <form action="index.php?page=order_search" method="POST">

            <div class="item form-group">
                <label name="address" class="col-form-label col-md-3 col-sm-3 label-align" for="first-name">Lọc đơn theo địa chỉ: <span
                        class="required"></span>
                </label>
                <div class="col-md-6 col-sm-6 ">
                    <input type="text" id="first-name " name="address" class="form-control ">
                </div>
            </div>
            <div class="item form-group">
                <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Lọc đơn theo ngày giao:
                    <span class="required"></span>
                </label>
                <div class="col-md-6 col-sm-6 ">
                    <input name="created" class="date-picker form-control" placeholder="dd-mm-yyyy" type="date"
                        onfocus="this.type='date'" onmouseover="this.type='date'" onclick="this.type='date'"
                        onblur="this.type='text'" onmouseout="timeFunctionLong(this)">
                </div>
            </div>

            <div class="ln_solid"></div>
            <div class="item form-group">
                <div class="col-md-6 col-sm-6 offset-md-3">
                    <button class="btn btn-primary" type="reset">Reset</button>
                    <button type="submit" class="btn btn-success">Submit</button>
                </div>
            </div>

        </form>
    </div>
</div>


