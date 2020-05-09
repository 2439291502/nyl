<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/5/7
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/student/login" method="get">
    用户名:<input type="text" name="name" >
    密码:<input type="password" name="password">
        <input type="submit" value="登录">
</form>
</body>
</html>
>