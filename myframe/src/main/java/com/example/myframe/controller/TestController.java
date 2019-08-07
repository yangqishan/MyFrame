package com.example.myframe.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.myframe.aop.Permission;
import com.example.myframe.dao.UserDao;
import com.example.myframe.entity.ReportBean;
import com.example.myframe.entity.UserBean;
import com.example.myframe.service.BaseService;
import com.example.myframe.service.UserService;
import com.example.myframe.util.RedisUtils;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@Slf4j
public class TestController {

    private static  final Logger logger= LoggerFactory.getLogger(TestController.class);
    @Autowired
    private BaseService baseService;
    @Autowired
    private UserService userService;
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

    @RequestMapping(value ="/userlogin")
    @ResponseBody
    public String user(@RequestParam(value="name") String name,
                       @RequestParam(value="password") String pswd,
                       HttpServletRequest request){
        UserBean userBean=userService.get(name);
        if(pswd.equals(userBean.getPswd())){
            request.getSession().setAttribute("name",name);
            return "登录成功";
        }else{
            return "密码错误";
        }
    }
    @GetMapping(value = "/findByname")
    @Permission
    @ResponseBody
    public String login(){
        return "有权限";
    }

}
