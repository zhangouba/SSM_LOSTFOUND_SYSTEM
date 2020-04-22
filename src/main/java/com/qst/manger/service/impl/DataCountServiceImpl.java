package com.qst.manger.service.impl;

import com.qst.manger.mapper.*;
import com.qst.manger.pojo.Data.BaseEntity;
import com.qst.manger.service.DataCountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DataCountServiceImpl implements DataCountService {

    @Autowired
    private TbLostDataCountMapper tbLostDataCountMapper;
    @Autowired
    private TbCategoryMapper tbCategoryMapper;
    @Autowired
    private TbFoundDataCountMapper tbFoundDataCountMapper;



    @Override
    public List<BaseEntity> loadUserLostCategory() {
        List<BaseEntity> tbLosts= tbLostDataCountMapper.loadAllLostForData();
        return tbLosts;
    }

    @Override
    public List<BaseEntity> loadUserFoundCategory() {
        List<BaseEntity> tbFounds= tbFoundDataCountMapper.loadAllFoundForData();
        return tbFounds;
    }
}
