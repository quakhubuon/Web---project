<%@page import="dao.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/favicon.ico" type="image/ico" />

<title>Web admin</title>

<!-- Bootstrap -->
<link href="../vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="../vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">

<!-- bootstrap-progressbar -->
<link
	href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- JQVMap -->
<link href="../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet" />
<!-- bootstrap-daterangepicker -->
<link href="../vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="../build/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<!-- sidebar menu -->
			<%@include file="modules/leftMenu.jsp"%>
			<!-- /sidebar menu -->
			<!-- top navigation -->
			<%@include file="modules/topNav.jsp"%>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="row">


					<div class="row">
						<div class="col-md-8 md-offset-2 ">
							<div class="x_panel">
								<div class="x_title">
									<h2>Add new product</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-expanded="false"><i
												class="fa fa-wrench"></i></a>
											<div class="dropdown-menu"
												aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item" href="#">Settings 1</a> <a
													class="dropdown-item" href="#">Settings 2</a>
											</div></li>
										<li><a class="close-link"><i class="fa fa-close"></i></a></li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<br>
								<%
									String pro_id = request.getParameter("id");
								%>
								<form action="updateP" class="form-label-left input_mask"
									method="post" enctype="multipart/form-data">
									
									<div class="col-md-12 col-sm-12  form-group has-feedback">
										<input type="hidden" value="<%=pro_id %>"
											class="form-control" id="description" name="id"
											placeholder="id">
									</div>
									
									<div class="col-md-6 col-sm-6  form-group has-feedback">
										<input type="text" value="${item.pro_name}"
											class="form-control" id="pro_name" name="pro_name"
											placeholder="Name">
									</div>

									<div class="col-md-6 col-sm-6  form-group has-feedback">
										<select class="form-control" id="cat_id" name="cat_id">
											<option value="">-- Category --</option>
											<c:forEach var="detail" items="${listS }">
												<option value="${detail.cat_id}"
													<c:if test="${item.cat_id==detail.cat_id}">selected</c:if> />${detail.cat_name}</option>
											</c:forEach>
										</select>
									</div>

									<div class="col-md-12 col-sm-6  form-group has-feedback">
										<label for="image">Image</label> <br> <input type="file"
											name="image" id="image" value="${item.images}">
									</div>

									<div class="col-md-6 col-sm-6  form-group has-feedback">
										<input type="text" value="${item.price}" class="form-control"
											name="price" id="price" placeholder="Price">
									</div>

									<div class="col-md-6 col-sm-6  form-group has-feedback">
										<input type="text" value="${item.quantity}"
											class="form-control" name="quantity" id="quantity"
											placeholder="Quantity">
									</div>

									<div class="col-md-12 col-sm-12  form-group has-feedback">
										<input type="text" value="${item.description}"
											class="form-control" id="description" name="description"
											placeholder="Description">
									</div>

									<div class="col-md-12 col-sm-6  form-group has-feedback">
										<div class="checkbox">
											<label> 
												<select class="form-control" id="cat_id"
													name="status">
														<option value="">-- Choose status --</option>
														<c:if test="${item.status2==0}">
															<option value="0" selected>Hide</option>
															<option value="1" >Current</option>
														</c:if>
														
														<c:if test="${item.status2==1}">
															<option value="0" >Hide</option>
															<option value="1" selected>Current</option>
														</c:if>
														
												</select>
											</label>
										</div>
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


				</div>
			</div>
			<!-- /page content -->

			<!-- footer content -->
			<footer>
				<div class="pull-right">
					Gentelella - Bootstrap Admin Template by <a
						href="https://colorlib.com">Colorlib</a>
				</div>
				<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
		</div>
	</div>

	<!-- jQuery -->
	<script src="../vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="../vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!-- FastClick -->
	<script src="../vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src="../vendors/nprogress/nprogress.js"></script>
	<!-- Chart.js -->
	<script src="../vendors/Chart.js/dist/Chart.min.js"></script>
	<!-- gauge.js -->
	<script src="../vendors/gauge.js/dist/gauge.min.js"></script>
	<!-- bootstrap-progressbar -->
	<script
		src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script src="../vendors/iCheck/icheck.min.js"></script>
	<!-- Skycons -->
	<script src="../vendors/skycons/skycons.js"></script>
	<!-- Flot -->
	<script src="../vendors/Flot/jquery.flot.js"></script>
	<script src="../vendors/Flot/jquery.flot.pie.js"></script>
	<script src="../vendors/Flot/jquery.flot.time.js"></script>
	<script src="../vendors/Flot/jquery.flot.stack.js"></script>
	<script src="../vendors/Flot/jquery.flot.resize.js"></script>
	<!-- Flot plugins -->
	<script src="../vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
	<script src="../vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
	<script src="../vendors/flot.curvedlines/curvedLines.js"></script>
	<!-- DateJS -->
	<script src="../vendors/DateJS/build/date.js"></script>
	<!-- JQVMap -->
	<script src="../vendors/jqvmap/dist/jquery.vmap.js"></script>
	<script src="../vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
	<script src="../vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script src="../vendors/moment/min/moment.min.js"></script>
	<script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="../build/js/custom.min.js"></script>

</body>

</html>