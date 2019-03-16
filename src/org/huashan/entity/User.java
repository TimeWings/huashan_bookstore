/**
 * 
 */
package org.huashan.entity;

/**
 * @author 何俊霖
 *
 */
public class User
{
	public String username;
	public String password;
	public boolean is_admin = false;
	
	/**
	 *@author 何俊霖
	 */
	public User(String username,String password)
	{
		this.username = username;
		this.password = password;
	}
}
