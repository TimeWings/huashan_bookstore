package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.huashan.database.DataBase;
import org.huashan.entity.Order;
import org.huashan.entity.Order.Status;
import org.huashan.entity.User;

/**
 * Servlet implementation class ShipServlet
 */
@WebServlet("/ShipServlet")
public class ShipServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShipServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if( user == null || user.is_admin == false)
		{
			response.sendRedirect("loginAndregister.jsp");
			return;
		}
		String o_id = request.getParameter("o_id");
		DataBase dataBase = DataBase.getInstance();
		Order order = dataBase.getOneOrder(o_id);
		if(order.status == Status.等待发货)
			order.status = Status.订单配送中;
		order.ship_date = new java.sql.Date(new java.util.Date().getTime());
		dataBase.updateOneOrder(order);
		response.sendRedirect("manager.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
