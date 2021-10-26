<!--user_info.jsp-->
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户信息界面</title>
</head>
<body>
<h1>用户信息界面</h1>
<hr>
<%
    // 读取cookie里的信息
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
用户名:<%=username %><br>
密码:<%=password %><br>
</body>
</html>