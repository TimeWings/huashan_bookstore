/**
 * 
 */
package org.huashan.database;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.huashan.encrypt.Encrypt;
import org.huashan.entity.*;

/**
 * @author 何俊霖
 *
 */
public class DataBase
{
	final static String driver="com.mysql.jdbc.Driver";
	final static String DBurl = "jdbc:mysql://172.16.34.251:3306/huashan?characterEncoding=utf8&useSSL=false&serverTimezone=UTC";
	final static String DBusername = "root";
	final static String DBpassword = "root";
	
	private static DataBase instance = new DataBase();

    private DataBase() {}

    public static DataBase getInstance() 
    {
        return instance;
    }

    public static void main(String[] args)
    {
    	DataBase dataBase = new DataBase();
    	//dataBase.register("aaa", "123456");
    	//dataBase.login("aaa", "123456");
//        List<Commodity> commodities = dataBase.getAllCommodities();
//        for (Commodity commodity : commodities)
//		{
//			System.out.println(commodity.id+" "+commodity.name);
//		}
    	//Commodity commodity = dataBase.getOneCommodity("1");
    	//System.out.println(commodity.id+" "+commodity.name);
    	//Order order = dataBase.getOneOrder("1");
    	//System.out.println(order.id + " "+order.status+" "+order.commodities.get(0).count);
    	//List<Order> orders = dataBase.getOrdersFromUser("hhhh");
//    	for(int i=0;i<orders.size();i++)
//    	{
//    		System.out.println(orders.get(i).id+" "+orders.get(i).status);
//    	}
    	User user = dataBase.getOneUser("aaa");
    	System.out.println(user.getUsername()+" "+user.getPassword()+" "+user.phone);
    	user.phone = "110";
    	//dataBase.updateOneUser(user);
    	dataBase.changePassword("aaa", "1234567", "123456");
    }
    
    static 
    {
        try 
        {
            Class.forName(driver);
        } catch (ClassNotFoundException e) 
        {
            e.printStackTrace();
        }
    }
    
