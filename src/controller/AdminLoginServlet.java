package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.huashan.database.DataBase;
import org.huashan.entity.User;

/**
 * Servlet implementation class LoginCheckServlet
 */
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminLoginServlet()
	{
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html;charset=gb2312");
		DataBase database = DataBase.getInstance();
		PrintWriter out = response.getWriter();	
		String username = request.getParameter("admin_account");
		String password = request.getParameter("admin_password");
		if (database.login(username, password))
		{
			User user = new User(username,password);
			request.getSession().setAttribute("user", user);//如果登录成功就把username对象放到session对象中
			request.getRequestDispatcher("index3.jsp").forward(request, response);
		}
		else
		{
			request.getRequestDispatcher("loginAndregister.jsp").forward(request, response);
		}
	}

}
