package com.qst.manger.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.qst.manger.mapper.TbLostMapper;
import com.qst.manger.pojo.TbLost;
import com.qst.manger.pojoVo.TbLostVo;
import com.qst.manger.service.BusLostService;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class BusLostServiceImpl implements BusLostService {

    @Autowired
    private TbLostMapper tbLostMapper;

    //加载除了未审核状态的所有
    @Override
    public DataGridView loadAllLost(TbLostVo tbLostVo) {
        Page<Object> page= PageHelper.startPage(tbLostVo.getPage(),tbLostVo.getLimit());
        List<TbLost> losts=tbLostMapper.BusloadAllLost(tbLostVo);
        for (TbLost tbLost:losts){
            DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String date=dateFormat.format(tbLost.getLostTime());
            tbLost.setLostDATE(date);
        }
        return new DataGridView(page.getTotal(),losts);
    }

    @Override
    public ResultObj deleteLost(Long id) {
        try {
            tbLostMapper.deleteByPrimaryKey(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            return ResultObj.DELETE_ERROR;
        }
    }

    @Override
    public ResultObj deleteBatchLost(TbLostVo tbLostVo) {
        try {
           for (Long id:tbLostVo.getIds()){
               deleteLost(id);
           }
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            return ResultObj.DELETE_ERROR;
        }
    }
}
