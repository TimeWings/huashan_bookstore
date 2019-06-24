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
@WebServlet("/LoginCheckServlet")
public class LoginCheckServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginCheckServlet()
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
		String button1 = request.getParameter("login_button");
		String button2 = request.getParameter("register_button");
		PrintWriter out = response.getWriter();	
		if(button1 != null) //登录
		{
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			if (database.login(username, password))
			{
				User user = new User(username,password);
				request.getSession().setAttribute("user", user);//如果登录成功就把username对象放到session对象中
				request.getRequestDispatcher("HomePage.jsp").forward(request, response);
				//out.print("<script>alert('成功!');window.location.href='Index1.jsp'</script>");
			}
			else
			{
				request.getRequestDispatcher("Login.jsp").forward(request, response);
				//out.print("<script>alert('密码错误!');window.location.href='Login.jsp'</script>");
			}
		}
		else if(button2 != null) //注册
		{
			String new_name = request.getParameter("new_name");
			String new_username = request.getParameter("new_username");
			String new_password = request.getParameter("new_password");
			if (database.register(new_username,new_password))
			{
				User user = new User(new_username,new_password);
				request.getSession().setAttribute("user", user);//如果登录成功就把username对象放到session对象中
				request.getRequestDispatcher("HomePage.jsp").forward(request, response);
			}
			else
			{
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
			
		}
	}

}
