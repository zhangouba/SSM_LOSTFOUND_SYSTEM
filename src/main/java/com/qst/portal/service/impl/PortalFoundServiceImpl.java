package com.qst.portal.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.qst.common.constast.SysConstast;
import com.qst.common.pojo.LostResult;
import com.qst.common.pojo.PageResult;
import com.qst.common.utils.AppFileUtils;
import com.qst.common.utils.IDUtils;
import com.qst.common.utils.WebUtils;
import com.qst.manger.customMapper.DetFoundMapper;
import com.qst.manger.customPojo.DetFound;
import com.qst.manger.mapper.TbCommentMapper;
import com.qst.manger.mapper.TbFoundMapper;
import com.qst.manger.mapper.TbTextinfoMapper;
import com.qst.manger.pojo.*;
import com.qst.manger.pojo.TbTextinfoExample.Criteria;
import com.qst.portal.service.PortalFoundService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class PortalFoundServiceImpl implements PortalFoundService {


	@Autowired
	private TbFoundMapper foundMapper;
	@Autowired
	private DetFoundMapper detFoundMapper;
	@Autowired
	private TbTextinfoMapper textInfoMapper;
	@Autowired
	private TbCommentMapper commentMapper;
	
	
	//根据时间查询失物
	@Override
	public PageResult getFoundByTime(int page, int size) {
		//分页处理
		PageHelper.startPage(page, size);
		Page<TbFound> page1 = (Page<TbFound>) foundMapper.selectByTime();
		PageResult result = new PageResult(page1.getTotal(),page1.getResult());
		//结果使用FoundResult包装
		return result;
	}


	/*
	 * 根据条件查询招领物
	 */
	@Override
	public PageResult getFoundByCondition(DetFound detFound, int page, int size) {
		//分页
		PageHelper.startPage(page, size);
		//按条件查询
		Page<DetFound> page1 =  (Page<DetFound>) detFoundMapper.selectConditionFound(detFound);
		PageResult result = new PageResult(page1.getTotal(),page1.getResult());
		//结果使用LostResult包装
		return result;
	}


	/*
	 * 添加招领信息
	 */
	@Override
	public LostResult addFoundInfo(TbFound tbFound) {

		TbUsers tbUsers= (TbUsers) WebUtils.getHttpSession().getAttribute("user");

		if (!tbUsers.getPassword().equals(tbFound.getPassword())){
			return LostResult.build(500,"用户密码错误！");
		}
		// 补全招领信息
		//设置ID
		tbFound.setId(IDUtils.generateId());

		String imageBaseUrl =WebUtils.getHttpSession().getServletContext().getRealPath("images");

		tbFound.setImages(imageBaseUrl.substring(imageBaseUrl.length()-6)+
				tbFound.getImages().substring(6, 18)+AppFileUtils.updateFileName(imageBaseUrl+
				tbFound.getImages().substring(6, 17), tbFound.getImages().substring(18), SysConstast.FILE_UPLOAD_TEMP));
		System.out.println("");

		//添加添加招领详细文章信息
		LostResult result = insertTextInfo(tbFound.getId());
		if(result.getStatus() != 200){
			try {
				throw new Exception();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		//默认状态未审核
		tbFound.setStatus(0);
        //设置当前用户
	    String uid=tbFound.getId().toString();
		System.out.println(uid);
	    tbFound.setPassword(uid);
		//设置日期
		tbFound.setCreated(new Date());
		tbFound.setUpdated(new Date());
		//添加至数据库
		foundMapper.insert(tbFound);
		return LostResult.ok();
	}

	/*
	 * 添加失物详细文章信息
	 */
	private LostResult insertTextInfo(Long goods_id){
		TbTextinfo text = new TbTextinfo();
		text.setGoodsId(goods_id);
		text.setPublishTime(new Date());
		text.setPageView(0);
		text.setStatus(0);
		text.setCreated(new Date());
		text.setUpdated(new Date());
		textInfoMapper.insert(text);
		return LostResult.ok();
	}

	/*
	 * 根据ID查询招领信息
	 */
	@Override
	public DetFound getDetFoundById(Long foundId) {
		DetFound detFound = detFoundMapper.selectFoundById(foundId);
		return detFound;
	}

	/*
	 * 验证密码是否正确
	 */
	@Override
	public LostResult getValidatePwd(TbFound tbFound) {
		// 获取数据库中失物信息
		TbFound databaseLost = foundMapper.selectByPrimaryKey(tbFound.getId());
		//判断密码是否一致
		if(databaseLost.getPassword().equals(tbFound.getPassword())){
			return LostResult.ok();
		}else{
			//如果不一致
			LostResult lostResult = new LostResult(404, "ERROR", null);
			return lostResult;
		}
	}

	/*
	 * 根据Id查询失物信息
	 */
	@Override
	public TbFound getFoundById(Long foundId) {
		//根据ID查询
		TbFound found = foundMapper.selectByPrimaryKey(foundId);

		return found;

	}

	/*
	 * 更新失物信息
	 */
	@Override
	public LostResult updateFound(TbFound tbFound) {
		// 补全更新信息
		tbFound.setUpdated(new Date());

		try {
			foundMapper.updateByPrimaryKeySelective(tbFound);
			return LostResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/*
	 * 删除失物信息级联删除启事信息和评论信息
	 */
	@Override
	public LostResult deleteFound(Long foundId) {
		try {
			//删除失物信息
			foundMapper.deleteByPrimaryKey(foundId);

			//删除启事信息
			//根据物品ID删除
			TbTextinfoExample example = new TbTextinfoExample();
			Criteria createCriteria = example.createCriteria();
			createCriteria.andGoodsIdEqualTo(foundId);
			textInfoMapper.deleteByExample(example);

			//删除评论信息

			//根据物品ID删除
			TbCommentExample example2 = new TbCommentExample();
			TbCommentExample.Criteria createCriteria2 = example2.createCriteria();
			createCriteria2.andGoodsIdEqualTo(foundId);
			commentMapper.deleteByExample(example2);

			return LostResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
//

	/*
	 * 获取所有招领物
	 */
	@Override
	public List<TbFound> getAllFound() {
		// 获取数据库审核通过的招领启事
		TbFoundExample example = new TbFoundExample();
		TbFoundExample.Criteria createCriteria = example.createCriteria();
		createCriteria.andStatusEqualTo(1);
		List<TbFound> found = foundMapper.selectByExample(example);
		return found;
	}



}
