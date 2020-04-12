package com.qst.manger.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.qst.common.utils.WebUtils;
import com.qst.manger.mapper.TbFoundMapper;
import com.qst.manger.pojo.TbFound;
import com.qst.manger.pojo.TbUsers;
import com.qst.manger.pojoVo.TbFoundVo;
import com.qst.manger.service.MyFoundService;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class MyFoundServiceImpl  implements MyFoundService {

    @Autowired
    private TbFoundMapper tbFoundMapper;

    @Override
    public DataGridView loadAllMyFound(TbFoundVo tbFoundVo) {
        Page<Object> page= PageHelper.startPage(tbFoundVo.getPage(),tbFoundVo.getLimit());
        TbUsers tbUsers= (TbUsers) WebUtils.getHttpSession().getAttribute("user");
        //tb_lost表中的password字段对应的是tb_users 的 id
        String password= String.valueOf(tbUsers.getId());
        List<TbFound> list= tbFoundMapper.loadAllMyFound(password);
           for (TbFound tbFound:list){
               DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
               tbFound.setLostDATE(dateFormat.format(tbFound.getFoundTime()));
           }
        return new DataGridView(page.getTotal(),list);
    }

    @Override
    public ResultObj updateMyFound(TbFoundVo tbFoundVo) {
        return null;
    }


    @Override
    public ResultObj deleteBatchMyFound(TbFoundVo tbFoundVo) {
        try {
            for (Long id : tbFoundVo.getIds()) {
                deleteMyFound(id);
            }
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            return ResultObj.DELETE_ERROR;

        }

    }
    @Override
    public ResultObj deleteMyFound(Long id) {
        try {
            tbFoundMapper.deleteByPrimaryKey(id);
            return  ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            return ResultObj.DELETE_ERROR;
        }

    }
}
