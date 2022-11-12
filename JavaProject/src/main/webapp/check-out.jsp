<%@ page import="dao.User"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style2.css">
<link rel="stylesheet" href="./fontawesome-free-6.0.0-web/css/all.css">

<link rel="stylesheet" href="./themify-icons/themify-icons.css">
<style>
	
		body {
	margin-top: 100px;
	font-family: Arial;
	font-size: 17px;
	padding: 8px;
}

* {
	box-sizing: border-box;
}

.row {
	display: -ms-flexbox;
	/* IE10 */
	display: flex;
	-ms-flex-wrap: wrap;
	/* IE10 */
	flex-wrap: wrap;
	margin: 0 -16px;
}

.col-25 {
	-ms-flex: 25%;
	/* IE10 */
	flex: 25%;
}

.col-50 {
	-ms-flex: 50%;
	/* IE10 */
	flex: 50%;
}

.col-75 {
	-ms-flex: 75%;
	/* IE10 */
	flex: 75%;
}

.col-25, .col-50, .col-75 {
	padding: 0 16px;
}


.container {
	width: 800px;
	margin-left: 350px;
	background-color: #f2f2f2;
	padding: 5px 20px 15px 20px;
	border: 1px solid lightgrey;
	border-radius: 3px;
}

.check-out {
	width: 100%;
	margin-bottom: 20px;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

label {
	margin-bottom: 10px;
	display: block;
}

.icon-container {
	margin-bottom: 20px;
	padding: 7px 0;
	font-size: 24px;
}

.btn {
	background-color: #04AA6D;
	color: white;
	padding: 12px;
	margin: 10px 0;
	border: none;
	width: 100%;
	border-radius: 3px;
	cursor: pointer;
	font-size: 17px;
}

.btn:hover {
	background-color: #45a049;
}

a {
	color: none;
}

hr {
	border: 1px solid lightgrey;
}

span.price {
	float: right;
	color: grey;
}

</style>

</head>

<body>

	<!-- header section starts      -->

	<%@include file="header.jsp"%>

	<!-- header section ends-->

	<script language="javascript">
    function enableDisable(num, textBox) {
        if (num == true) {
            document.getElementById(textBox).disabled = false;
            document.getElementById(textBox).focus() = false;
        } else {
            document.getElementById(textBox).disabled = true;
            document.getElementById(textBox).focus() = true;
        }
    }
    </script>

	<form action="insertOrder" method="POST">
		<%
		User user;
		if (session.getAttribute("logUser") != null) {
			user = (User) session.getAttribute("logUser");
		%>
		<div id="check" class="row">
			<div class="col-75">
				<div class="container">
					<form>
						<div class="row">
							<div class="col-50">
								<h3>Billing Address</h3>

								<label for="fname"><i class="fa fa-user"></i> Full Name</label>
								<input type="text" id="fname" name="name" class="check-out"
									value="<%=user.getName()%>"> 
									
								<label for="email"><i class="fa fa-envelope"></i> Email</label> 
								<input class="check-out" type="text" id="email" name="email" value="<%=user.getEmail()%>" pattern="[A-Za-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}" > 
								
								<label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
								<input class="check-out" type="text" id="adr" name="address" value="<%=user.getAddress()%>"> 
									
								<label><input type="checkbox" id="checkBox" name="checkBox" onclick="enableDisable(this.checked, 'textBox')"> Shipping to new address</label> 
								
								<label style="margin-top: 30px" for="adr"><i class="fa fa-address-card-o"></i> New address</label> 
								<input class="check-out" name="newaddress" type="text" id="textBox" disabled> 
								
								<label for="adr"> Phone</label> 
								<input type="text" id="adr" class="check-out" name="phone" value="<%=user.getPhone()%>" pattern="^[0-9]{10,12}$" required> 
								
								<label for="adr"> Note</label> 
								<input class="check-out" type="text" id="note" name="note"> 
									
								<label for="adr"> Payment</label> 
								<select name="payment" style="width: 200px;" class="form-select"
									aria-label="Disabled select example" required>
									<option value="COD">COD</option>
								</select> <input class="check-out" type="hidden" id="adr" name="user_id"
									value="<%=user.getUser_id()%>">
							</div>

						</div>

						<input type="submit" class="btn bg-info" value="checkout">
					</form>
				</div>
			</div>
			<div class="col-25">
				<div class="container">
					<c:set var="total" value="0"></c:set>
					<c:forEach var="o" items="${sessionScope.cart}">
						<c:set var="total"
							value="${total + o.product.price * o.quantity }"></c:set>
						<p>
							${o.product.pro_name} <span class="price">$${o.product.price
								* o.quantity}</span>
						</p>

					</c:forEach>
					<hr>
					<p>
						<input type="hidden" name="total" value="${total}"> Total
						<span class="price" style="color: black"><b>$${total}</b></span>
					</p>
				</div>
			</div>
		</div>
		<%
		} else {
		%>

	</form>
	<div class="alert alert-danger">
		<center>
			Please login!!! <a href="login.jsp?action=check-out" title="">Login</a>
		</center>
	</div>
	<%
	}
	%>



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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="js/script.js"></script>
	<script src="js/cart.js"></script>
	<script src="js/jquery-3.6.0.js"></script>
</body>

</html>