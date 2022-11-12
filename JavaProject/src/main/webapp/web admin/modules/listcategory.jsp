<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="dao.CategoryDAO"%>
<%@ page import="dao.Category"%>
<%@ page import="java.util.List"%>

<%
CategoryDAO categoryDAO = new CategoryDAO();
List<Category> categorys = categoryDAO.selectAllCategory();
%>

<div class="cold-md-6 col-sm-6">
	<div class="x_panel">
		<div class="x_title">
			<h2>List of category</h2>
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
						<th>#</th>
						<th>Name of category</th>
						<th>Status</th>
						<th>Date create</th>
						<th>#</th>
					</tr>
				</thead>
				<tbody>
					<%
					if (!categorys.isEmpty()) {
						for (Category c : categorys) {
					%>
					<tr>
						<th scope="row">
							<%= c.getCat_id() %>
						</th>
						<td>
							<%= c.getCat_name() %>
						</td>
						<td>
							<c:if test="<%= c.getStatus() == 1 %>">Current</c:if>
							<c:if test="<%= c.getStatus() == 0 %>">Hide</c:if>
						</td>
						<td>
							<%= c.getDate_create() %>
						</td>
						<td><a href="update?id=<%= c.getCat_id() %>" class="btn btn-info">Update</a>
							<a onclick="return confirm('Are you sure you want to delete?')"
							href="delete?id=<%= c.getCat_id() %>" class="btn btn-danger">Delete</a>
						</td>
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