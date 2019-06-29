package com.mqtt;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;

public class email {

	
	public static void main(String[] args) {
		
		
		MemoryPersistence persistence = new MemoryPersistence();
		MqttClient  sampleClient;
		try 
		{
			//新建客户端
			sampleClient= new MqttClient("tcp://127.0.0.1:1883", "sendEmail", persistence);				
 			MqttConnectOptions connOpts = new MqttConnectOptions();
			connOpts.setCleanSession(true);
			//尝试连接
			System.out.println("Connecting to broker: tcp://127.0.0.1:1883");
			sampleClient.connect(connOpts);
			//提示是否连接成功;
			System.out.println("Connected....已连接");

			//订阅主题的字符串变量topic
             String  topic = "email";
			//客户端订阅消息......subscribe("订阅的主题......")
			sampleClient.subscribe(topic);
			
			System.out.println("主题:" + topic + "已订阅!!!");
			
			//接受消息......
			sampleClient.setCallback(new MqttCallback() {
				//参数是主题和接受的消息......
				@Override
				public void messageArrived(String title, MqttMessage msg) throws Exception {
					System.out.println("收到消息:"+title);
				    String info = msg.toString();
				    String message[] = info.split("\n");
				    
				  //  System.out.println(info);
				    for(String m : message)
				    	System.out.println(m);
				    
				    //邮件、名字、要发送的信息
				    String hisEmail = message[0].substring(6);
				    String hisName  = message[1].substring(5); 
					String information  = message[2].substring(15,message[2].length()-1);	
					
					//开始发送
					
					 System.out.println("准备发送邮箱....."  + hisEmail);
						MailUtils.sendMail(hisEmail , hisName+",恭喜你,已经成功注册！！！" , information);
				}

				@Override
				public void deliveryComplete(IMqttDeliveryToken arg0) {
					try {
						System.out.println(arg0.getMessage());
					} catch (MqttException e1) {
						e1.printStackTrace();
					}

				}
				@Override
				public void connectionLost(Throwable err) {
	     			System.out.println("连接丢失");
					System.out.println(err.getMessage());
				}

			});

		} catch(MqttException me) {
			//出现异常则处理......
			System.out.println("reason "+me.getReasonCode());
			System.out.println("msg "+me.getMessage());
		    System.out.println("loc "+me.getLocalizedMessage());
			System.out.println("cause "+me.getCause());
			System.out.println("excep "+me);
			me.printStackTrace();
		}
	  }
		
		
}

