/**
 * 
 */
package org.huashan.entity;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;



/**
 * @author 何俊霖
 *
 */
public class Order
{
	public String id;
	public List<Commodity> commodities = new ArrayList<>();
	public String status;
	public Date buy_date;
	public Date ship_date;
	public Date receipt_date;
	public String u_id;
	public String u_address;
	public String u_Phone;
}
