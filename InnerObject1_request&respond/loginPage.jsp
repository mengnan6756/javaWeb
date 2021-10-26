<%@ page import="java.net.URLDecoder" %>

<%--
  Created by IntelliJ IDEA.
  User: WEI
  Date: 2021/10/20 0020
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
</head>
<body>
您好，请登录！
    <%
        //设置编码方式    ，避免中文乱码
        request.setCharacterEncoding("utf-8");

        //设置两个变量并初始化存储账号和密码
        String account ="";
        String password ="";

        //从Cookie获取账号和密码
        Cookie []cookies = request.getCookies();

        if (cookies !=null && cookies.length>0){    //判断cookies是否为0

            //遍历提取cookies对象
            for (Cookie c :cookies){        //通过foreach循环遍历

                if (c.getName().equals("accountCookie")){
                    account = URLDecoder.decode(c.getValue(), "utf-8");  //赋值给账号，需要先解码
                }else if (c.getName().equals("passwordCookie")){
                    password = URLDecoder.decode(c.getValue(), "utf-8"); //赋值给密码
                }

            }

        }


    %>

    <form action="checkPage.jsp" method="post">
        账号：<input type="text" name="account" value="<%=account%>"><br>
        密码：<input type="password" name="password"value="<%=password%> "><br>
        是否记住登录状态：<input type="checkbox" name="isChecked" >是<br>
        <input type="submit" value="登录">
    </form>

</body>
</html>
