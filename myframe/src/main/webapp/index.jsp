<!DOCTYPE html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>主页</title>
    <script src="js/jquery.min.js"></script>
</head>
<body>
<input type="submit" value="加载"/>
<div>
${list}
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
             
            }

        });
    })
</script>
</body>
</html>