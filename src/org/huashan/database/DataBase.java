/**
 * 
 */
package org.huashan.database;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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
//    	Order order = dataBase.getOneOrder("201903222137421001722022");
//    	System.out.println("订单id:"+order.id+" 状态:"+order.status.toString()+"  u_id:"+order.u_id);
//    	for(int i=0;i<order.commodities.size();i++)
//    	{
//    		System.out.println("商品id:"+order.commodities.get(i).id+" "+order.commodities.get(i).name+" 数量:"+order.commodities.get(i).count);
//    	}
//    	order.commodities.get(0).count = 4;
//    	//dataBase.updateOneOrder(order);
//    	dataBase.insertOneOrder(order);
//    	String name = dataBase.getAllCommoditiesByType("玄幻").get(3).name;
//    	System.out.println(name);
  	
		

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
     * @author 何俊霖
     * @param sql
     * @return 受影响的行数
     */
    public int update(String sql)
    {
    	 try
         {
         	//Class.forName("com.mysql.jdbc.Driver");
     	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
     	    {
                 PreparedStatement pstmt = connection.prepareStatement(sql);
                 int count = pstmt.executeUpdate();
                 System.out.println("成功更新"+count+"行");
                 return count;
              }
         }
         catch(SQLException e)
         {
             e.printStackTrace();
             return 0;
         }
    }
    
    /**
     * 用户注册
     * @author 何俊霖
     * @param username 用户名（唯一）
     * @param name 昵称
     * @param password 原始未加密密码
     * @return 注册是否成功
     */
    public boolean register(String username,String name, String password)
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
    	    	
    	    	sql = "insert into user(id,password,name) values(?,?,?)";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                pstmt.setString(1, username);
                String password_encrypt = Encrypt.getResult(password);
                pstmt.setString(2, password);
                pstmt.setString(3, name);
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
     * @author 何俊霖
     * @param username 用户名
     * @param password 密码
     * @return 登录是否成功
     */
    public User login(String username,String password)
    {
    	
        try
        {
        	//Class.forName("com.mysql.jdbc.Driver");
    	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    	    {
    	    	String sql = "select * from user";
                Statement statement = connection.createStatement();
                
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next())
                {
                	String password_encrypt = Encrypt.getResult(password);
                	if(username.equals(resultSet.getString(1)) && password.equals(resultSet.getString(2)) )
                	{
                		System.out.println("用户"+username+"登录成功");
                		User user=new User(username, password);
                		user.is_admin=resultSet.getBoolean(3);
                		user.address=resultSet.getString(4);
                		user.phone=resultSet.getString(5);
                		user.name=resultSet.getString(6);
                		return user;
                	
                	}
                }
                System.out.println("用户名不存在或密码错误");
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
     * 根据用户名查找单个用户信息
     * @author 何俊霖
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
                	user.name = resultSet.getString(6);
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
     * 查找所有用户信息
     * @author 何俊霖
     * @return 用户列表
     */
    public List<User> getAllUser()
    {
        try
        {
        	List<User> users= new ArrayList<>();
    	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    	    {
    	    	String sql = "select * from user";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                ResultSet resultSet = pstmt.executeQuery();
                while(resultSet.next())
                {	
                	User user = new User(
                			resultSet.getString(1),
                			resultSet.getString(2)
                			);
                	user.is_admin = resultSet.getBoolean(3);
                	user.address = resultSet.getString(4);
                	user.phone = resultSet.getString(5);
                	user.name = resultSet.getString(6);
                	users.add(user);
                }
                return users;
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
     * @author 何俊霖
     * @param user
     * @return 受影响的行数
     */
    public int updateOneUser(User user)
    {
        try
        {
        	//Class.forName("com.mysql.jdbc.Driver");
    	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    	    {
    	    	String sql = "update user set address = ?,phone = ?,name = ? where id = ?";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                pstmt.setString(1, user.address);
                pstmt.setString(2, user.phone);
                pstmt.setString(3, user.name);
                pstmt.setString(4, user.getUsername());
                
                int count = pstmt.executeUpdate();
                System.out.println("成功更新"+count+"行");
                return count;
             }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return 0;
        }
    }
    
    /**
     * 修改密码
     * @author 何俊霖
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
                	commodity.stock = resultSet.getInt(8);
                	commodity.destine = resultSet.getInt(9);
                	commodity.sales = resultSet.getInt(10);
                	commodity.type = resultSet.getString(11);
                	commodity.title = resultSet.getString(12);
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
     * 查找所有商品，并根据销量排序（降序）
     * @author 何俊霖
     * @return 所有商品的列表,根据销量排序
     */
    public List<Commodity> getAllCommoditiesOrderBySales()
    {
    	List<Commodity> commodities = new ArrayList<Commodity>();
        try
        {
        	//Class.forName("com.mysql.jdbc.Driver");
    	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    	    {
    	    	String sql = "select * from commodity order by sales DESC";
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
                	commodity.stock = resultSet.getInt(8);
                	commodity.destine = resultSet.getInt(9);
                	commodity.sales = resultSet.getInt(10);
                	commodity.type = resultSet.getString(11);
                	commodity.title = resultSet.getString(12);
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
     * 根据类型查找所有商品
     * @author 何俊霖
     * @param type
     * @return
     */
    public List<Commodity> getAllCommoditiesByType(String type)
    {
    	List<Commodity> commodities = new ArrayList<Commodity>();
        try
        {
        	//Class.forName("com.mysql.jdbc.Driver");
    	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    	    {
    	    	String sql = "select * from commodity where type = ?";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                pstmt.setString(1, type);
                ResultSet resultSet = pstmt.executeQuery();
                
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
                	commodity.stock = resultSet.getInt(8);
                	commodity.destine = resultSet.getInt(9);
                	commodity.sales = resultSet.getInt(10);
                	commodity.type = resultSet.getString(11);
                	commodity.title = resultSet.getString(12);
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
                	commodity.stock = resultSet.getInt(8);
                	commodity.destine = resultSet.getInt(9);
                	commodity.sales = resultSet.getInt(10);
                	commodity.type = resultSet.getString(11);
                	commodity.title = resultSet.getString(12);
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
     * @return 受影响的行数
     */
    public int updateOneCommodity(Commodity commodity)
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
                return count;
             }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return 0;
        }
    }
    
    /**
     * 插入一个商品
     * @author 何俊霖
     * @param commodity
     * @return 受影响的行数
     */
    public int insertOneCommodity(Commodity commodity)
    {
        try
        {
    	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    	    {
    	    	String sql = "insert into commodity(name,author,description,ISBN,"
    	    			+ "price,publisher,stock,destine,sales,type,title)"
    	    			+ "values(? ,?, ?, ?, "
    	    			+ "?, ?, ?, ?,?,?,?) ";
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
                int count = pstmt.executeUpdate();
                System.out.println("成功插入"+count+"行");
                return count;
             }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return 0;
        }
    }
    
    /**
     * 根据id删除一个商品
     * @author 何俊霖
     * @param id
     * @return 受影响的行数
     */
    public int deleteOneCommodity(String id)
    {
        try
        {
    	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    	    {
    	    	String sql = "delete from commodity where id = ?";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                pstmt.setString(1, id);
                int count = pstmt.executeUpdate();
                System.out.println("成功删除"+count+"行");
                return count;
             }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return 0;
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
                	order.status = Order.Status.valueOf(resultSet.getString(2));
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
     * 查找所有订单
     * @author 何俊霖
     * @param id
     * @return 订单列表
     */
    public List<Order> getAllOrders()
    {
    	List<Order> orders = new ArrayList<>();
        try
        {
        	//Class.forName("com.mysql.jdbc.Driver");
    	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    	    {
    	    	String sql = "select id from `order`";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                //pstmt.setString(1, u_id);
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
     * 根据用户id查找其所有订单
     * @author 何俊霖
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
     * 更新单个订单信息 <br/>
     * 该order对象的commodities列表中只允许修改count（数量）属性，不允许修改其他属性，也不允许add或remove<br/>
     * 此函数影响order表和orderlist表
     * @author 何俊霖
     * @param order
     * @return 受影响的行数
     */
    public int updateOneOrder(Order order)
    {
        try
        {
        	int count = 0;
        	int count2 = 0;
    	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    	    {
    	    	String sql = "update `order` set status = ?, buy_date = ?, ship_date = ?,"
    	    			+ "receipt_date = ?, u_id = ?,u_address = ?, u_phone = ? "
    	    			+ "where id = ?";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                pstmt.setString(1, order.status.toString());
                pstmt.setDate(2, order.buy_date);
                pstmt.setDate(3, order.ship_date);
                pstmt.setDate(4, order.receipt_date);
                pstmt.setString(5, order.u_id);
                pstmt.setString(6, order.u_address);
                pstmt.setString(7, order.u_Phone);
                pstmt.setString(8, order.id);
                
                count = pstmt.executeUpdate();
                System.out.println("成功更新order表"+count+"行");
                
                count2 = 0;
                for(int i=0;i<order.commodities.size();i++)
                {
                	sql = "update `orderlist` set count = ? where o_id = ? and com_id = ?";
                	pstmt = connection.prepareStatement(sql);
                	
                	pstmt.setInt(1, order.commodities.get(i).count);
                	pstmt.setString(2, order.id);
                	pstmt.setInt(3, order.commodities.get(i).id);
                	count2 += pstmt.executeUpdate();
                }
                System.out.println("成功更新orderlist表"+count2+"行");
             }
    	    return count + count2;
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return 0;
        }
    }
    
    
    /**
     * 插入一个订单，其中订单id为自动生成
     * @author 何俊霖
     * @param order
     * @return
     */
    public int insertOneOrder(Order order)
    {
        try
        {
        	Date date = new Date();
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        	int hashCode = Math.abs(UUID.randomUUID().toString().hashCode());
        	order.id = sdf.format(date)+hashCode;
        	System.out.println("订单id:"+order.id);
        	int count = 0;
        	int count2 = 0;
    	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    	    {
    	    	String sql = "insert `order`(id, status, buy_date, ship_date,"
    	    			+ "receipt_date , u_id ,u_address, u_phone) values(?,?,?,?,?,?,?,?)";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                pstmt.setString(1, order.id);
                pstmt.setString(2, order.status.toString());
                pstmt.setDate(3, order.buy_date);
                pstmt.setDate(4, order.ship_date);
                pstmt.setDate(5, order.receipt_date);
                pstmt.setString(6, order.u_id);
                pstmt.setString(7, order.u_address);
                pstmt.setString(8, order.u_Phone);
                
                count = pstmt.executeUpdate();
                System.out.println("成功插入order表"+count+"行");
                
                count2 = 0;
                for(int i=0;i<order.commodities.size();i++)
                {
                	sql = "insert `orderlist` values(?,?,?)";
                	pstmt = connection.prepareStatement(sql);
                	
                	
                	pstmt.setString(1, order.id);
                	pstmt.setInt(2, order.commodities.get(i).id);
                	pstmt.setInt(3, order.commodities.get(i).count);
                	count2 += pstmt.executeUpdate();
                }
                System.out.println("成功插入orderlist表"+count2+"行");
             }
    	    return count + count2;
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return 0;
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
    		try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
		    {
		    	String sql = "select * from commodity natural join cart where user_id = ? and commodity.id=com_id";
	            PreparedStatement pstmt = connection.prepareStatement(sql);
	            pstmt.setString(1, u_id);
	            ResultSet resultSet = pstmt.executeQuery(sql);
	            
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
	            	commodity.stock = resultSet.getInt(8);
	            	commodity.destine = resultSet.getInt(9);
	            	commodity.sales = resultSet.getInt(10);
	            	commodity.type = resultSet.getString(11);
	            	commodity.title = resultSet.getString(12);
	            	commodity.count=resultSet.getInt(15);
	            	//System.out.println(commodity.count);
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
     * 查询购物车商品数量
     *@author 邓家豪
     * @param u_id 用户id
     * @param c_id 商品id
     * @return 用户购物车对应商品的数量
     */
    public int getCartCommodity(String u_id,int c_id)
    {
    	try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
	    {
    		int count=0;
	    	String sql = "select count from `cart` where user_id=? and com_id=?";
	    	PreparedStatement pstmt = connection.prepareStatement(sql);
	    	pstmt.setString(1, u_id);
	    	pstmt.setInt(2, c_id);
	    	//count = pstmt.executeUpdate();
	    	ResultSet resultSet=pstmt.executeQuery();
            if(resultSet.next())
            {
	    	count=resultSet.getInt(1);
            }
            System.out.println("查询cart表对应商品数量"+count+"本");
            
            return count;
         }
    
    catch(SQLException e)
    {
        e.printStackTrace();
        System.out.println("已存在");
        return 0;
    }
    	
    }
    /**
     * 购买商品后在购物车删除相应的商品
     * @author 邓家豪
     * @param commodities 购买的商品列表
     * @param u_id 用户id
     * @return 返回删除的商品行数
     */
    public int deleteUserCart(List<Commodity> commodities,String u_id)
    {
    	//Class.forName("com.mysql.jdbc.Driver");
    			try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    		    {		
    				
    		    		for(int i=0;i<commodities.size();i++)
    		    		{
    					String sql = "delete from `cart`  where user_id=? and com_id=?";
    			    	PreparedStatement pstmt = connection.prepareStatement(sql);
    			    	pstmt.setString(1, u_id);
    			    	pstmt.setInt(2, commodities.get(i).id);
     			    	int count = pstmt.executeUpdate();
    	                System.out.println("成功删除cart表"+count+"行");}
    							return commodities.size();
    	         }
    			catch (Exception e) {
    				// TODO: handle exception
    				System.out.println("删除Cart表时出错");
    				return 0;
    			}
    }
    /**
     * 更新购物车
     * @author 邓家豪
     * @param commodities 购物车商品列表
     * @param u_id 用户id
     * @return 修改的商品数量
     */
    public int updateUserCart(List<Commodity> commodities,String u_id)
    {
    	
		//Class.forName("com.mysql.jdbc.Driver");
		try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
	    {		
			
	    		for(int i=0;i<commodities.size();i++)
	    		{
				String sql = "update  `cart` set count=? where user_id=? and com_id=?";
		    	PreparedStatement pstmt = connection.prepareStatement(sql);
		    	pstmt.setString(2, u_id);
		    	pstmt.setInt(3, commodities.get(i).id);
		    	pstmt.setInt(1, commodities.get(i).count);
		    	int count = pstmt.executeUpdate();
                System.out.println("成功更新cart表"+count+"行");}
						return commodities.size();
         }
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("更新Cart表时出错");
			return 0;
		}
    }
    
    /**
     * 修改购物车商品数量
     * @author 何俊霖
     * @param c_id 商品id
     * @param u_id 用户id
     * @return 修改的行数
     */
    public int updateUserCart(int c_id,String u_id,int count)
    {
    	int num = 0;
		//Class.forName("com.mysql.jdbc.Driver");
		try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
	    {		
			String sql = "update `cart` set count=? where user_id=? and com_id=?";
		    PreparedStatement pstmt = connection.prepareStatement(sql);
		    	
		    pstmt.setInt(1, count);
		    pstmt.setString(2, u_id);
		    pstmt.setInt(3, c_id);
		    num = pstmt.executeUpdate();
            System.out.println("成功更新cart表"+num+"行");
         }
		catch (Exception e) 
		{
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
		return num;
    }
    
    /**
     * 删除指定用户购物车的指定商品
     * @author 何俊霖
     * @param c_id 商品id
     * @param u_id 用户id
     * @return 返回删除的商品行数
     */
    public int deleteUserCart(int c_id,String u_id)
    {
		int num = 0;
		try (Connection connection = DriverManager.getConnection(DBurl, DBusername, DBpassword);)
		{
			String sql = "delete from `cart` where user_id=? and com_id=?";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, u_id);
			pstmt.setInt(2, c_id);
			num = pstmt.executeUpdate();
			System.out.println("成功删除cart表" + num + "行");
		} 
		catch (Exception e)
		{
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
		return num;
    }
    
    /**
     * 删除指定用户购物车的所有商品
     * @author 何俊霖
     * @param u_id 用户id
     * @return 返回删除的商品行数
     */
    public int deleteUserCart(String u_id)
    {
		int num = 0;
		try (Connection connection = DriverManager.getConnection(DBurl, DBusername, DBpassword);)
		{
			String sql = "delete from `cart` where user_id=?";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, u_id);
			num = pstmt.executeUpdate();
			System.out.println("成功删除cart表" + num + "行");
		} 
		catch (Exception e)
		{
			// TODO: handle exception
			e.printStackTrace();
			return num;
		}
		return num;
    }
    	
    /**
     * 添加商品至购物车
     *@author 邓家豪
     * @param u_id 用户id
     * @param c_id 商品id
     * @param count 商品数量
     * @return 增加的购物车商品数量
     */
    public int addUserCart(String u_id,int c_id,int count)
    {
        	try
    	{
    		//Class.forName("com.mysql.jdbc.Driver");
    		try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
		    {
    			if(getCartCommodity(u_id, c_id)==0)
		    	{
    				String sql = "insert  `cart` values(?,?,?)";
		    	PreparedStatement pstmt = connection.prepareStatement(sql);
		    	pstmt.setString(1, u_id);
		    	pstmt.setInt(2, c_id);
		    	pstmt.setInt(3, count);
		    	count = pstmt.executeUpdate();
                System.out.println("成功插入cart表"+count+"行");
	            }
    			else
    			{
    				count+=getCartCommodity(u_id, c_id);
    				String sql = "update  `cart` set count=? where user_id=? and com_id=?";
    		    	PreparedStatement pstmt = connection.prepareStatement(sql);
    		    	pstmt.setString(2, u_id);
    		    	pstmt.setInt(3, c_id);
    		    	pstmt.setInt(1, count);
    		    	count = pstmt.executeUpdate();
                    System.out.println("成功更新cart表"+count+"行");
    			}
    			return count;
	         }
	    }
	    catch(SQLException e)
	    {
	        e.printStackTrace();
	        System.out.println("已存在");
	        return 0;
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
                	commodity.stock = resultSet.getInt(8);
                	commodity.destine = resultSet.getInt(9);
                	commodity.sales = resultSet.getInt(10);
                	commodity.type = resultSet.getString(11);
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