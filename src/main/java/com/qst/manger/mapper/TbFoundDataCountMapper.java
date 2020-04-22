package com.qst.manger.mapper;

import com.qst.manger.pojo.Data.BaseEntity;

import java.util.List;

public interface TbFoundDataCountMapper {

    //拾取物品类别统计
    List<BaseEntity> loadAllFoundForData();
}
