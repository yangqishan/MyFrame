<!DOCTYPE html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>主页</title>
    <link rel="stylesheet" href="./css/x-admin.css" media="all">
    <script src="js/jquery.min.js"></script>
</head>
<body>
<input type="submit" onclick="loading()" value="加载"/>
<table>
    <tr class="layui-table">
        <td><input type="checkbox"/>全选/取消</td>
        <td >编号</td>
        <td >成绩单序号</td>
        <td >姓名</td>
        <td >科目</td>
        <td >试卷名称</td>
        <td >成绩</td>
        <td >考试时间</td>
        <td >试卷答案</td>
        <td >操作</td>
    </tr>
</table>
<div id="table" style="display: none;">
    <table >


    </table>
</div>
<script type="text/javascript">
    var table=$("#table");
    var current=${current};
    var size=${size};
   function loading() {
       table.empty();
        $.ajax({
            url:"get",
            type:"post",
            dataType:"json",
            data:{
                current:current,
                size:size
            },
            success:function (data) {
             //alert(data[0].achievement
               for(var i=0;i<data.records.length;i++){
                   table.append('<tr class="layui-table" style="cursor:pointer" ondblclick="edit(this)">\n' +
                       '            <td><input type="checkbox"/></td>\n' +
                       '            <td>'+data.records[i].id+'</td>\n' +
                       '            <td>'+data.records[i].name+'</td>\n' +
                       '            <td>'+data.records[i].subject+'</td>\n' +
                       '            <td>'+data.records[i].title+'</td>\n' +
                       '            <td>'+data.records[i].achievement+'</td>\n' +
                       '            <td>'+data.records[i].addtime+'</td>\n' +
                       '            <td>'+data.records[i].ranswer+'</td>\n' +
                       '        </tr>')
                }
                table.append('<a href="#" onclick="--current;loading();">上一页</a><a href="#" onclick="++current;loading();">下一页</a>')
                table.slideDown();
            }

        });
    }
    function edit(obj) {
       $(obj).find("td").eq(0).html('<input value="'+$(obj).find("td").eq(0).text()+'">')
        $(obj).find("td").eq(1).html('<input value="'+$(obj).find("td").eq(1).text()+'">')
        $(obj).find("td").eq(2).html('<input value="'+$(obj).find("td").eq(2).text()+'">')
        $(obj).find("td").eq(3).html('<input value="'+$(obj).find("td").eq(3).text()+'">')
        $(obj).find("td").eq(4).html('<input value="'+$(obj).find("td").eq(4).text()+'">')
        $(obj).find("td").eq(5).html('<input value="'+$(obj).find("td").eq(5).text()+'">')
        $(obj).find("td").eq(6).html('<input value="'+$(obj).find("td").eq(6).text()+'">')
    }
</script>
</body>
</html>