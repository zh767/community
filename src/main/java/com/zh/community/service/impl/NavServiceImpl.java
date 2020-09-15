package com.zh.community.service.impl;

import com.zh.community.mapper.NavMapper;
import com.zh.community.model.Nav;
import com.zh.community.model.NavExample;
import com.zh.community.service.NavService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class NavServiceImpl implements NavService {
    @Autowired
    private NavMapper navMapper;

    public List<Nav> list() {
        NavExample navExample = new NavExample();
        navExample.createCriteria()
                .andStatusEqualTo(1);
        navExample.setOrderByClause("priority desc");
        List<Nav> navs = navMapper.selectByExample(navExample);
        return navs;
    }
}
