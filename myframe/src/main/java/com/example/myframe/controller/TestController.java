package com.example.myframe.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.myframe.entity.ReportBean;
import com.example.myframe.service.BaseService;
import com.example.myframe.util.RedisUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class TestController {

    private static  final Logger logger= LoggerFactory.getLogger(TestController.class);
    @Autowired
    private BaseService baseService;
    @Autowired
    private RedisUtils redisUtils;
    @RequestMapping(value="/find")
    public String get(HttpServletRequest request){
        //List<ReportBean> list=baseService.get();
        //request.getSession().setAttribute("list",list);
        request.setAttribute("current",1);
        request.setAttribute("size",5);
        return "index";
    }
    @RequestMapping(value="/get")
    @ResponseBody
    public IPage<ReportBean> getPage(@RequestParam(value="current",defaultValue ="1") Integer current,
                                     @RequestParam(value="size",defaultValue = "5") Integer size,
                                     HttpServletRequest request){
        Page<ReportBean> page=new Page<>(current,size);
        IPage<ReportBean> iPage=baseService.getPage(page);
        //String ss=redisUtils.get("s1").toString();
        request.setAttribute("current",current);
        request.setAttribute("size",size);
        request.setAttribute("total",iPage.getTotal());
        return iPage;
    }
}
