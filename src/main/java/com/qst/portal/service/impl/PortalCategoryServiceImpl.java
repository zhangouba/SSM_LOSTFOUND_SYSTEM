package com.qst.portal.service.impl;

import com.qst.manger.mapper.TbCategoryMapper;
import com.qst.manger.pojo.TbCategory;
import com.qst.portal.service.PortalCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PortalCategoryServiceImpl implements PortalCategoryService {

	@Autowired
	private TbCategoryMapper categoryMapper;
	/*
	 * 查询所有物品分类
	 */
	@Override
	public List<TbCategory> getAllCategory() {
		
		try {
			List<TbCategory> result = categoryMapper.selectByExample(null);

			if(result.size() >= 0){

				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
