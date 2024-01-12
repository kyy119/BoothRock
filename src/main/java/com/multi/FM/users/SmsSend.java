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
	
//	@GetMapping("/get-message-list")
	public MessageListResponse getMessageList(String receive) {
		MessageListRequest request = new MessageListRequest();
		return this.messageService.getMessageList(request);
	}

	private String apiKey = "";
	private String apiSecretKey = "";

	final DefaultMessageService messageService;

	public SmsSend() { 
		this.messageService = NurigoApp.INSTANCE.initialize(apiKey, apiSecretKey, "https://api.coolsms.co.kr");
	}

	public SingleMessageSentResponse sendOne(String receive,String num) {
		Message message = new Message();
		message.setFrom("01041784636");
		message.setTo(receive);
		message.setText("[부스樂] 아래의 인증번호를 입력해주세요\n" + num);

		SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
		System.out.println(response);
		
		return response;
	}
	 
}