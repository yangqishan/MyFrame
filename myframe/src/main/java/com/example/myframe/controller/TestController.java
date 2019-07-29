package com.example.myframe.controller;

import com.example.myframe.entity.ReportBean;
import com.example.myframe.service.BaseService;
import com.example.myframe.util.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class TestController {

    @Autowired
    private BaseService baseService;
    @RequestMapping(value="/find")
    @ResponseBody
    public void get(HttpServletRequest request){
        List<ReportBean> list=baseService.get();
        request.getSession().setAttribute("list",list);
    }
}
