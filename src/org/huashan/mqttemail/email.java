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
			//�½��ͻ���
			sampleClient= new MqttClient("tcp://127.0.0.1:1883", "sendEmail", persistence);				
 			MqttConnectOptions connOpts = new MqttConnectOptions();
			connOpts.setCleanSession(true);
			//��������
			System.out.println("Connecting to broker: tcp://127.0.0.1:1883");
			sampleClient.connect(connOpts);
			//��ʾ�Ƿ����ӳɹ�;
			System.out.println("Connected....������");

			//����������ַ�������topic
             String  topic = "email";
			//�ͻ��˶�����Ϣ......subscribe("���ĵ�����......")
			sampleClient.subscribe(topic);
			
			System.out.println("����:" + topic + "�Ѷ���!!!");
			
			//������Ϣ......
			sampleClient.setCallback(new MqttCallback() {
				//����������ͽ��ܵ���Ϣ......
				@Override
				public void messageArrived(String title, MqttMessage msg) throws Exception {
					System.out.println("�յ���Ϣ:"+title);
				    String info = msg.toString();
				    String message[] = info.split("\n");
				    
				  //  System.out.println(info);
				    for(String m : message)
				    	System.out.println(m);
				    
				    //�ʼ������֡�Ҫ���͵���Ϣ
				    String hisEmail = message[0].substring(6);
				    String hisName  = message[1].substring(5); 
					String information  = message[2].substring(15,message[2].length()-1);	
					
					//��ʼ����
					
					 System.out.println("׼����������....."  + hisEmail);
						MailUtils.sendMail(hisEmail , hisName+",��ϲ��,�Ѿ��ɹ�ע�ᣡ����" , information);
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
	     			System.out.println("���Ӷ�ʧ");
					System.out.println(err.getMessage());
				}

			});

		} catch(MqttException me) {
			//�����쳣����......
			System.out.println("reason "+me.getReasonCode());
			System.out.println("msg "+me.getMessage());
		    System.out.println("loc "+me.getLocalizedMessage());
			System.out.println("cause "+me.getCause());
			System.out.println("excep "+me);
			me.printStackTrace();
		}
	  }
		
		
}

