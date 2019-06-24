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
	public enum Status {订单配送中,订单送达,交易完成,等待发货,订单已取消,申请取消中};
	public Status status = Status.等待发货;
	public Date buy_date;
	public Date ship_date;
	public Date receipt_date;
	public String u_id;
	public String u_address;
	public String u_Phone;
}
