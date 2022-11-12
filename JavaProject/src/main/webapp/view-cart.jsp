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

<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="./fontawesome-free-6.0.0-web/css/all.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="./themify-icons/themify-icons.css">

<!-- header section starts      -->

<%@include file="header.jsp"%>

<!-- header section ends-->

<section style="margin-top: 80px;" class="jumbotron text-center">
	<div class="container">
		<h1 class="jumbotron-heading">Shop cart</h1>
	</div>
</section>

<div class="container mb-4">
	<div class="row">
		<div class="col-12">
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">STT</th>
							<th scope="col">Image</th>
							<th scope="col">Name</th>
							<th scope="col">Quantity</th>
							<th scope="col" class="">Price</th>
							<th scope="col" class="text-right">Total Price</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:set var="total" value="0"></c:set>
						<c:forEach var="o" items="${sessionScope.cart}">
							<c:set var="total"
								value="${total + o.product.price * o.quantity }"></c:set>
							<tr>
								<td>${o.product.pro_id}</td>
								<td><img src="images/${o.product.images}" alt=""
									width="100px"></td>
								<td>${o.product.pro_name}</td>
								<td>
									<form action="AddCart" method="POST">
										<input type="hidden" name="action" value="update"> <input
											type="hidden" name="id" value="${o.product.pro_id}">
										<input style="width: 50%; padding: 5px; border: 1px solid;"
											type="number" name="quantity" value="${o.quantity}" min="1">
										<button
											style="background-color: #f44336; border: none; color: white; padding: 5px; margin-left: 5px;"
											type="submit">Update</button>
									</form>
								</td>
								<td>$${o.product.price}</td>
								<td class="text-right">$${o.product.price * o.quantity}</td>
								<td class="text-right"><a style="margin-bottom: 60px;"
									href="Deleteitem?id=${o.product.pro_id}" class="btn btn-danger"
									onclick="return confirm('Are you sure you want to delete this item?');">Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td>Total Bill</td>
							<td colspan="4">$${total}</td>
							<td>
								<center>
									<a style="margin-left: 50px" href="index.jsp"
										class="btn btn-info">Continue to shop</a>
									<center>
							</td>

							<td><a href="Deletecart" class="btn btn-danger"
								onclick="return confirm('Are you sure you want to delete all this item?');">Delete
									all</a></td>
						</tr>
						<tr>
							<td>
								<center>
									<a href="check-out.jsp" class="btn btn-info">Check out</a>
									<center>
							</td>
						</tr>
					</tfoot>
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