package controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.huashan.database.DataBase;
import org.huashan.entity.Commodity;
import org.huashan.entity.Order;
import org.huashan.entity.Order.Status;
import org.huashan.entity.User;

/**
 * Servlet implementation class BillServlet
 */
@WebServlet("/BillServlet")
public class BillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BillServlet() {
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
		List<Commodity> commodities = dataBase.getUserCart(user.getUsername());
		if(commodities.size()==0)
		{
			response.sendRedirect("MyOrder.jsp");
			return;
		}
		dataBase.deleteUserCart(user.getUsername());
		Order order = new Order();
		order.commodities = commodities;
		order.buy_date = new java.sql.Date(new java.util.Date().getTime());
		order.status= Status.等待发货;
		order.u_id = user.getUsername();
		order.u_address = request.getParameter("u_address");
		order.u_Phone = request.getParameter("u_phone");
		order.u_name = request.getParameter("u_name");
		dataBase.insertOneOrder(order);
		response.sendRedirect("MyOrder.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
