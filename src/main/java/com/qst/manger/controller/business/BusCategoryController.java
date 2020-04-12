package com.qst.manger.controller.business;

import com.qst.manger.pojoVo.TbCategoryVo;
import com.qst.manger.service.BusCategoryService;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("business")
public class BusCategoryController {
    @Autowired
    private BusCategoryService busCategoryService;

    @RequestMapping("loadAllCategoryForSelect")
    public DataGridView loadAllCategoryForSelect(){
        return busCategoryService.loadAllCategoryForSelect();
    }


    @RequestMapping("loadAllCategory")
    public DataGridView loadAllCategory(TbCategoryVo tbCategoryVo){
        return busCategoryService.loadAllCategory(tbCategoryVo);
    }
    @RequestMapping("updateCategory")
    public ResultObj  updateCategory(TbCategoryVo tbCategoryVo){
        return busCategoryService.updateCategory(tbCategoryVo);
    }
    @RequestMapping("addCategory")
    public ResultObj addCategory(TbCategoryVo tbCategoryVo){
        return busCategoryService.addCategory(tbCategoryVo);
    }
    @RequestMapping("deleteCategory")
    public ResultObj deleteCategory(TbCategoryVo tbCategoryVo){
        return busCategoryService.deleteCategory(tbCategoryVo.getId());
    }
    @RequestMapping("deleteBatchCategory")
    public ResultObj deleteBatchCategory(TbCategoryVo tbCategoryVo){
       return busCategoryService.deleteBatchCategory(tbCategoryVo);
   }
}
