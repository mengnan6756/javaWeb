<%@ page import="java.net.URLEncoder" %><%--
  Created by IntelliJ IDEA.
  User: WEI
  Date: 2021/10/20 0020
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录检查页面</title>
</head>
<body>

    <%
        //设置编码方式
        request.setCharacterEncoding("utf-8");

        String isChecked[] = request.getParameterValues("isChecked");


        if(isChecked!=null && isChecked.length>0){       //判断是否勾选了记住登陆状态
            //获取输入的账号和密码，为了防止中文乱码，需要先进行编码
            String account = URLEncoder.encode(request.getParameter("account"), "utf-8");
            String password = URLEncoder.encode(request.getParameter("password"), "utf-8");

            //新建Cookie对象
            Cookie accountCookie = new Cookie("accountCookie",account);
            Cookie passwordCookie = new Cookie("passwordCookie",password);

            //设置Cookie的存活时间（7天）
            accountCookie.setMaxAge(604800);
            passwordCookie.setMaxAge(604800);

            //写入Cookie对象
            response.addCookie(accountCookie);
            response.addCookie(passwordCookie);

        }else{  //用户没有选择记住登录状态，则需要清除Cookie信息
            Cookie cookies[] = request.getCookies();

            if (cookies!=null && cookies.length>0){

                for (Cookie c : cookies){  //遍历cookies
                    if (c.getName().equals("accountCookie") || c.getName().equals("passwordCookie")){
                        // 使cookie过期
                        c.setMaxAge(0);
                        response.addCookie(c);
                    }
                }
            }

        }


        //重定向到欢迎页面
        response.sendRedirect("welcomePage.jsp");
    %>

</body>
</html>
