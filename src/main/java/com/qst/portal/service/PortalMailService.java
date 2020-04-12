package com.qst.portal.service;

import com.qst.common.pojo.LostResult;
import org.springframework.stereotype.Service;

@Service

public interface PortalMailService {

	//联系我们
	public LostResult mailUs(String name, String email, String subject, String text);
	
}
