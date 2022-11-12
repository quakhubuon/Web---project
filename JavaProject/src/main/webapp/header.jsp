<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="dao.CategoryDAO"%>
<%@ page import="dao.Category"%>
<%@ page import="dao.User"%>
<%@ page import="java.util.List"%>
<%
CategoryDAO categoryDAO = new CategoryDAO();
List<Category> categorys = categoryDAO.selectAllCategory1();
%>

<header>

	<a href="#" class="logo"><i class="fa-solid fa-mug-hot"></i> Npp. </a>

	<ul class="navbar">
		<li><a class="active" href="index.jsp">home</a></li>
		<li><a href="#menu">menu <i class="fa-solid fa-caret-down"></i></a>
			<ul class="sub-nav">
				<%
				if (!categorys.isEmpty()) {
					for (Category c : categorys) {
				%>
				<li><a href="product.jsp?id=<%=c.getCat_id()%>"><%=c.getCat_name()%></a>
				</li>
				<%
				}
				}
				%>
			</ul></li>
		<li><a href="#review1">picture</a></li>
		<%
		User u2;
		if (session.getAttribute("logUser") != null) {

			u2 = (User) session.getAttribute("logUser");
		%>
			<li><a href="order.jsp?id=<%= u2.getUser_id() %>">history</a></li>
		<%
		}
		%>
		
		<%
		if (session.getAttribute("logUser") == null) {
		%>
		<li><a href="login.jsp">login</a></li>
		<%
		}
		%>
		<li>
			<form action="searchname.jsp" method="GET">
				<input style="border: 1px solid #ccc; padding:10px; border-radius: 30px; text-indent: 10px" type="text" name="tukhoa" placeholder="Enter product...">
				<input style="padding:10px; border-radius: 30px" type="submit" value="search">
			</form>
		</li>
	</ul>
	
	<div class="icons">
		<i class="fas fa-bars" id="menu-bars"></i> <i
			class="fas fa-search buy-js" id="search-icon"></i>
		<%
		User u;
		if (session.getAttribute("logUser") != null) {

			u = (User) session.getAttribute("logUser");
		%>
		<a href="#" class="fas fa-user"></a> Welcome,
		<%=u.getName()%>
		<%
		}
		%>


		<%
		if (session.getAttribute("logUser") != null) {
		%>
		<a href="logoutU" class="fa-solid fa-right-from-bracket"></a>
		<%
		}
		%>
		<a href="view-cart.jsp" class="fas fa-shopping-cart"></a>
		<p id="cart">${cart.size()}</p>
	</div>

</header>

