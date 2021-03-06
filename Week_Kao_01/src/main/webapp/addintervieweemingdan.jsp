<%@ page contentType="text/html; charset=utf-8" language="java"
		 import="java.sql.*" errorPage="" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>添加用户</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script type="text/javascript" src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>

    <script type="text/javascript">
        $(function () {
        	//alert(name)
            $("#name").blur(function () {
                //失去焦点判断
                var  name  = $("#name").val();
                //alert(name)
                $.post("${pageContext.request.contextPath}/visitor/likeIntervieweeName",{intervieweeName:name},function (data) {
                    if (data==null){
                        alert("这个公司没有这个人")
                    }else {
                        //alert(data)
                        //alert(data.interviewee_name)
                        $("#company").val(data.interviewee_name);
                        $("#phone").val(data.interviewee_phone);
                        $("#sex").val(data.interviewee_sex);
                    }
                })
            })
        })
    </script>
</head>
<body>
<div class="container">
    <center><h3>访问申请单</h3></center>
    <form action="${pageContext.request.contextPath}/visitor/addVisitor" method="post" id="form">
        <div class="form-group">
            <label for="name">姓名：</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="请输入被申请人姓名" value="">
        </div>

        <div class="form-group">
            <label>性别：</label>
           <%-- <input type="radio" name="sex" value="男" checked="checked"/>男
            <input type="radio" name="sex" value="女"/>女--%>
            <input type="text" id="sex" name="sex" value="">
        </div>

        <div class="form-group">
            <label for="company">公司：</label>
            <input type="text" class="form-control" id="company" name="company" placeholder="请输入公司" value="">
        </div>

       <div class="form-group">
            <label for="phone">电话：</label>
            <input type="text" class="form-control" id="phone" name="phone" placeholder="请输入电话" value="">
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交申请"/>
            <input class="btn btn-default" type="reset" value="重置" id="b3"/>
            <input class="btn btn-default" type="button" value="返回" id="b2"/>
        </div>
    </form>
</div>
<script>
    /*返回*/
    document.getElementById("b2").onclick = function () {
        window.location.href = "${pageContext.request.contextPath}/FindUserByPageServlet";
    };
    /*重置*/
    document.getElementById("b3").onclick = function () {
        document.getElementById("form").reset();
    };
</script>
</body>
</html>