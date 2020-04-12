package com.qst.portal.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.qst.common.constast.SysConstast;
import com.qst.common.pojo.LostResult;
import com.qst.common.pojo.PageResult;
import com.qst.common.utils.AppFileUtils;
import com.qst.common.utils.IDUtils;
import com.qst.common.utils.WebUtils;
import com.qst.manger.customMapper.DetLostMapper;
import com.qst.manger.customPojo.DetLost;
import com.qst.manger.mapper.TbCommentMapper;
import com.qst.manger.mapper.TbLostMapper;
import com.qst.manger.mapper.TbTextinfoMapper;
import com.qst.manger.pojo.*;
import com.qst.manger.pojo.TbTextinfoExample.Criteria;
import com.qst.portal.service.PortalLostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.List;
import java.util.Properties;

@Service
public class PortalLostServiceImpl implements PortalLostService {

	@Autowired
	private TbLostMapper lostMapper;
	@Autowired
	private DetLostMapper detLostMapper;
	@Autowired
	private TbTextinfoMapper textInfoMapper;
	@Autowired
	private TbCommentMapper commentMapper;
	
	//根据时间查询失物
	@Override
	public PageResult getLostByTime(int page, int size) {
		//分页处理
		PageHelper.startPage(page, size);
		Page<TbLost> page1 = (Page<TbLost>) lostMapper.selectByTime();
		PageResult result = new PageResult(page1.getTotal(),page1.getResult());
		//结果使用LostResult包装
		return result;
	}

	/*
	 * 根据条件查询失物
	 */
	@Override
	public PageResult getLostByCondition(DetLost detLost, int page, int size) {
		//分页
		PageHelper.startPage(page, size);
		//按条件查询
		Page<DetLost> page1 =  (Page<DetLost>) detLostMapper.selectConditionLost(detLost);
		PageResult result = new PageResult(page1.getTotal(),page1.getResult());
		//结果使用LostResult包装
		return result;
	}

	/*
	 *添加失物信息
	 */
	@Override
	public LostResult addLostInfo(TbLost tbLost) {
		TbUsers tbUsers= (TbUsers) WebUtils.getHttpSession().getAttribute("user");
		if (!tbUsers.getPassword().equals(tbLost.getPassword())){
			return LostResult.build(500,"用户密码错误！");
		}

		//设置ID
		tbLost.setId(IDUtils.generateId());

		String imageBaseUrl = WebUtils.getHttpSession().getServletContext().getRealPath("images");
		//看不懂是不是，我写完以后也看不懂了，但是就是能用
		tbLost.setImages(imageBaseUrl.substring(imageBaseUrl.length()-6)+
				tbLost.getImages().substring(6, 18)+AppFileUtils.updateFileName(imageBaseUrl+
				tbLost.getImages().substring(6, 17), tbLost.getImages().substring(18), SysConstast.FILE_UPLOAD_TEMP));


		LostResult result = insertTextInfo(tbLost.getId());
		if (result.getStatus() != 200) {
			try {
				throw new Exception();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		//默认状态未审核
		tbLost.setStatus(0);


		tbLost.setPassword(tbUsers.getId().toString());
		//设置日期
		tbLost.setCreated(new Date());
		tbLost.setUpdated(new Date());
		//添加至数据库
		lostMapper.insert(tbLost);
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
	 * 根据ID查询明细失物信息
	 */
	@Override
	public DetLost getDetLostById(Long lostId) {
		DetLost detlost = detLostMapper.selectLostById(lostId);
		return detlost;
	}

	/*
	 * 验证密码是否正确
	 */
	@Override
	public LostResult getValidatePwd(TbLost tbLost) {
		// 获取数据库中失物信息
		System.out.println(tbLost.getPassword());
		System.out.println(tbLost.getId());
		TbLost databaseLost = lostMapper.selectByPrimaryKey(tbLost.getId());
		System.out.println(databaseLost.getPassword());
		//判断密码是否一致
		if(databaseLost.getPassword().equals(tbLost.getPassword())){
			return LostResult.ok();
		}else{
			//如果不一致
			LostResult lostResult = new LostResult(404, "ERROR", null);
			return lostResult;
		}
	}

	/*
	 * 根据ID查询失物信息
	 */
	@Override
	public TbLost getLostById(Long lostId) {
		//根据ID查询
		TbLost lost = lostMapper.selectByPrimaryKey(lostId);

		return lost;
	}

	/*
	 * 更新失物信息
	 */
	@Override
	public LostResult updateLost(TbLost tbLost) {
		// 补全更新信息
		tbLost.setUpdated(new Date());

		try {
			lostMapper.updateByPrimaryKeySelective(tbLost);
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
	public LostResult deleteLost(Long lostId) {
		try {
			//删除失物信息
			lostMapper.deleteByPrimaryKey(lostId);

			//删除启事信息
			//根据物品ID删除
			TbTextinfoExample example = new TbTextinfoExample();
			Criteria createCriteria = example.createCriteria();
			createCriteria.andGoodsIdEqualTo(lostId);
			textInfoMapper.deleteByExample(example);

			//删除评论信息
			//根据物品ID删除
			TbCommentExample example2 = new TbCommentExample();
			TbCommentExample.Criteria createCriteria2 = example2.createCriteria();
			createCriteria2.andGoodsIdEqualTo(lostId);
			commentMapper.deleteByExample(example2);

			return LostResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}


	/*
	 * 获取所有失物
	 */
	@Override
	public List<TbLost> getAllLost() {
		// 从数据库获取审核通过的寻物启事
		TbLostExample example = new TbLostExample();
		TbLostExample.Criteria createCriteria = example.createCriteria();
		createCriteria.andStatusEqualTo(1);
		List<TbLost> listLost = lostMapper.selectByExample(example);
		return listLost;
	}


}
