package com.example.myframe.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.myframe.entity.ReportBean;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface BaseDao extends BaseMapper<ReportBean> {

    List<ReportBean> getAll();
}
