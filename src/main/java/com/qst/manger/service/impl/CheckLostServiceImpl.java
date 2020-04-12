package com.qst.manger.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.qst.manger.mapper.TbLostMapper;
import com.qst.manger.pojo.TbLost;
import com.qst.manger.pojoVo.TbLostVo;
import com.qst.manger.service.CheckLostService;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class CheckLostServiceImpl  implements CheckLostService {
    @Autowired
    private TbLostMapper tbLostMapper;
    @Override
    public DataGridView loadAllLost(TbLostVo tbLostVo) {
        Page<Object> page=PageHelper.startPage(tbLostVo.getPage(),tbLostVo.getLimit());
         List<TbLost> losts= tbLostMapper.loadAllLost();
         for (TbLost tbLost:losts){
             DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
             String date=dateFormat.format(tbLost.getLostTime());
             tbLost.setLostDATE(date);
         }
        return new DataGridView(page.getTotal(),losts);
    }
    //审核通过
    @Override
    public ResultObj checkLostStatus(TbLostVo tbLostVo) {
        try {
            tbLostMapper.updateLostStatus(tbLostVo.getId(),tbLostVo.getStatus());
            return ResultObj.CHECK_SUCCESS;
        }catch (Exception e)
        {
            return ResultObj.UPDATE_ERROR;
        }
    }


}
