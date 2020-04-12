package com.qst.manger.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.qst.manger.mapper.TbFoundMapper;
import com.qst.manger.pojo.TbFound;
import com.qst.manger.pojoVo.TbFoundVo;
import com.qst.manger.service.CheckFoundService;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class CheckFoundServiceImpl implements CheckFoundService {

    @Autowired
    private TbFoundMapper tbFoundMapper;
    @Override
    public DataGridView loadAllFound(TbFoundVo tbFoundVo) {
        Page<Object> page= PageHelper.startPage(tbFoundVo.getPage(),tbFoundVo.getLimit());
        List<TbFound> list= tbFoundMapper.loadAllFound();
        for (TbFound tbFound:list){
            DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String date=dateFormat.format(tbFound.getFoundTime());
            tbFound.setLostDATE(date);
        }
        return new DataGridView(page.getTotal(),list);
    }

    @Override
    public ResultObj checkFoundStatus(TbFoundVo tbFoundVo) {
        try {

            tbFoundMapper.updateFoundStatus(tbFoundVo.getId(),tbFoundVo.getStatus());
            return ResultObj.CHECK_SUCCESS;

        }catch (Exception e){
            return ResultObj.CHECK_ERROR;

        }
    }
}
