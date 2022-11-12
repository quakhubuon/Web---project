<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="dao.OrderDAO"%>
<%@ page import="dao.Order"%>
<%@ page import="dao.UserDAO"%>
<%@ page import="dao.User"%>
<%@ page import="java.util.List"%>
<%
OrderDAO orderDAO = new OrderDAO();
List<Order> orders = orderDAO.selectAllOrderA();

UserDAO userDAO = new UserDAO();
List<User> users = userDAO.selectAllUser();
%>
<div class="x_panel">
	<div class="x_title">
		<h2>Search date delivery</h2>
		<ul class="nav navbar-right panel_toolbox">
			<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
			</li>
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
		<form action="searchDelivery.jsp" method="POST">
			<div class="item form-group">
				<label class="col-form-label col-md-3 col-sm-3 label-align"
					for="last-name">Date delivery: <span class="required"></span>
				</label>
				<div class="col-md-6 col-sm-6 ">
					<input name="date_delivery" class="date-picker form-control"
						placeholder="dd-mm-yyyy" type="date" onfocus="this.type='date'"
						onmouseover="this.type='date'" onclick="this.type='date'"
						onblur="this.type='text'" onmouseout="timeFunctionLong(this)">
				</div>
			</div>

			<div class="ln_solid"></div>
			<div class="item form-group">
				<div class="col-md-6 col-sm-6 offset-md-3">
					<button class="btn btn-primary" type="reset">Reset</button>
					<button type="submit" name="submit" class="btn btn-success">Submit</button>
				</div>
			</div>

		</form>
	</div>
</div>
<div class="x_panel">
	<div class="x_title">
		<h2>List of order</h2>
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

					<%
					if (!orders.isEmpty()) {
						for (Order o : orders) {
					%>
					<tr class="even pointer">
						<td class="a-center "><%=o.getOrder_id()%></td>
						<%
						if (!users.isEmpty()) {
							for (User u : users) {
						%>
						<c:if test="<%=o.getUser_id() == u.getUser_id()%>">
							<td class=" "><%=u.getName()%></td>
						</c:if>
						<%
						}
						}
						%>
						<td class=" "><%=o.getTotal_price()%></td>
						<td class=" "><%=o.getNote()%></td>
						<td class=" "><%=o.getPhone()%></td>
						<td class=" "><%=o.getAddress()%></td>
						<td class=" "><%=o.getCreated()%></td>
						<td class=" "><%=o.getDate_delivery()%></td>
						<td class=" "><c:if test="<%=o.getStatus3() == 0%>">unprocessed</c:if>
							<c:if test="<%=o.getStatus3() == 1%>">processing</c:if> <c:if
								test="<%=o.getStatus3() == 2%>">processed</c:if> <c:if
								test="<%=o.getStatus3() == 3%>">delivered</c:if> <c:if
								test="<%=o.getStatus3() == 4%>">destroy</c:if></td>

						<td><a
							href="/JavaProject/web%20admin/index.jsp?page=detail&id=<%=o.getOrder_id()%>"><i
								class="fa fa-pencil-square-o"></i> Detail</a> <a
							href="deleteOrder?id=<%=o.getOrder_id()%>"
							onclick="return confirm('Are you sure you want to delete this item?');"><i
								class="fa fa-trash-o"></i> Delete</a></td>
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