package com.qst.manger.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.qst.manger.mapper.NewsMapper;
import com.qst.manger.pojo.News;
import com.qst.manger.pojoVo.NewsVo;
import com.qst.manger.service.NewsService;
import com.qst.manger.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {
   @Autowired
   private NewsMapper newsMapper;

    @Override
    public DataGridView queryAllNews(NewsVo newsVo) {
        Page<Object> page= PageHelper.startPage(newsVo.getPage(),newsVo.getLimit());
        List<News> data=newsMapper.queryAllNews(newsVo);
        return new DataGridView(page.getTotal(),data);
    }

    @Override
    public void addNews(NewsVo newsVo) {
     newsMapper.insertSelective(newsVo);
    }

    @Override
    public void deleteNews(Integer newsVo) {
        newsMapper.deleteByPrimaryKey(newsVo);
    }

    @Override
    public void deleteBatchNews(Integer[] ids) {
         for (Integer id:ids){
             deleteNews(id);
         }
    }

    @Override
    public void updateNews(NewsVo newsVo) {
        newsMapper.updateByPrimaryKeySelective(newsVo);
    }

    @Override
    public News queryNewsById(Integer newsid) {
        News news=new News();
        news=newsMapper.selectByPrimaryKey(newsid);
        return news;
    }
}
