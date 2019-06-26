/**
 * 
 */
package org.huashan.entity;

import java.text.DecimalFormat;

/**
 * @author 何俊霖
 *
 */
public class Format
{
	public static String formatDouble(double s) 
	{
		DecimalFormat fmt = new DecimalFormat("##0.00");
		return fmt.format(s);
	}
}
