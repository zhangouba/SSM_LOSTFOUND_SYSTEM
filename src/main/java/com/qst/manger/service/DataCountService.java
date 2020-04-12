package com.qst.manger.service;

import com.qst.manger.pojo.Data.BaseEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface DataCountService {
    List<BaseEntity> loadUserLostCategory();

    List<BaseEntity> loadUserFoundCategory();
}
