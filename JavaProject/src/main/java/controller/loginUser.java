package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import md5.MD5Library;

/**
 * Servlet implementation class loginUser
 */
@WebServlet("/loginUser")
public class loginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginUser() {
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
//		doGet(request, response);
		PrintWriter out = response.getWriter();
		MD5Library md5 = new MD5Library();

		String email = request.getParameter("email");
		String password = md5.md5(request.getParameter("password"));
		String action = request.getParameter("action");

		UserDAO userDAO = new UserDAO();
		dao.User user = userDAO.loginU(email, password);

		if (action != null && user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("logUser", user);
			response.sendRedirect("check-out.jsp");
		} else if (user != null && action == null) {

			HttpSession session = request.getSession();
			session.setAttribute("logUser", user);
			response.sendRedirect("index.jsp");
		} else {
			out.println("Login is failed!!!!");
			response.sendRedirect("login.jsp");
		}
	}

}
