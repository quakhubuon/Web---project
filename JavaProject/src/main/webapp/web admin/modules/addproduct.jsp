<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="dao.CategoryDAO"%>
<%@ page import="dao.Category"%>
<%@ page import="java.util.List"%>

<%
CategoryDAO categoryDAO = new CategoryDAO();
List<Category> categorys = categoryDAO.selectAllCategory();
%>
<div class="row">
	<div class="col-md-8 md-offset-2 ">
		<div class="x_panel">
			<div class="x_title">
				<h2>Add new product</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
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
			<br>

			<form action="insertProduct" class="form-label-left input_mask" method="post"
				enctype="multipart/form-data">
				<div class="col-md-6 col-sm-6  form-group has-feedback">
					<input type="text" value="" class="form-control" id="pro_name"
						name="pro_name" placeholder="Name">
				</div>

				<div class="col-md-6 col-sm-6  form-group has-feedback">
					<select class="form-control" id="cat_id" name="cat_id">
						<option value="">-- Category --</option>
						<%
						if (!categorys.isEmpty()) {
							for (Category c : categorys) {
						%>
							<option value="<%= c.getCat_id() %>"><%= c.getCat_name() %></option>
						<%
						}
						}
						%>
					</select>
				</div>

				<div class="col-md-12 col-sm-6  form-group has-feedback">
					<label for="image">Image</label> <br> <input type="file"
						name="image" id="image">
				</div>

				<div class="col-md-6 col-sm-6  form-group has-feedback">
					<input type="text" class="form-control" name="price" id="price"
						placeholder="Price">
				</div>

				<div class="col-md-6 col-sm-6  form-group has-feedback">
					<input type="text" class="form-control" name="quantity"
						id="quantity" placeholder="Quantity">
				</div>

				<div class="col-md-12 col-sm-12  form-group has-feedback">
					<input type="text" class="form-control" id="description"
						name="description" placeholder="Description">
				</div>

				<div class="col-md-6 col-sm-6  form-group has-feedback">
					<select class="form-control" name="status2">
						<option value="">-- Choose status --</option>
						<option value="0">Hide</option>
						<option value="1">Current</option>
					</select>
				</div>

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