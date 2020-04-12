package com.qst.manger.service.impl;

import com.qst.manger.mapper.TbCategoryMapper;
import com.qst.manger.mapper.TbFoundMapper;
import com.qst.manger.mapper.TbLostMapper;
import com.qst.manger.pojo.Data.BaseEntity;
import com.qst.manger.service.DataCountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DataCountServiceImpl implements DataCountService {

    @Autowired
    private TbLostMapper tbLostMapper;
    @Autowired
    private TbCategoryMapper tbCategoryMapper;
    @Autowired
    private TbFoundMapper tbFoundMapper;

    @Override
    public List<BaseEntity> loadUserLostCategory() {
        List<BaseEntity> tbLosts= tbLostMapper.loadAllLostForData();
        return tbLosts;
    }

    @Override
    public List<BaseEntity> loadUserFoundCategory() {
        List<BaseEntity> tbFounds= tbFoundMapper.loadAllFoundForData();
        return tbFounds;
    }
}
