<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="dao.CategoryDAO"%>
<%@ page import="dao.Category"%>
<%@ page import="java.util.List"%>
<%
CategoryDAO categoryDAOO = new CategoryDAO();
List<Category> categoryss = categoryDAOO.selectAllCategory();
%>
<div class="modal modal-js">
	<div class="modal-container">
		<p class="modal-header">search</p>
		<form action="search.jsp" method="GET" class="modal-body">
			<label style="margin-top: 20px;" for="modal-user-name"
				class="modal-label"> Name </label> <input type="text"
				id="modal-user-name" class="modal-input"
				placeholder="Enter product's name..." name="tukhoa" required="required"> <label
				for="modal-user-name" class="modal-label"> Category </label> <select
				style="width: 200px; height: 20px; border: 1px solid #ccc"
				class="form-control" id="cat_id" name="cat_id" >
				<option value="">-- Select category --</option>
				<%
				if (!categoryss.isEmpty()) {
					for (Category c : categoryss) {
				%>

				<option value="<%=c.getCat_id()%>"><%=c.getCat_name()%></option>
				<%
				}
				}
				%>
			</select> <label for="start_price" class="modal-label"> Price </label>
			<div>
				<input required="required" type="number" id="start_price" style="width: 48%"
					name="start_price" class="modal-input" placeholder="Enter price..."
					value=""> <input required="required" type="number" id="modal-password"
					style="width: 48%; margin-left: 6px" name="end_price"
					class="modal-input" placeholder="Enter price..." value="">
				<div class="  form-group has-feedback"></div>
				<button style="text-transform: uppercase;" id="pay">Submit</button>
		</form>
		<div id="modal-footer">
                <div id="btn">
                    <button class="modal-footer-button"><a>Close X</a></button>
                </div>
            </div>
	</div>
</div>

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