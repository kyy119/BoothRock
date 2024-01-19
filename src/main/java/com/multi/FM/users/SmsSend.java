package com.multi.FM.users;

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
	
	public MessageListResponse get_message_list(String receive) {
		MessageListRequest request = new MessageListRequest();
		return this.message_service.getMessageList(request);
	}

	private String api_key = "";
	private String api_secretKey = "";

	final DefaultMessageService message_service;

	public SmsSend() { 
		this.message_service = NurigoApp.INSTANCE.initialize(api_key, api_secretKey, "https://api.coolsms.co.kr");
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