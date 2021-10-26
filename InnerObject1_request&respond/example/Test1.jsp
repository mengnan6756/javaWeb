<!--login.jsp-->
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户登录</title>
</head>
<body>
<h1>用户登录</h1>
<hr>
<!-- 判断用户是否选择了七天内免登录，如果选择了，则输入框内初始化为用户的账户信息 -->
<%
    request.setCharacterEncoding("utf-8");
    String username = "";
    String password = "";
    Cookie[] cookies = request.getCookies();
    if(cookies != null && cookies.length > 0) {
        for(Cookie c:cookies) {

            if(c.getName().equals("usernameCookie")) {
                // 解码
                username = URLDecoder.decode(c.getValue(), "utf-8");
            } else if(c.getName().equals("passwordCookie")) {
                password = URLDecoder.decode(c.getValue(), "utf-8");
            }

        }
    }
%>
<div>
    <form action="dologin.jsp" method = "post">
        <table>
            <tr>
                <td>用户名</td>
                <td><input type = "text" name = "username" value = "<%=username%>"></td>
            </tr>
            <tr>
                <td>密码</td>
                <td><input type = "password" name = "password" value = "<%=password%>"></td>
            </tr>
            <tr>
                <td style = "margin-left:1px"><input type = "checkbox" name = "isChecked" checked = "checked">七天免登录</td>
                <td style = "margin-right:-1px"><input type = "submit" value = "submit"></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>