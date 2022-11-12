<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="dao.UserDAO"%>
<%@ page import="dao.User"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	String id = request.getParameter("id");
	UserDAO userDAO = new UserDAO();
	User user = userDAO.find(id);
	request.setAttribute("user", user);
%>

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

					<div class="x_panel">
						<div class="x_title">
							<h2>Add user</h2>
							<ul class="nav navbar-right panel_toolbox">
								<li><a class="collapse-link"><i
										class="fa fa-chevron-up"></i></a></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false"><i class="fa fa-wrench"></i></a>
									<ul class="dropdown-menu" role="menu">
										<li><a class="dropdown-item" href="#">Settings 1</a></li>
										<li><a class="dropdown-item" href="#">Settings 2</a></li>
									</ul></li>
								<li><a class="close-link"><i class="fa fa-close"></i></a></li>
							</ul>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<br>
							<form action="updateUser" method="POST" id="demo-form2"
								data-parsley-validate="" class="form-horizontal form-label-left"
								novalidate="">

								<div class="item form-group">
									<label class="col-form-label col-md-3 col-sm-3 label-align"
										for="first-name">Name of user <span class="required">*</span>
									</label>
									<div class="col-md-6 col-sm-6 ">
										<input type="text" id="first-name" required="required"
											class="form-control " name="name" value="${user.name}">
										<input type="hidden" id="first-name" required="required"
											class="form-control " name="user_id" value="<%= id %>">
									</div>
								</div>
								<div class="item form-group">
									<label class="col-form-label col-md-3 col-sm-3 label-align"
										for="last-name">Email <span class="required">*</span>
									</label>
									<div class="col-md-6 col-sm-6 ">
										<input type="text" id="last-name" required="required"
											class="form-control" name="email" value="${user.email}">
									</div>
								</div>
								<div class="item form-group">
									<label for="middle-name"
										class="col-form-label col-md-3 col-sm-3 label-align">password</label>
									<div class="col-md-6 col-sm-6 ">
										<input id="middle-name" class="form-control" type="password"
											required="required" name="password" value="${user.password}">
									</div>
								</div>
								<div class="item form-group">
									<label for="middle-name"
										class="col-form-label col-md-3 col-sm-3 label-align">re-password</label>
									<div class="col-md-6 col-sm-6 ">
										<input id="middle-name" class="form-control" type="password"
											required="required" name="cpassword" value="${user.password}">
									</div>
								</div>

								<div class="item form-group">
									<label for="middle-name"
										class="col-form-label col-md-3 col-sm-3 label-align">Role</label>
									<div class="col-md-6 col-sm-6  form-group has-feedback">
										<select class="form-control" id="cat_id" name="gender">	
											<c:if test="${user.user_type == 'admin'}">
												<option value="">-- Choose role --</option>
												<option value="user">user</option>
												<option value="admin" selected>admin</option>
											</c:if>
											
											<c:if test="${user.user_type == 'user'}">
												<option value="">-- Choose role --</option>
												<option value="user" selected>user</option>
												<option value="admin">admin</option>
											</c:if>
										</select>
									</div>
								</div>

								<div class="item form-group">
									<label class="col-form-label col-md-3 col-sm-3 label-align"
										for="first-name">Phone <span class="required"></span>
									</label>
									<div class="col-md-6 col-sm-6 ">
										<input type="text" id="first-name" class="form-control "
											name="phone" value="${user.phone}">
									</div>
								</div>
								<div class="item form-group">
									<label class="col-form-label col-md-3 col-sm-3 label-align"
										for="first-name">Address <span class="required"></span>
									</label>
									<div class="col-md-6 col-sm-6 ">
										<input type="text" id="first-name" class="form-control "
											name="address" value="${user.address}">
									</div>
								</div>
								<div class="item form-group">
									<label for="middle-name"
										class="col-form-label col-md-3 col-sm-3 label-align">Role</label>
									<div class="col-md-6 col-sm-6  form-group has-feedback">
										<select class="form-control" name="status4">
											<c:if test="${user.status4 == 0}">
												<option value="">-- Choose status --</option>
												<option value="0" selected >lock</option>
												<option value="1">open</option>
											</c:if>
											
											<c:if test="${user.status4 == 1}">
												<option value="">-- Choose status --</option>
												<option value="0">lock</option>
												<option value="1" selected>open</option>
											</c:if>
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