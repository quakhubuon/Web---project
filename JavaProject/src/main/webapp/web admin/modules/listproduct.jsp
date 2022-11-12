<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="dao.ProductDAO"%>
<%@ page import="dao.Product"%>
<%@ page import="dao.CategoryDAO"%>
<%@ page import="dao.Category"%>
<%@ page import="java.util.List"%>
<%
ProductDAO productDAO = new ProductDAO();
List<Product> products = productDAO.selectAllProduct();

CategoryDAO categoryDAO = new CategoryDAO();
List<Category> categorys = categoryDAO.selectAllCategory();
%>
<div class="x_panel">
	<div class="x_title">
		<h2>List of product</h2>
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
						<th class="column-title">#</th>
						<th class="column-title">Name of product</th>
						<th class="column-title">Image</th>
						<th class="column-title">Price</th>
						<th class="column-title">Description</th>
						<th class="column-title">Date create</th>
						<th class="column-title">Quantity</th>
						<th class="column-title">Category</th>
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
					if (!products.isEmpty()) {
						for (Product p : products) {
					%>
					<tr class="even pointer">
						<td class="a-center "><%=p.getPro_id()%></td>
						<td class=" "><%=p.getPro_name()%></td>
						<td class=" "><img src="../images/<%= p.getImages() %>" style="width: 100px"></td>
						<td class=" ">$<%=p.getPrice()%>
						</td>
						<td class=" "><%=p.getDescription()%></td>
						<td class=" "><%=p.getDate_create()%></td>
						<td class="a-right a-right "><%=p.getQuantity()%></td>
						<%
							if (!categorys.isEmpty()) {
								for (Category c : categorys) {
						%>
						<c:if test="<%= p.getCat_id() == c.getCat_id() %>"><td class=" "><%= c.getCat_name() %></td></c:if>
						<%
						}
						}
						%>
						<td>
							<c:if test="<%=p.getStatus2() == 1%>">Current</c:if>
							<c:if test="<%=p.getStatus2() == 0%>">Hide</c:if>
						</td>
						<td><a href="updatePro?id=<%=p.getPro_id()%>"><i
								class="fa fa-pencil-square-o"></i></a> <a onclick="return confirm('Are you sure you want to delete?')"
							href="deletePro?id=<%=p.getPro_id()%>"><i
								class="fa fa-trash"></i></a></td>
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