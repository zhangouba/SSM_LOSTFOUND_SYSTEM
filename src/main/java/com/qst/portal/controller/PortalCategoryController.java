package com.qst.portal.controller;

import com.qst.manger.pojo.TbCategory;
import com.qst.portal.service.PortalCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/Portalcategory")
public class PortalCategoryController {

	@Autowired
	private PortalCategoryService portalCategoryService;
	
	/*
	 * 查询所有物品分类
	 */
	@RequestMapping("/findAll")
	public List<TbCategory> findAllCategory(){
		return portalCategoryService.getAllCategory();
	}
	
}
