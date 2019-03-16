/**
 * 
 */
package org.huashan.database;

import java.sql.*;
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
        dataBase.login("123", "1234567");
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
    	    	String sql = "select name from user";
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
    	    	
    	    	sql = "insert into user(name,password) values(?,?)";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                pstmt.setString(1, username);
                pstmt.setString(2, password);
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
    	    	String sql = "select name,password from user";
                Statement statement = connection.createStatement();
                
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next())
                {
                	User user = new User(
                			resultSet.getString(1),
                			resultSet.getString(2)
                			);
                	if(username.equals(user.username) && password.equals(user.password) )
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
}
