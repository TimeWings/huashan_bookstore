/**
 * 
 */
package org.huashan.entity;

import org.huashan.encrypt.Encrypt;

/**
 * @author 何俊霖
 *
 */
public class User
{
	private String username;
	private String password;
	public boolean is_admin = false;
	public String address;
	public String phone;
	public String name;
	
	/**
	 *@author 何俊霖
	 */
	public User(String username,String password)
	{
		this.username = username;
		this.password = password;
	}

	public String getUsername()
	{
		return username;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = Encrypt.getResult(password);
	}

	@Override
	public String toString()
	{
		return "User [username=" + username + ", password=" + password + ", is_admin=" + is_admin + ", address="
				+ address + ", phone=" + phone + ", name=" + name + "]";
	}
	
}
