package com.qst.manger.controller;

import com.qst.common.utils.WebUtils;
import com.qst.manger.pojo.News;
import com.qst.manger.pojo.TbUsers;
import com.qst.manger.pojoVo.NewsVo;
import com.qst.manger.service.NewsService;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * 公告管理控制器
 *
 * @author LJH
 *
 */
@RestController
@RequestMapping("news")
public class NewsController {

	@Autowired
	private NewsService newsService;
	/**
	 * 加载公告列表返回DataGridView
	 * loadAllnews
	 */
	@RequestMapping("loadAllNews")
	public DataGridView loadAllNews(NewsVo newsVo) {
		//System.out.println("21312312312321312312312");
//        System.out.println(newsVo.getLoginname());
//        System.out.println(newsVo.getLoginip());
		return this.newsService.queryAllNews(newsVo);
	}

	/**
	 * 添加公告
	 */
	@RequestMapping("addNews")
	public ResultObj addNews(NewsVo newsVo) {
		try {
			TbUsers user= (TbUsers) WebUtils.getHttpSession().getAttribute("user");
			newsVo.setCreatetime(new Date());
			newsVo.setOpername(user.getRealname());
			this.newsService.addNews(newsVo);
			return ResultObj.ADD_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.ADD_ERROR;
		}
	}
	/**
	 * 修改公告
	 */
	@RequestMapping("updateNews")
	public ResultObj updateNews(NewsVo newsVo) {
		try {
			this.newsService.updateNews(newsVo);
			return ResultObj.UPDATE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.UPDATE_ERROR;
		}
	}


	/**
	 * 删除公告
	 */
	@RequestMapping("deleteNews")
	public ResultObj deleteNews(NewsVo newsVo) {
		try {
			this.newsService.deleteNews(newsVo.getId());
			return ResultObj.DELETE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.DELETE_ERROR;
		}
	}

	/**
	 * 批量删除公告
	 */
	@RequestMapping("deleteBatchNews")
	public ResultObj deleteBatchNews(NewsVo newsVo) {
		try {
			this.newsService.deleteBatchNews(newsVo.getIds());
			return ResultObj.DELETE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.DELETE_ERROR;
		}
	}


    /**
     * 查看首页公告
     */
	@RequestMapping("loadNewsById")
	public News loadNewsById(Integer id) {
		return newsService.queryNewsById(id);
	}
}
