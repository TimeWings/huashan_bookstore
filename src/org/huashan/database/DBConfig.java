/**
 * 
 */
package org.huashan.database;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 读取数据库配置文件
 * @author 何俊霖
 *
 */
public class DBConfig
{
	private static final String path = "config/database.properties";
	
	public static String getDBURL() throws IOException 
	{
        Properties properties = new Properties();
        InputStream fileInputStream = DBConfig.class.getClassLoader().getResourceAsStream(path); 
        properties.load(fileInputStream);
        fileInputStream.close();
        return properties.getProperty("url");
    }
	
	public static String getDBDriver() throws IOException 
	{
        Properties properties = new Properties();
        InputStream fileInputStream = DBConfig.class.getClassLoader().getResourceAsStream(path); 
        properties.load(fileInputStream);
        fileInputStream.close();
        return properties.getProperty("driver");
    }
	
	public static String getDBUsername() throws IOException 
	{
        Properties properties = new Properties();
        InputStream fileInputStream = DBConfig.class.getClassLoader().getResourceAsStream(path); 
        properties.load(fileInputStream);
        fileInputStream.close();
        return properties.getProperty("username");
    }
	
	public static String getDBPassword() throws IOException 
	{
        Properties properties = new Properties();
        InputStream fileInputStream = DBConfig.class.getClassLoader().getResourceAsStream(path); 
        properties.load(fileInputStream);
        fileInputStream.close();
        return properties.getProperty("password");
    }

}
