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
 * Servlet implementation class insertUser
 */
@WebServlet("/web admin/insertUser")
public class insertUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public insertUser() {
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
		String pass = md5.md5(request.getParameter("password"));
		String cpass = md5.md5(request.getParameter("cpassword"));
		String user_type = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String status4 = request.getParameter("status4");
		int status = Integer.parseInt(status4);

		UserDAO userDAO = new UserDAO();
		User user = userDAO.findU(email, pass);

		if (user != null) {
			out.println("Account have already existed");
		} else {
			if (!pass.equals(cpass)) {
				out.println("Password not matched");
			} else {
				userDAO.save(new User(0, name, email, pass, user_type, phone, address, status));
				out.println("Succesfully!!!");
			}
		}
	}

}
