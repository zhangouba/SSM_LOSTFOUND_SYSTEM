package com.qst.manger.mapper;

import com.qst.manger.pojo.Data.BaseEntity;

import java.util.List;

public interface TbLostDataCountMapper {

    List<BaseEntity> loadAllLostForData();
}
