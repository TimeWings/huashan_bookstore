package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.huashan.database.DataBase;
import org.huashan.entity.Order;
import org.huashan.entity.User;
import org.huashan.entity.Order.Status;

/**
 * Servlet implementation class UserCancelServlet
 */
@WebServlet("/UserCancelServlet")
public class UserCancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCancelServlet() {
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
		String o_id = request.getParameter("o_id");
		DataBase dataBase = DataBase.getInstance();
		Order order = dataBase.getOneOrder(o_id);
		if(order.status == Status.等待发货)
			order.status = Status.订单已取消;
		dataBase.updateOneOrder(order);
		response.sendRedirect("orderdetail.jsp?o_id="+order.id);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
