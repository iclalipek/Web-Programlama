package com.java.finalproject.connect;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderIdGen {

	public static String getOrderId() {
		String orderId = "";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		orderId = sdf.format(new Date());
		orderId = "ORD-" + orderId;
		
		return orderId;
	}
}
