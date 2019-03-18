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
    	dataBase.register("admin", "admin");
    	dataBase.login("admin", "admin");
//        List<Commodity> commodities = dataBase.getAllCommodities();
//        for (Commodity commodity : commodities)
//		{
//			System.out.println(commodity.id+" "+commodity.name);
//		}
    	
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
                	User user = new User(
                			resultSet.getString(1),
                			resultSet.getString(2)
                			);
                	String password_encrypt = Encrypt.getResult(password);
                	if(username.equals(user.username) && password_encrypt.equals(user.password) )
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
    
    public List<Commodity> getAllCommodities()
    {
    	
        try
        {
        	//Class.forName("com.mysql.jdbc.Driver");
    	    try (Connection connection = DriverManager.getConnection(DBurl,DBusername,DBpassword);) 
    	    {
    	    	String sql = "select * from commodity";
                Statement statement = connection.createStatement();
                
                ResultSet resultSet = statement.executeQuery(sql);
                List<Commodity> commodities = new ArrayList<Commodity>();
				
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
                	commodities.add(commodity);
                }
                
                return commodities;
             }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return null;
        }
    }
}
