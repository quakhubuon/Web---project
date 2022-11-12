<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="dao.ProductDAO"%>
<%@ page import="dao.Product"%>
<%@ page import="java.util.List"%>
<%
	String name = request.getParameter("tukhoa");
	String cat_id = request.getParameter("cat_id");
	String start_price = request.getParameter("start_price");
	double price1 = Double.parseDouble(start_price);
	String end_price = request.getParameter("end_price");
	double price2 = Double.parseDouble(end_price);
	
	ProductDAO productDAO = new ProductDAO();
	String indexPage = request.getParameter("index");
	if (indexPage == null) {
		indexPage = "1";
	}
	int index = Integer.parseInt(indexPage);
	int count = productDAO.getTotalProductAdvance(name, cat_id, price1, price2);
	int endPage = count / 3;
	if (count % 3 != 0) {
		endPage++;
	}
	List<Product> list = productDAO.selectAllProductAdvance(name, cat_id, price1, price2, index);
	request.setAttribute("listA", list);
	request.setAttribute("endP", endPage);
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Complete Responsive Food Website Design Tutorial</title>

<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<!-- custom css file link  -->
<link rel="stylesheet" href="css/style.css">

<link rel="stylesheet" href="./fontawesome-free-6.0.0-web/css/all.css">

<link rel="stylesheet" href="./themify-icons/themify-icons.css">

</head>

<body>

	<!-- header section starts      -->

	<%@include file="header.jsp"%>

	<!-- header section ends-->

	<!-- search form  -->

	<form action="index.php?page=search" method="POST">
		<input type="text" placeholder="search here..." name="tukhoa"
			id="search-box"> <input type="submit" name="timkiem"
			for="search-box" id="search-submit" style="padding: 20px;"></input> <i
			class="fas fa-times" id="close"></i>
	</form>

	<!-- home section starts  -->

	<section class="home2" id="home2">
		<div class="home-infor">
			<div class="home-title">monday - friday 10-23 | saturday 14-02</div>
			<div class="home-p">42 village St, New York</div>
			<div class="home-footer">willing to serve</div>
		</div>
	</section>

	<!-- home section ends -->

	<section class="dishes" id="dishes">

		<h3 class="sub-heading">our dishes</h3>
		<h1 class="heading">popular food</h1>

		<div class="box-container">
			<c:forEach var="o" items="${listA}">
				<div class="box">
					<a href="#" class="fas fa-heart"></a> <a
						href="detail.jsp?id=${o.pro_id}" class="fas fa-eye"></a> <img
						src="images/${o.images}" alt="${o.pro_name}">
					<h3>${o.pro_name}</h3>
					<div class="stars">
						<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star-half-alt"></i>
					</div>
					<span>$${o.price}</span> <a href="AddCart?&id=${o.pro_id}"
						class="btn">add to cart</a>
				</div>
			</c:forEach>
		</div>

		<div id="pagination">
			<c:forEach begin="1" end="${endP}" var="i">
				<c:if test=""></c:if>
				<a class="page-item"
					href="search.jsp?tukhoa=<%=name%>&cat_id=<%=cat_id%>&start_price=<%=start_price%>&end_price=<%=end_price%>&index=${i}">${i}</a>
			</c:forEach>
		</div>
	</section>

	<!-- about section starts  -->

	<section class="about" id="about">

		<h3 class="sub-heading">about us</h3>
		<h1 class="heading">why choose us?</h1>

		<div class="row">

			<div class="image">
				<img src="images/logo.jpg" alt="">
			</div>

			<div class="content">
				<h3>best coofee in the country</h3>
				<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
					Dolore, sequi corrupti corporis quaerat voluptatem ipsam neque
					labore modi autem, saepe numquam quod reprehenderit rem? Tempora
					aut soluta odio corporis nihil!</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Aperiam, nemo. Sit porro illo eos cumque deleniti iste alias, eum
					natus.</p>
				<div class="icons-container">
					<div class="icons">
						<i class="fas fa-shipping-fast"></i> <span>free delivery</span>
					</div>
					<div class="icons">
						<i class="fas fa-dollar-sign"></i> <span>easy payments</span>
					</div>
					<div class="icons">
						<i class="fas fa-headset"></i> <span>24/7 service</span>
					</div>
				</div>
				<a href="#" class="btn">learn more</a>
			</div>

		</div>

	</section>

	<!-- about section ends -->

	<section class="review" id="review">

		<h3 class="sub-heading">customer's review</h3>
		<h1 class="heading">what they say</h1>

		<div class="swiper-container review-slider">

			<div class="swiper-wrapper">

				<div class="swiper-slide slide">
					<i class="fas fa-quote-right"></i>
					<div class="user">
						<img src="images/pic-1.png" alt="">
						<div class="user-info">
							<h3>john deo</h3>
							<div class="stars">
								<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star-half-alt"></i>
							</div>
						</div>
					</div>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit
						fugiat consequuntur repellendus aperiam deserunt nihil, corporis
						fugit voluptatibus voluptate totam neque illo placeat eius quis
						laborum aspernatur quibusdam. Ipsum, magni.</p>
				</div>

				<div class="swiper-slide slide">
					<i class="fas fa-quote-right"></i>
					<div class="user">
						<img src="images/pic-2.png" alt="">
						<div class="user-info">
							<h3>john deo</h3>
							<div class="stars">
								<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star-half-alt"></i>
							</div>
						</div>
					</div>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit
						fugiat consequuntur repellendus aperiam deserunt nihil, corporis
						fugit voluptatibus voluptate totam neque illo placeat eius quis
						laborum aspernatur quibusdam. Ipsum, magni.</p>
				</div>

				<div class="swiper-slide slide">
					<i class="fas fa-quote-right"></i>
					<div class="user">
						<img src="images/pic-3.png" alt="">
						<div class="user-info">
							<h3>john deo</h3>
							<div class="stars">
								<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star-half-alt"></i>
							</div>
						</div>
					</div>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit
						fugiat consequuntur repellendus aperiam deserunt nihil, corporis
						fugit voluptatibus voluptate totam neque illo placeat eius quis
						laborum aspernatur quibusdam. Ipsum, magni.</p>
				</div>

				<div class="swiper-slide slide">
					<i class="fas fa-quote-right"></i>
					<div class="user">
						<img src="images/pic-4.png" alt="">
						<div class="user-info">
							<h3>john deo</h3>
							<div class="stars">
								<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star-half-alt"></i>
							</div>
						</div>
					</div>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit
						fugiat consequuntur repellendus aperiam deserunt nihil, corporis
						fugit voluptatibus voluptate totam neque illo placeat eius quis
						laborum aspernatur quibusdam. Ipsum, magni.</p>
				</div>

			</div>

		</div>

	</section>

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

	<!-- footer section ends -->

	<!-- loader part  -->
	<div class="loader-container">
		<img src="images/loader.gif" alt="">
	</div>

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
</body>

</html>