    public void test()
    {
    	
        try
        {
        	//Class.forName("com.mysql.jdbc.Driver");
    	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    	    {
    	    	String sql = "insert into test(name) values(?)";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                pstmt.setString(1, "666");
                int result = pstmt.executeUpdate();
                System.out.println(result);
            }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
    }
    
    /**
     * 执行update或insert,delete语句
     *@author 何俊霖
     * @param sql
     */
    public void update(String sql)
    {
    	 try
         {
         	//Class.forName("com.mysql.jdbc.Driver");
     	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
     	    {
                 PreparedStatement pstmt = connection.prepareStatement(sql);
                 int count = pstmt.executeUpdate();
                 System.out.println("成功更新"+count+"行");
              }
         }
         catch(SQLException e)
         {
             e.printStackTrace();
             return;
         }
    }
    
    /**
     * 用户注册
     *@author 何俊霖
     * @param username 用户名
     * @param password 原始未加密密码
     * @return 注册是否成功
     */
    public boolean register(String username,String password)
    {
    	
        try
        {
        	//Class.forName("com.mysql.jdbc.Driver");
    	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    	    {
    	    	String sql = "select id from user";
    	    	Statement statement = connection.createStatement();
    	    	ResultSet resultSet = statement.executeQuery(sql);
    	    	while(resultSet.next())
    	    	{
    	    		//System.out.println(resultSet.getString(1));
    	    		if ( username.equals(resultSet.getString(1)) )
    	    		{
    	    			System.out.println("用户名已存在");
    	    			return false;
    	    		}
    	    	}
    	    	
    	    	sql = "insert into user(id,password) values(?,?)";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                pstmt.setString(1, username);
                String password_encrypt = Encrypt.getResult(password);
                pstmt.setString(2, password_encrypt);
                int result = pstmt.executeUpdate();
                System.out.println("成功插入"+result+"行");
                return true;
            }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return false;
        }
		
    }
    
    /**
     * 用户登录
     *@author 何俊霖
     * @param username 用户名
     * @param password 密码
     * @return 登录是否成功
     */
    public boolean login(String username,String password)
    {
    	
        try
        {
        	//Class.forName("com.mysql.jdbc.Driver");
    	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    	    {
    	    	String sql = "select id,password from user";
                Statement statement = connection.createStatement();
                
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next())
                {
                	String password_encrypt = Encrypt.getResult(password);
                	if(username.equals(resultSet.getString(1)) && password_encrypt.equals(resultSet.getString(2)) )
                	{
                		System.out.println("用户"+username+"登录成功");
                		return true;
                	}
                }
                System.out.println("用户名不存在或密码错误");
                return false;
             }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * 根据用户名查找单个用户信息
     *@author 何俊霖
     * @param username 用户名
     * @return 用户对象，如果用户不存在则返回null
     */
    public User getOneUser(String username)
    {
        try
        {
        	//Class.forName("com.mysql.jdbc.Driver");
    	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    	    {
    	    	String sql = "select * from user where id = ?";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                pstmt.setString(1, username);
                ResultSet resultSet = pstmt.executeQuery();
                if(resultSet.next())
                {	
                	User user = new User(
                			resultSet.getString(1),
                			resultSet.getString(2)
                			);
                	user.is_admin = resultSet.getBoolean(3);
                	user.address = resultSet.getString(4);
                	user.phone = resultSet.getString(5);
                	return user;
                }
                return null;
             }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return null;
        }
    }
    
    /**
     * 更新一个用户的个人信息（除了用户名和密码）
     *@author 何俊霖
     * @param user
     */
    public void updateOneUser(User user)
    {
        try
        {
        	//Class.forName("com.mysql.jdbc.Driver");
    	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    	    {
    	    	String sql = "update user set address = ?,phone = ? where id = ?";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                pstmt.setString(1, user.address);
                pstmt.setString(2, user.phone);
                pstmt.setString(3, user.getUsername());
                int count = pstmt.executeUpdate();
                System.out.println("成功更新"+count+"行");
             }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return;
        }
    }
    
    /**
     * 修改密码
     *@author 何俊霖
     * @param username 用户名
     * @param oldPassword 旧密码
     * @param newPassword 新密码
     * @return 修改密码是否成功
     */
    public boolean changePassword(String username,String oldPassword, String newPassword)
    {
        try
        {
        	try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    	    {
    	    	String sql = "select id,password from user where id = ?";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                pstmt.setString(1, username);
                ResultSet resultSet = pstmt.executeQuery();
                while (resultSet.next())
				{
					if(username.equals(resultSet.getString(1)) && Encrypt.getResult(oldPassword).equals(resultSet.getString(2)) )
					{
						sql = "update user set password = ? where id = ?";
		                pstmt = connection.prepareStatement(sql);
		                pstmt.setString(1, Encrypt.getResult(newPassword));
		                pstmt.setString(2, username);
		                int count = pstmt.executeUpdate();
		                System.out.println("成功更新"+count+"行");
		                return true;
					}
				}
                System.out.println("用户名不存在或密码错误");
				return false;
             }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * 查找所有商品
     * @author 何俊霖
     * @return 所有商品的列表
     */
    public List<Commodity> getAllCommodities()
    {
    	List<Commodity> commodities = new ArrayList<Commodity>();
        try
        {
        	//Class.forName("com.mysql.jdbc.Driver");
    	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    	    {
    	    	String sql = "select * from commodity";
                Statement statement = connection.createStatement();
                
                ResultSet resultSet = statement.executeQuery(sql);
                
                while(resultSet.next())
                {
                	Commodity commodity = new Commodity();
                	commodity.id = resultSet.getInt(1);
                	commodity.name = resultSet.getString(2);
                	commodity.author = resultSet.getString(3);
                	commodity.description = resultSet.getString(4);
                	commodity.ISBN = resultSet.getString(5);
                	commodity.price = resultSet.getDouble(6);
                	commodity.publisher = resultSet.getString(7);
                	commodity.editor = resultSet.getString(8);
                	commodity.stock = resultSet.getInt(9);
                	commodity.destine = resultSet.getInt(10);
                	commodity.sales = resultSet.getInt(11);
                	commodity.type = resultSet.getString(12);
                	commodity.title = resultSet.getString(13);
                	commodities.add(commodity);
                }
                
                return commodities;
             }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return commodities;
        }
    }
    
    /**
     * 根据id查找单个商品
     * @author 何俊霖
     * @param id
     * @return 商品对象
     */
    public Commodity getOneCommodity(String id)
    {
    	
        try
        {
        	//Class.forName("com.mysql.jdbc.Driver");
    	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    	    {
    	    	String sql = "select * from commodity where id = ?";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                pstmt.setString(1, id);
                ResultSet resultSet = pstmt.executeQuery();
                Commodity commodity = new Commodity();
				
                while(resultSet.next())
                {
                	commodity.id = resultSet.getInt(1);
                	commodity.name = resultSet.getString(2);
                	commodity.author = resultSet.getString(3);
                	commodity.description = resultSet.getString(4);
                	commodity.ISBN = resultSet.getString(5);
                	commodity.price = resultSet.getDouble(6);
                	commodity.publisher = resultSet.getString(7);
                	commodity.editor = resultSet.getString(8);
                	commodity.stock = resultSet.getInt(9);
                	commodity.destine = resultSet.getInt(10);
                	commodity.sales = resultSet.getInt(11);
                	commodity.type = resultSet.getString(12);
                	commodity.title = resultSet.getString(13);
                }
                
                return commodity;
             }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return null;
        }
    }
    
    
    /**
     * 更新单个商品信息
     * @author 何俊霖
     * @param commodity
     */
    public void updateOneCommodity(Commodity commodity)
    {
    	
        try
        {
        	//Class.forName("com.mysql.jdbc.Driver");
    	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    	    {
    	    	String sql = "update commodity "
    	    			+ "set name = ? ,author = ?, description = ?, ISBN = ?, "
    	    			+ "price = ?, publisher = ?, stock = ?, destine = ?, sales = ?, type = ?, title = ?"
    	    			+ "where id = ?";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                pstmt.setString(1, commodity.name);
                pstmt.setString(2, commodity.author);
                pstmt.setString(3, commodity.description);
                pstmt.setString(4, commodity.ISBN);
                pstmt.setDouble(5, commodity.price);
                pstmt.setString(6, commodity.publisher);
                pstmt.setInt(7, commodity.stock);
                pstmt.setInt(8, commodity.destine);
                pstmt.setInt(9, commodity.sales);
                pstmt.setString(10, commodity.type);
                pstmt.setString(11, commodity.title);
                pstmt.setInt(12, commodity.id);
                int count = pstmt.executeUpdate();
                System.out.println("成功更新"+count+"行");
             }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return;
        }
    }
    
    /**
     * 根据id查找订单
     * @author 何俊霖
     * @param id
     * @return 订单对象
     */
    public Order getOneOrder(String id)
    {
    	
        try
        {
        	//Class.forName("com.mysql.jdbc.Driver");
    	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    	    {
    	    	String sql = "select * from `order` where id = ?";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                pstmt.setString(1, id);
                ResultSet resultSet = pstmt.executeQuery();
                Order order = new Order();
				
                while(resultSet.next())
                {
                	order.id = resultSet.getString(1);
                	order.status = resultSet.getString(2);
                	order.buy_date = resultSet.getDate(3);
                	order.ship_date = resultSet.getDate(4);
                	order.receipt_date = resultSet.getDate(5);
                	order.u_id = resultSet.getString(6);
                	order.u_address = resultSet.getString(7);
                	order.u_Phone = resultSet.getString(8);
                }
                sql = "select * from `orderlist` where o_id = ?";
                pstmt = connection.prepareStatement(sql);
                pstmt.setString(1, id);
                resultSet = pstmt.executeQuery();
                while(resultSet.next())
                {
                	Commodity commodity = getOneCommodity(resultSet.getString(2));
                	//System.out.println(commodity.name);
                	commodity.count = resultSet.getInt(3);
                	order.commodities.add(commodity);
                }
                return order;
             }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return null;
        }
    }
    
    /**
     * 根据用户id查找其所有订单
     *@author 何俊霖
     * @param u_id 用户id
     * @return 该用户所有订单的列表
     */
    public List<Order> getOrdersFromUser(String u_id)
    {
    	List<Order> orders = new ArrayList<>();
        try
        {
        	//Class.forName("com.mysql.jdbc.Driver");
    	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    	    {
    	    	String sql = "select id from `order` where u_id = ?";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                pstmt.setString(1, u_id);
                ResultSet resultSet = pstmt.executeQuery();
                
                while(resultSet.next())
                {
                	String o_id = resultSet.getString(1);
                	Order order = getOneOrder(o_id);
                	orders.add(order);
                }
                return orders;
             }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return orders;
        }
    }
    /**
     * 根据用户id查找其购物车
     *@author 邓家豪
     * @param u_id 用户id
     * @return 该用户所有购物车的列表
     */
    public List<Commodity> getUserCart(String u_id)
    {
    	List<Commodity> commodities = new ArrayList<Commodity>();
    	try
    	{
    		//Class.forName("com.mysql.jdbc.Driver");
    		try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
		    {
		    	String sql = "select * from commodity natural join cart where user_id = "+u_id+" and commodity.id=com_id";
	            Statement statement = connection.createStatement();
	            
	            ResultSet resultSet = statement.executeQuery(sql);
	            
	            while(resultSet.next())
	            {
	            	Commodity commodity = new Commodity();
	            	commodity.id = resultSet.getInt(1);
	            	commodity.name = resultSet.getString(2);
	            	commodity.author = resultSet.getString(3);
	            	commodity.description = resultSet.getString(4);
	            	commodity.ISBN = resultSet.getString(5);
	            	commodity.price = resultSet.getDouble(6);
	            	commodity.publisher = resultSet.getString(7);
	            	commodity.editor = resultSet.getString(8);
	            	commodity.stock = resultSet.getInt(9);
	            	commodity.destine = resultSet.getInt(10);
	            	commodity.sales = resultSet.getInt(11);
	            	commodity.type = resultSet.getString(12);
	            	commodity.count=resultSet.getInt(13);
	            	commodities.add(commodity);
	            }
	            
	            return commodities;
	         }
	    }
	    catch(SQLException e)
	    {
	        e.printStackTrace();
	        return commodities;
	    }
	}
    /**
     * 查找符合标题的商品
     *@author 邓家豪
     * @param title 查询标题
     * @return 符合标题的商品
     */
    public List<Commodity> getCommoditiesByTitle(String title)
    {
    	List<Commodity> commodities = new ArrayList<Commodity>();
        try
        {
        	//Class.forName("com.mysql.jdbc.Driver");
    	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    	    {
    	    	String sql = "select * from commodity where title like '%"+title+"%'";
                Statement statement = connection.createStatement();
                
                ResultSet resultSet = statement.executeQuery(sql);
                
                while(resultSet.next())
                {
                	Commodity commodity = new Commodity();
                	commodity.id = resultSet.getInt(1);
                	commodity.name = resultSet.getString(2);
                	commodity.author = resultSet.getString(3);
                	commodity.description = resultSet.getString(4);
                	commodity.ISBN = resultSet.getString(5);
                	commodity.price = resultSet.getDouble(6);
                	commodity.publisher = resultSet.getString(7);
                	commodity.editor = resultSet.getString(8);
                	commodity.stock = resultSet.getInt(9);
                	commodity.destine = resultSet.getInt(10);
                	commodity.sales = resultSet.getInt(11);
                	commodity.type = resultSet.getString(12);
                	commodities.add(commodity);
                }
                
                return commodities;
             }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return commodities;
        }
    }
    
}