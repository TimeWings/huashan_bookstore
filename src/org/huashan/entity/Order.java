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
	int id;
	int com_id;
	String status;
	Date buy_date;
	Date ship_date;
	Date receipt_date;
}
