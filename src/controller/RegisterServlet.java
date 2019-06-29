package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
import org.huashan.database.DataBase;
import org.huashan.entity.User;

/**
 * Servlet implementation class LoginCheckServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet()
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
		String new_name = request.getParameter("new_name");
		String new_username = request.getParameter("new_account");
		String new_password = request.getParameter("new_password");
		String email = request.getParameter("email");
		if (database.register(new_name, new_username, new_password))
		{
			User user = new User(new_username, new_password);
			request.getSession().setAttribute("user", user);// 如果登录成功就把username对象放到session对象中
			String brokerIP = "tcp://127.0.0.1:1883";
			String clientId = new_name;
			// 发给订阅了email的客户端;
			String pub_topic = "email";
			// 发送的信息为;
			String msg = "Email:" + email + "\n" + "Name:" + new_name + "\n" + "要发送的邮件信息:" + user.toString();
			if (email != null && email != " ")
			{
				MemoryPersistence persistence = new MemoryPersistence();

				try
				{

					MqttClient sampleClient = new MqttClient(brokerIP, clientId, persistence);
					MqttConnectOptions connOpts = new MqttConnectOptions();
					connOpts.setCleanSession(true);
					// 尝试连接
					System.out.println("Connecting to broker: " + brokerIP);
					sampleClient.connect(connOpts);
					// 提示是否连接成功;
					System.out.println("Connected....已连接");

					// 将内容转为二进制流;
					MqttMessage message = new MqttMessage(msg.getBytes());

					// 选择优先级别;设置优先级别;
					message.setQos(1);

					// 发送主题和信息，publish("主题","信息的二进制").......
					sampleClient.publish(pub_topic, message);

					// 断开连接;
					sampleClient.disconnect();
				}
				catch (MqttException me)
				{
					// 出现异常则处理......
					System.out.println("reason " + me.getReasonCode());
					System.out.println("msg " + me.getMessage());
					System.out.println("loc " + me.getLocalizedMessage());
					System.out.println("cause " + me.getCause());
					System.out.println("excep " + me);
					me.printStackTrace();
				}
				System.out.println("注册成功......");
			}
			response.sendRedirect("index.jsp");
		}
		else
		{
			response.sendRedirect("loginAndregister.jsp");
		}
	}

}
