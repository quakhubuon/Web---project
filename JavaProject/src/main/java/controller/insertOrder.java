package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Detail;
import dao.DetailDAO;
import dao.Item;
import dao.Order;
import dao.OrderDAO;

/**
 * Servlet implementation class insertOrder
 */
@WebServlet("/insertOrder")
public class insertOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public insertOrder() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();

		int order_id = 0;
		int status3 = 1;

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(System.currentTimeMillis());

		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 7);
		String date2 = dateFormat.format(cal.getTime());

		String total = request.getParameter("total");
		String user_id = request.getParameter("user_id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String note = request.getParameter("note");
		String payment = request.getParameter("payment");

		String address;
		if (request.getParameter("newaddress") != null) {
			address = request.getParameter("newaddress");
		} else {
			address = request.getParameter("address");
		}

		String quantity = request.getParameter("quantity");
		String price = request.getParameter("price");
		String pro_id = request.getParameter("pro_id");

//		out.println(order_id + " " + Integer.parseInt(user_id)+ " " + Double.parseDouble(total)+ " " + note+ " " + phone+ " " + address+ " " + payment+ " " + date+ " " + status3+ " " + date2);

		OrderDAO orderDAO = new OrderDAO();
		Order order = new Order(order_id, Integer.parseInt(user_id), Double.parseDouble(total), note, phone, address,
				payment, date, status3, date2);

		HttpSession session = request.getSession();
		List<Item> cart = (List<Item>) session.getAttribute("cart");

		int detail_id = orderDAO.save(order);

		for (Item item : cart) {
			DetailDAO detailDAO = new DetailDAO();
			detailDAO.save(new Detail(detail_id, item.getProduct().getPro_id(), item.getQuantity(),
					item.getProduct().getPrice()));
		}
		session.removeAttribute("cart");
		response.sendRedirect("index.jsp");
	}

}
