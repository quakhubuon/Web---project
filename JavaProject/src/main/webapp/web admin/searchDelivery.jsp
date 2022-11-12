<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="dao.OrderDAO"%>
<%@ page import="dao.Order"%>
<%@ page import="dao.UserDAO"%>
<%@ page import="dao.User"%>
<%@ page import="java.util.List"%>
<%
	OrderDAO orderDAO = new OrderDAO();
	String delivery = request.getParameter("date_delivery");
	List<Order> orders = orderDAO.find(delivery);

	UserDAO userDAO = new UserDAO();
	List<User> users = userDAO.selectAllUser();

	request.setAttribute("userS", users);
	request.setAttribute("orderS", orders);
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
							<h2>List of order</h2>
							<ul class="nav navbar-right panel_toolbox">
								<li><a class="collapse-link"><i
										class="fa fa-chevron-up"></i></a></li>
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
							<div class="table-responsive">
								<table class="table table-striped jambo_table bulk_action">
									<thead>
										<tr class="headings">
											<th class="column-title">Order id</th>
											<th class="column-title">Name of customer</th>
											<th class="column-title">Total bill</th>
											<th class="column-title">Note</th>
											<th class="column-title">Phone</th>
											<th class="column-title">Address</th>
											<th class="column-title">Date created</th>
											<th class="column-title">Date delivery</th>
											<th class="column-title">Status</th>
											<th>#</th>
											</th>
											<th class="bulk-actions" colspan="7"><a class="antoo"
												style="color: #fff; font-weight: 500;">Bulk Actions ( <span
													class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
											</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach var="o" items="${orderS}">
											<tr class="even pointer">
												<td class="a-center ">${o.order_id}</td>

												<c:forEach var="u" items="${userS}">
													<c:if test="${u.user_id == o.user_id}">
														<td class=" ">${u.name}</td>
													</c:if>
												</c:forEach>

												<td class=" ">${o.total_price}</td>
												<td class=" ">${o.note}</td>
												<td class=" ">${o.phone}</td>
												<td class=" ">${o.address}</td>
												<td class=" ">${o.created}</td>
												<td class=" ">${o.date_delivery}</td>
												<td class=" "><c:if test="${o.status3 == 0}">unprocessed</c:if>
													<c:if test="${o.status3 == 1}">processing</c:if> <c:if
														test="${o.status3 == 2}">processed</c:if> <c:if
														test="${o.status3 == 3}">delivered</c:if> <c:if
														test="${o.status3 == 4}">destroy</c:if></td>

												<td><a
													href="/JavaProject/web%20admin/index.jsp?page=detail&id=${o.order_id}"><i
														class="fa fa-pencil-square-o"></i> Detail</a> <a
													href="deleteOrder?id=${o.order_id}"
													onclick="return confirm('Are you sure you want to delete this item?');"><i
														class="fa fa-trash-o"></i> Delete</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
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