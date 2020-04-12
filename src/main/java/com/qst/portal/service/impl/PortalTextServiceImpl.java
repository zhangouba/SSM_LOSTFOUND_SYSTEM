package com.qst.portal.service.impl;

import com.qst.manger.mapper.TbTextinfoMapper;
import com.qst.manger.pojo.TbTextinfo;
import com.qst.manger.pojo.TbTextinfoExample;
import com.qst.manger.pojo.TbTextinfoExample.Criteria;
import com.qst.portal.service.PortalTextService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class PortalTextServiceImpl implements PortalTextService {

	@Autowired
	private TbTextinfoMapper textInfoMapper;

	/*
	 * 增加浏览次数，并返回文章信息
	 */
	@Override
	public TbTextinfo getTextInfo(Long goods_id) {
		//获取物品对应文章信息
		TbTextinfoExample example = new TbTextinfoExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andGoodsIdEqualTo(goods_id);
		List<TbTextinfo> list = textInfoMapper.selectByExample(example);
		if(list.get(0) != null){
			TbTextinfo text = list.get(0);
			//增加浏览次数
			int times = text.getPageView();
			text.setPageView(++times);
			text.setUpdated(new Date());
			//更新文章信息
			textInfoMapper.updateByPrimaryKeySelective(text);

			return text;
		}

		return null;
	}

}
