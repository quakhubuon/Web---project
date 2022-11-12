<%@ page import="dao.OrderDAO"%>
<%@ page import="dao.Order"%>
<%@ page import="dao.DetailDAO"%>
<%@ page import="dao.Detail"%>
<%@ page import="dao.UserDAO"%>
<%@ page import="dao.User"%>
<%@ page import="dao.ProductDAO"%>
<%@ page import="dao.Product"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String id = request.getParameter("id");

OrderDAO orderDAO = new OrderDAO();
Order order = orderDAO.Infor(id);

UserDAO userDAO = new UserDAO();
List<User> users = userDAO.selectAllUser();

DetailDAO detailDAO = new DetailDAO();
List<Detail> details = detailDAO.selectDetail(id);

ProductDAO productDAO = new ProductDAO();
List<Product> products = productDAO.selectAllProduct();

double price = orderDAO.total_price(id);
%>
<div class="x_panel">
	<div class="x_title">
		<h2>Customer's information</h2>
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
		<form class="form-label-left input_mask">
			<%
			if (!users.isEmpty()) {
				for (User u : users) {
			%>

			<c:if test="<%=order.getUser_id() == u.getUser_id()%>">
				<div class="form-group row">
					<label class="col-form-label col-md-3 col-sm-3 ">Name of
						customer: <%=u.getName()%>
					</label>
				</div>
			</c:if>


			<c:if test="<%=order.getUser_id() == u.getUser_id()%>">
				<div class="form-group row">
					<label class="col-form-label col-md-3 col-sm-3 ">Phone: <%=u.getPhone()%>
					</label>
				</div>
			</c:if>


			<c:if test="<%=order.getUser_id() == u.getUser_id()%>">
				<div class="form-group row">
					<label class="col-form-label col-md-3 col-sm-3 ">Address: <%=u.getAddress()%>
					</label>
				</div>
			</c:if>

			<%
			}
			}
			%>

			<div class="form-group row">
				<label class="col-form-label col-md-3 col-sm-3 ">Note: <%=order.getNote()%>
				</label>
			</div>

			<div class="form-group row">
				<label class="col-form-label col-md-3 col-sm-3 ">Date
					created: <%=order.getCreated()%>
				</label>
			</div>

			<div class="form-group row">
				<label class="col-form-label col-md-3 col-sm-3 ">Status: <c:if
						test="<%=order.getStatus3() == 0%>">unprocessed</c:if> <c:if
						test="<%=order.getStatus3() == 1%>">processing</c:if> <c:if
						test="<%=order.getStatus3() == 2%>">processed</c:if> <c:if
						test="<%=order.getStatus3() == 3%>">delivered</c:if>
				</label>
			</div>
		</form>

	</div>
</div>


<div class="x_panel">
	<div class="x_title">
		<h2>Detail of order</h2>
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

		<table class="table table-bordered">
			<thead>
				<tr>
					<th>No</th>
					<th>Name of product</th>
					<th>Image</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Total price</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (!details.isEmpty()) {
					for (Detail d : details) {
				%>
				<tr>
					<th scope="row"><%=d.getDetail_id()%></th>
					<%
					if (!products.isEmpty()) {
						for (Product p : products) {
					%>

					<c:if test="<%=d.getPro_id() == p.getPro_id()%>">
						<td><%=p.getPro_name()%></td>
						<td><img style="width: 100px"
							src="../images/<%=p.getImages()%>"></td>
					</c:if>
					<%
					}
					}
					%>
					<td><%=d.getQuanity()%></td>
					<td><%=d.getPrice()%></td>
					<td><%=d.getQuanity() * d.getPrice()%></td>
				</tr>
				<%
				}
				}
				%>

			</tbody>
			<tfoot>
				<tr class="bg-white">
					<td colspan="12">
						<center>
							<span style="color: black;">Total bill: $<%= price %></span>
						</center>
					</td>
				</tr>
			</tfoot>
		</table>
		<form action="updateStatus" method="POST">
			<div style="margin-top: 20px" class="form-group row">
				<div class="col-md-2 col-sm-2 ">
					<select name="status" class="form-control">
						<option value="0">-- Choose status --</option>
						<option value="0">unprocessed</option>
						<option value="1">processing</option>
						<option value="2">processed</option>
						<option value="3">delivered</option>
						<option value="4">destroy</option>
					</select>
				</div>
			</div>
			<input type="hidden" name="id" value="<%= id %>">
			<button type="submit" class="btn btn-success">Update</button>
		</form>
	</div>
</div>