/**
 * 
 */
package org.huashan.entity;

import java.sql.Date;

/**
 * @author 何俊霖
 *
 */
public class Order
{
	public int id;
	public int com_id;
	public String status;
	public Date buy_date;
	public Date ship_date;
	public Date receipt_date;
}
