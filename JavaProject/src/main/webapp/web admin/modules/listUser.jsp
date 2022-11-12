<%@ page import="dao.UserDAO"%>
<%@ page import="dao.User"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	UserDAO userDAO = new UserDAO();
	List<User> users = userDAO.selectAllUser();
%>
<div class="x_panel">
	<div class="x_title">
		<h2>List of user</h2>
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
						<th class="column-title">User id</th>
						<th class="column-title">Name of user</th>
						<th class="column-title">Email</th>
						<th class="column-title">Password</th>
						<th class="column-title">Role</th>
						<th class="column-title">Phone</th>
						<th class="column-title">Address</th>
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
					if (!users.isEmpty()) {
						for (User u : users) {
					%>
					<tr class="even pointer">

						<td class=" "><%= u.getUser_id() %></td>
						<td class=" "><%= u.getName() %></td>
						<td class=" "><%= u.getEmail() %></td>
						<td class=" "><%= u.getPassword() %></td>
						<td class=" "><%= u.getUser_type() %></td>
						<td class=" "><%= u.getPhone() %></td>
						<td class=" "><%= u.getAddress() %></td>
						<td class=" ">
							<c:if test="<%= u.getStatus4() == 1 %>">open</c:if>
							<c:if test="<%= u.getStatus4() == 0 %>">lock</c:if>
						</td>

						<td><a href="updateUser.jsp?id=<%= u.getUser_id() %>"><i class="fa fa-pencil-square-o"></i>
								Update</a>
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