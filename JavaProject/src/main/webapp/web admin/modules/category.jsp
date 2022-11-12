<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="col-md-6 col-sm-6">
	<div class="x_panel">
		<div class="x_title">
			<h2>Add category</h2>
			<ul class="nav navbar-right panel_toolbox">
				<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"><i
						class="fa fa-wrench"></i></a>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="#">Settings 1</a> <a
							class="dropdown-item" href="#">Settings 2</a>
					</div></li>
				<li><a class="close-link"><i class="fa fa-close"></i></a></li>
			</ul>
			<div class="clearfix"></div>
		</div>
		<div class="x_content">
			<br>
			<form action="insertCategory" class="form-label-left input_mask"
				method="post">
				<div class="form-group row">
					<label class="col-form-label col-md-3 col-sm-3 ">Name of
						category</label>
					<div class="col-md-9 col-sm-9 ">
						<input name="cat_name" type="text" class="form-control"
							placeholder="Default Input">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-form-label col-md-3 col-sm-3 ">Status</label>
					<div class="col-md-9 col-sm-9 ">
						 <select class="form-control" id="cat_id" name="status">
                        <option value="">-- Choose status --</option>
                        <option value="0">Hide</option>
                        <option value="1">Current</option>
                    </select>
					</div>
				</div>
            </div>
				<div class="ln_solid"></div>
				<div class="form-group row">
					<div class="col-md-9 col-sm-9  offset-md-3">
						<a href="index.php"><button type="button"
								class="btn btn-primary">Cancel</button></a>
						<button class="btn btn-primary" type="reset">Reset</button>
						<button type="submit" class="btn btn-success" name="addNew">Submit</button>
					</div>
				</div>

			</form>
		</div>
	</div>
</div>

