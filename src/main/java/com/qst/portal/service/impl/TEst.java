package com.qst.portal.service.impl;

import com.qst.manger.utils.Mailutils;
import com.qst.manger.utils.RandomUtils;

public class TEst {

    public static void main(String[] args) {

       Mailutils.mailUs("1120857854@qq.com","重置密码操作", RandomUtils.createRandomStringCode());

    }
}
