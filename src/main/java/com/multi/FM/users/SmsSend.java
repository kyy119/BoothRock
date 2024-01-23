package com.multi.FM.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RestController;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.MessageListRequest;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.MessageListResponse;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@RestController
public class SmsSend {
	
//    @Autowired
//    UsersConfiguration config;
  
    @Autowired
    private String sms_key = "";// ""다 지우기
   
    @Autowired
    private String sms_secret_key =  ""; // ""다 지우기
	
    public MessageListResponse get_message_list(String receive) {
		MessageListRequest request = new MessageListRequest();
		return this.message_service.getMessageList(request);
	}
	
	final DefaultMessageService message_service;
	
	@Autowired
	public SmsSend(
	    @Value("${sms.key}") String sms_key,
        @Value("${sms.secretKey}") String sms_secret_key) { 
		this.message_service = NurigoApp.INSTANCE.initialize(sms_key, sms_secret_key, "https://api.coolsms.co.kr");
	}

	public SingleMessageSentResponse send_one(String receive,String num) {
		Message message = new Message();
		message.setFrom("01041784636");
		message.setTo(receive);
		message.setText("[부스樂] 아래의 인증번호를 입력해주세요\n" + num);

		SingleMessageSentResponse response = this.message_service.sendOne(new SingleMessageSendingRequest(message));
		System.out.println(response);
		
		return response;
	}
	 
}