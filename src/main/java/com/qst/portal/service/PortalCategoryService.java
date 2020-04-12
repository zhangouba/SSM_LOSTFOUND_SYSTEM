package com.qst.portal.service;

import com.qst.manger.pojo.TbCategory;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface PortalCategoryService {

	//获取所有物品分类
	public List<TbCategory> getAllCategory();
}
