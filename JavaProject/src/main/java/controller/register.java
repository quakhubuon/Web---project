package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User;
import dao.UserDAO;
import md5.MD5Library;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public register() {
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
		MD5Library md5 = new MD5Library();
		PrintWriter out = response.getWriter();

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = md5.md5(request.getParameter("password"));
		String cpassword = md5.md5(request.getParameter("cpassword"));
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		int user_id = 0;
		int status4 = 1;
		String user_type = "user";

		UserDAO userDAO = new UserDAO();
		dao.User user = userDAO.loginU(email, password);

		if (user != null) {
			out.println("Account have already existed");
		} else {
			if (!password.equals(cpassword)) {
				out.println("Password not matched");
			} else {
				userDAO.save(new User(user_id, name, email, password, user_type, phone, address, status4));
				out.println("Succesfully!!!");
				response.sendRedirect("login.jsp");
			}
		}
	}

}
