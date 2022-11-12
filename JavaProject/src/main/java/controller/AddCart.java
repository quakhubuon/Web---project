package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Item;
import dao.Product;
import dao.ProductDAO;

/**
 * Servlet implementation class AddCart
 */
@WebServlet("/AddCart")
public class AddCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddCart() {
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
		PrintWriter out = response.getWriter();

		ProductDAO productDAO = new ProductDAO();
		HttpSession session = request.getSession();

		String id = request.getParameter("id");
		Product product = productDAO.find(id);

		int quantity;
		if (request.getParameter("quantity") != null) {
			quantity = Integer.parseInt(request.getParameter("quantity"));
		} else {
			quantity = 1;
		}

		if (session.getAttribute("cart") == null) {
			List<Item> cart = new ArrayList<Item>();
			cart.add(new Item(product, quantity));
			session.setAttribute("cart", cart);
		} else {
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			boolean check = false;
			for (Item item : cart) {
				if (item.getProduct().getPro_id() == product.getPro_id()) {
					item.setQuantity(item.getQuantity() + quantity);
					check = true;
				}
			}
			if (check == false) {
				Item item = new Item();
				item.setProduct(product);
				item.setQuantity(quantity);
				cart.add(item);
			}
		}
		request.getRequestDispatcher("view-cart.jsp").forward(request, response);
	}

	protected void doGetAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();

		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		ProductDAO productDAO = new ProductDAO();
		String id = request.getParameter("id");
		Product product = productDAO.find(id);
		int quantity;
		if (request.getParameter("quantity") != null) {
			quantity = Integer.parseInt(request.getParameter("quantity"));
		} else {
			quantity = 1;
		}

		if (session.getAttribute("cart") == null) {
			List<Item> cart = new ArrayList<Item>();
			cart.add(new Item(product, quantity));
			session.setAttribute("cart", cart);
		} else {
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			boolean check = false;
			for (Item item : cart) {
				if (item.getProduct().getPro_id() == product.getPro_id()) {
					item.setQuantity(quantity);
					check = true;
				}
			}
			if (check == false) {
				Item item = new Item();
				item.setProduct(product);
				item.setQuantity(quantity);
				cart.add(item);
			}
		}
		request.getRequestDispatcher("view-cart.jsp").forward(request, response);

	}

}
