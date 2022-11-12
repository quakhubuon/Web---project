package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Item;

/**
 * Servlet implementation class Deleteitem
 */
@WebServlet("/Deleteitem")
public class Deleteitem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Deleteitem() {
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
		String id = request.getParameter("id");
		if (id != null) {
			ArrayList<Item> cart = (ArrayList<Item>) request.getSession().getAttribute("cart");
			if (cart != null) {
				for (Item item : cart) {
					if (item.getProduct().getPro_id() == Integer.parseInt(id)) {
						cart.remove(cart.indexOf(item));
						break;
					}
				}
				response.sendRedirect("view-cart.jsp");
			}
		} else {
			response.sendRedirect("view-cart.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
