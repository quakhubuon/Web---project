
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/cart.css">
<link rel="stylesheet" href="./fontawesome-free-6.0.0-web/css/all.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="./themify-icons/themify-icons.css">
<!-- header section starts      -->

<%@include file="header.jsp"%>
<%@ page import="dao.OrderDAO"%>
<%@ page import="dao.Order"%>
<%@ page import="java.util.List"%>

<!-- header section ends-->
<section style="margin-top: 80px;" class="jumbotron text-center">
	<div class="container">
		<h1 class="jumbotron-heading">History orders</h1>
	</div>
</section>


	<%
		String id = request.getParameter("id");
		int user_id = Integer.parseInt(id);
		OrderDAO orderDAO = new OrderDAO();
		List<Order> orders = orderDAO.selectAllOrder(user_id);
	%>


<div class="container mb-4">
	<div class="row">
		<div class="col-12">
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>

						<tr>
							<th scope="col">Code orders</th>
							<th scope="col">phone</th>
							<th scope="col">address</th>
							<th scope="col">payment</th>
							<th scope="col">created</th>
							<th scope="col">total bill</th>
							<th></th>
						</tr>

					</thead>
					<tbody>
						<%
						if (!orders.isEmpty()) {
							for(Order o : orders) {
						%>
						<tr>
							<td><%= o.getOrder_id() %></td>
							<td><%= o.getPhone() %></td>
							<td><%= o.getAddress() %></td>
							<td><%= o.getPayment() %></td>
							<td><%= o.getCreated() %></td>
							<td><%= o.getTotal_price() %></td>
							<td><a href="order_detail.jsp?id=<%= o.getOrder_id() %>">Detail</a></td>
						</tr>
						<%
						}
						}
						%>

					</tbody>

				</table>
			</div>
		</div>
	</div>
</div>

<!-- Footer -->

<!-- review section ends -->


<!-- footer section starts  -->

<section class="footer">

	<div class="box-container">

		<div class="box">
			<h3>locations</h3>
			<a href="#">india</a> <a href="#">japan</a> <a href="#">russia</a> <a
				href="#">USA</a> <a href="#">france</a>
		</div>

		<div class="box">
			<h3>quick links</h3>
			<a href="#">home</a> <a href="#">dishes</a> <a href="#">about</a> <a
				href="#">menu</a> <a href="#">reivew</a> <a href="#">order</a>
		</div>

		<div class="box">
			<h3>contact info</h3>
			<a href="#">+123-456-7890</a> <a href="#">+111-222-3333</a> <a
				href="#">shaikhanas@gmail.com</a> <a href="#">anasbhai@gmail.com</a>
			<a href="#">mumbai, india - 400104</a>
		</div>

		<div class="box">
			<h3>follow us</h3>
			<a href="#">facebook</a> <a href="#">twitter</a> <a href="#">instagram</a>
			<a href="#">linkedin</a>
		</div>

	</div>

</section>

<%@include file="modal.jsp"%>


<script>
const buytns = document.querySelectorAll('.buy-js');
const modal = document.querySelector('.modal-js');
const modalRed = document.querySelector('.modal-footer-button');

function showTicket() {
    modal.classList.add('open');
}

function removeTicket() {
    modal.classList.remove('open');
}

for (const buybtn of buytns) {
    buybtn.addEventListener('click', showTicket);
}

modalRed.addEventListener('click', removeTicket);
</script>

<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<!-- custom js file link  -->
<script src="js/script.js"></script>
<script src="js/cart.js"></script>