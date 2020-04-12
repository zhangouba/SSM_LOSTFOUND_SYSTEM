package com.qst.manger.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.qst.common.utils.WebUtils;
import com.qst.manger.mapper.TbLostMapper;
import com.qst.manger.pojo.TbLost;
import com.qst.manger.pojo.TbUsers;
import com.qst.manger.pojoVo.TbLostVo;
import com.qst.manger.service.MyLostService;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class MyLostServiceImpl  implements MyLostService {
    @Autowired
    private TbLostMapper tbLostMapper;

    @Override
    public DataGridView loadAllMyLost(TbLostVo tbLostVo) {
        Page<Object> page= PageHelper.startPage(tbLostVo.getPage(),tbLostVo.getLimit());
        TbUsers tbUsers= (TbUsers) WebUtils.getHttpSession().getAttribute("user");
      //tb_lost表中的password字段对应的是tb_users 的 id
        String password= String.valueOf(tbUsers.getId());
        List<TbLost> losts= tbLostMapper.loadAllMyLost(password);
        for (TbLost tbLost:losts){
            DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            tbLost.setLostDATE(dateFormat.format(tbLost.getLostTime()));
        }
        return new DataGridView(page.getTotal(),losts);
    }

    @Override
    public ResultObj updateMyLost(TbLostVo tbLostVo) {
        return null;
    }

    @Override
    public ResultObj deleteBatchMyLost(TbLostVo tbLostVo) {
        try {
            for (Long id : tbLostVo.getIds()) {
                deleteMyLost(id);
            }
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            return ResultObj.DELETE_ERROR;
        }
    }
    @Override
    public ResultObj deleteMyLost(Long id) {
        try {
            tbLostMapper.deleteByPrimaryKey(id);
            return  ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            return ResultObj.DELETE_ERROR;
        }

    }
}
