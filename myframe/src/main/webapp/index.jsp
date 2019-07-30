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
<input type="submit" value="加载"/>
<div id="table" style="display: none">
    <table >
        <tr class="layui-table">
        <td >编号</td>
        <td >姓名</td>
        <td >科目</td>
        <td >试卷名称</td>
        <td >成绩</td>
        <td >考试时间</td>
        <td >试卷答案</td>
        <td >操作</td>
        </tr>
    </table>
</div>
<script type="text/javascript">

    $("input").click(function () {
        $.ajax({
            url:"find",
            type:"post",
            dataType:"json",
            data:{

            },
            success:function (data) {
             //alert(data[0].achievement)
                var table=$("#table");
               for(var i=0;i<data.length;i++){
                   table.append('<tr class="layui-table" style="cursor:pointer" ondblclick="edit(this)">\n' +
                       '            <td>'+data[i].id+'</td>\n' +
                       '            <td>'+data[i].name+'</td>\n' +
                       '            <td>'+data[i].subject+'</td>\n' +
                       '            <td>'+data[i].title+'</td>\n' +
                       '            <td>'+data[i].achievement+'</td>\n' +
                       '            <td>'+data[i].addtime+'</td>\n' +
                       '            <td>'+data[i].ranswer+'</td>\n' +
                       '        </tr>')
                }
                table.slideDown();
            }

        });
    })
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