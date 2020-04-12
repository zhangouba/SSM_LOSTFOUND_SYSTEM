package com.qst.manger.service;

import com.qst.manger.pojoVo.TbCategoryVo;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.stereotype.Service;

@Service
public interface BusCategoryService {
    DataGridView loadAllCategory(TbCategoryVo tbCategoryVo);

    ResultObj updateCategory(TbCategoryVo tbCategoryVo);

    ResultObj addCategory(TbCategoryVo tbCategoryVo);

    ResultObj deleteCategory(Long id);

    ResultObj deleteBatchCategory(TbCategoryVo tbCategoryVo);

    DataGridView loadAllCategoryForSelect();
}
