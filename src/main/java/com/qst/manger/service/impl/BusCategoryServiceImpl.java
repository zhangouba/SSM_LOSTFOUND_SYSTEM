package com.qst.manger.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.qst.manger.mapper.TbCategoryMapper;
import com.qst.manger.pojo.TbCategory;
import com.qst.manger.pojoVo.TbCategoryVo;
import com.qst.manger.service.BusCategoryService;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BusCategoryServiceImpl implements BusCategoryService {
    @Autowired
    private TbCategoryMapper tbCategoryMapper;

    @Override
    public DataGridView loadAllCategory(TbCategoryVo tbCategoryVo) {
        Page<Object> page= PageHelper.startPage(tbCategoryVo.getPage(),tbCategoryVo.getLimit());
        List<TbCategory> losts=tbCategoryMapper.BusloadAllCategory(tbCategoryVo);
        for (TbCategory tbLost:losts){
            DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String date=dateFormat.format(tbLost.getCreated());
            tbLost.setLostDATE(date);
        }
        return new DataGridView(page.getTotal(),losts);
    }

    @Override
    public ResultObj updateCategory(TbCategoryVo tbCategoryVo) {
        try {

            tbCategoryMapper.updateByID(tbCategoryVo.getId(),tbCategoryVo.getCategoryName());
           return ResultObj.UPDATE_SUCCESS;
        }catch (Exception e){
            return ResultObj.UPDATE_ERROR;
        }

    }

    @Override
    public ResultObj addCategory(TbCategoryVo tbCategoryVo) {
        try {
            tbCategoryVo.setCreated(new Date());
            tbCategoryVo.setUpdated(new Date());
           tbCategoryMapper.insertSelective(tbCategoryVo);
           return ResultObj.ADD_SUCCESS;
        }catch (Exception e){
            return ResultObj.ADD_ERROR;
        }

    }

    @Override
    public ResultObj deleteCategory(Long id) {
        try {
          tbCategoryMapper.deleteByPrimaryKey(id);
          return  ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            return ResultObj.DELETE_ERROR;
        }
    }

    @Override
    public ResultObj deleteBatchCategory(TbCategoryVo tbCategoryVo) {
        try {
            Long ids[] = tbCategoryVo.getIds();
            for (Long id : ids) {
                deleteCategory(id);
            }
            return  ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            return ResultObj.DELETE_ERROR;

        }
    }

    @Override
    public DataGridView loadAllCategoryForSelect() {
        List<TbCategory> list=   tbCategoryMapper.loadAllCategoryForSelect();
        Map<Integer,String> map=new HashMap<>();
        for (TbCategory tbCategory:list){
            map.put(tbCategory.getId().intValue(),tbCategory.getCategoryName());
        }
        return new DataGridView(map);
    }

}
