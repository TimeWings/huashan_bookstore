package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.huashan.database.DataBase;
import org.huashan.entity.User;

/**
 * Servlet implementation class ChangeCart
 */
@WebServlet("/ChangeCartServlet")
public class ChangeCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if( user == null)
		{
			response.sendRedirect("loginAndregister.jsp");
			return;
		}
		DataBase dataBase = DataBase.getInstance();
		int c_id = Integer.parseInt(request.getParameter("c_id"));
		int count = Integer.parseInt(request.getParameter("count"));
		dataBase.updateUserCart(c_id,user.getUsername(), count);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
