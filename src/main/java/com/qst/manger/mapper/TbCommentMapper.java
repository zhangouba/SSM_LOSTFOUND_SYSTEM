package com.qst.manger.mapper;

import com.qst.manger.pojo.TbComment;
import com.qst.manger.pojoVo.TbCommentVo;

import java.util.List;

public interface TbCommentMapper {


    public void addComment(TbComment tbComment);

    void deleteByFoundId(Long foundId);

    List<TbComment> getAllcomment(String goodsId);

    List<TbComment> getAll(TbCommentVo tbCommentVo);
    void  deleteBykey(Integer id);

    List<TbComment> getCommentByUserId(Integer userId);
}