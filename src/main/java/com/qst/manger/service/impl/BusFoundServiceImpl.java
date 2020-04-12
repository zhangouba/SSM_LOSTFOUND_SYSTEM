package com.qst.manger.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.qst.manger.mapper.TbFoundMapper;
import com.qst.manger.pojo.TbFound;
import com.qst.manger.pojoVo.TbFoundVo;
import com.qst.manger.service.BusFoundService;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class BusFoundServiceImpl implements BusFoundService {
    @Autowired
    private TbFoundMapper tbFoundMapper;

    @Override
    public DataGridView loadAllFound(TbFoundVo tbFoundVo) {
        Page<Object> page= PageHelper.startPage(tbFoundVo.getPage(),tbFoundVo.getLimit());
        List<TbFound> losts=tbFoundMapper.BusloadAllFound(tbFoundVo);
        for (TbFound tbLost:losts){
            DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String date=dateFormat.format(tbLost.getFoundTime());
            tbLost.setLostDATE(date);
        }
        return new DataGridView(page.getTotal(),losts);
    }

    @Override
    public ResultObj deleteFound(Long id) {
        try {
            tbFoundMapper.deleteByPrimaryKey(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            return ResultObj.DELETE_ERROR;
        }
    }

    @Override
    public ResultObj deleteBatchFound(TbFoundVo tbFoundVo) {
        try {
            for (Long id : tbFoundVo.getIds()) {
                deleteFound(id);
            }
            return ResultObj.DELETE_SUCCESS;

        } catch (Exception e) {
            return ResultObj.DELETE_ERROR;
        }
    }
}
