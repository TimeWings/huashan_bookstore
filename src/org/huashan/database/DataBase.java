/**
 * 
 */
package org.huashan.database;

import java.sql.*;

/**
 * @author 何俊霖
 *
 */
public class DataBase
{
	final static String url = "jdbc:mysql://172.16.34.251:3306/huashan?characterEncoding=utf8&useSSL=false&serverTimezone=UTC";
	final static String username = "root";
	final static String password = "root";
	
	private static DataBase instance = new DataBase();

    private DataBase() {}

    public static DataBase getInstance() 
    {
        return instance;
    }

    public static void main(String[] args)
    {
        test();
    }
    
    public static void test()
    {
    	
        try
        {
        	Class.forName("com.mysql.jdbc.Driver");
    	    try (Connection connection = DriverManager.getConnection(url,username,password);) 
    	    {
                PreparedStatement pstmt = connection.prepareStatement("insert into test(name) values(?)");
                pstmt.setString(1, "4444");
                int result = pstmt.executeUpdate();
                System.out.println(result);
            }
        }
        catch(SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
    }
}
