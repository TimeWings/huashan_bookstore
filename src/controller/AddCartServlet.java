package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.huashan.database.DataBase;

/**
 * Servlet implementation class AddCartServlet
 */
@WebServlet("/AddCartServlet")
public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		if(request.getSession().getAttribute("user")==null)
		{
			response.sendRedirect("loginAndregister.jsp");
			return;
		}
		DataBase dataBase = DataBase.getInstance();
		String u_id = request.getParameter("u_id");
		String c_id = request.getParameter("c_id");
		if(u_id==null || c_id==null || u_id.equals(""))
		{
			response.sendRedirect("loginAndregister.jsp");
			return;
		}
		dataBase.addUserCart(u_id, Integer.parseInt(c_id), 1);
		response.sendRedirect("onebook.jsp?id="+c_id);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
