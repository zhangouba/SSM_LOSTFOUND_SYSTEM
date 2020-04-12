package com.qst.portal.service;

import com.qst.manger.pojo.TbTextinfo;
import org.springframework.stereotype.Service;

@Service

public interface PortalTextService {

	//增加浏览次数
	public TbTextinfo getTextInfo(Long goods_id);
}
