package com.qst.manger.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.qst.common.utils.WebUtils;
import com.qst.manger.mapper.TbCommentMapper;
import com.qst.manger.mapper.TbFoundMapper;
import com.qst.manger.mapper.TbLostMapper;
import com.qst.manger.pojo.TbComment;
import com.qst.manger.pojo.TbFound;
import com.qst.manger.pojo.TbLost;
import com.qst.manger.pojo.TbUsers;
import com.qst.manger.pojoVo.TbCommentVo;
import com.qst.manger.service.MyCommentService;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyCommentServiceImpl implements MyCommentService {
    @Autowired
    private TbCommentMapper tbCommentMapper;
    @Autowired
    private TbLostMapper tbLostMapper;
    @Autowired
    private TbFoundMapper tbFoundMapper;

    @Override
    public DataGridView loadAllMyComment(TbCommentVo tbCommentVo) {
        Page<Object> page= PageHelper.startPage(tbCommentVo.getPage(),tbCommentVo.getLimit());
       TbUsers tbUsers= (TbUsers) WebUtils.getHttpSession().getAttribute("user");

     List<TbComment> list=   tbCommentMapper.getCommentByUserId( tbUsers.getId());

     for (TbComment tbComment:list){

      TbLost tbLost= tbLostMapper.selectByPrimaryKey(Long.valueOf(  tbComment.getGoodsId()));
      if (tbLost==null){
       TbFound tbFound= tbFoundMapper.selectByPrimaryKey(Long.valueOf(tbComment.getGoodsId()));
       tbComment.setTitle(tbFound.getInfotitle());
      }else {
          tbComment.setTitle(tbLost.getInfotitle());
      }
     }
        return new DataGridView(page.getTotal(),list);
    }

    @Override
    public ResultObj deleteMyComment(Integer id) {
        try {
            tbCommentMapper.deleteBykey(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            return ResultObj.DELETE_ERROR;
        }
    }

    @Override
    public ResultObj deleteBatchMyComment(TbCommentVo tbCommentVo) {
        try {
            for (Integer id:tbCommentVo.getIds()){
                deleteMyComment(id);
            }
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            return ResultObj.DELETE_ERROR;
        }}
}
