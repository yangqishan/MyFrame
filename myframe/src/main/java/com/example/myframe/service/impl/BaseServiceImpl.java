package com.example.myframe.service.impl;

import com.example.myframe.dao.BaseDao;
import com.example.myframe.entity.ReportBean;
import com.example.myframe.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BaseServiceImpl  implements BaseService {
    @Autowired
    private BaseDao baseDao;
    @Override
    public List<ReportBean> get() {
        return baseDao.getAll();
    }
}
