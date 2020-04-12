package com.qst.portal.controller;

import com.qst.common.pojo.LostResult;
import com.qst.portal.service.PortalMailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/mail")
public class PortalMailUsController {

	@Autowired
	private PortalMailService portalMailService;
	
	@RequestMapping("/toUs")
	public LostResult mailUs(String name, String email, String subject, String text){
		return portalMailService.mailUs(name, email, subject, text);
	}
	
}
