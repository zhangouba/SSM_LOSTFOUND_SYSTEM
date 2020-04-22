package com.qst.manger.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.qst.manger.mapper.TbCommentMapper;
import com.qst.manger.mapper.TbUsersMapper;
import com.qst.manger.pojo.TbComment;
import com.qst.manger.pojo.TbUsers;
import com.qst.manger.pojoVo.TbCommentVo;
import com.qst.manger.service.BusCommentService;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BusCommentServiceImpl implements BusCommentService {
    @Autowired
    private TbCommentMapper tbCommentMapper;
    @Autowired
    private TbUsersMapper tbUsersMapper;

    @Override
    public DataGridView loadAllComment(TbCommentVo tbCommentVo) {

        Page<Object> page= PageHelper.startPage(tbCommentVo.getPage(),tbCommentVo.getLimit());
        List<TbComment> list= tbCommentMapper.getAll(tbCommentVo);
        for (TbComment tbComment:list){
            TbUsers tbUsers=	tbUsersMapper.selectByPrimaryKey(tbComment.getUserId());
            tbComment.setUsername(tbUsers.getUsername());
            tbComment.setRealname(tbUsers.getRealname());
        }
        return new DataGridView(page.getTotal(),list);
    }

    @Override
    public ResultObj deleteComment(Integer id) {
        try {
            tbCommentMapper.deleteBykey(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            return ResultObj.DELETE_ERROR;
        }
    }

    @Override
    public ResultObj deleteBatchComment(TbCommentVo tbCommentVo) {
        try {
            for (Integer id:tbCommentVo.getIds()){
                deleteComment(id);
            }
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            return ResultObj.DELETE_ERROR;
        }
    }

}
