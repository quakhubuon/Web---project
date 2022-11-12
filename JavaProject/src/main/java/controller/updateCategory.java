package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Locale.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;

/**
 * Servlet implementation class updateCategory
 */
@WebServlet("/web admin/update")
public class updateCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");

		CategoryDAO categoryDAO = new CategoryDAO();
		dao.Category category = categoryDAO.find(id);

		request.setAttribute("item", category);
		request.getRequestDispatcher("updateCategory.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		PrintWriter out = response.getWriter();
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
		Date date = new Date(System.currentTimeMillis());
		
		String id = request.getParameter("cat_id");
		String cat_name = request.getParameter("cat_name");
		String status = request.getParameter("status");
		int status2;
		if(status!=null) {
			status2 = Integer.parseInt(status);
		}else {
			status2 = 0;
		}
	
		
		CategoryDAO categoryDAO = new CategoryDAO();
		categoryDAO.update(cat_name, status2, date, id);
		
		out.print("Update Successfully!!!");
		
	}

}
