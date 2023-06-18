<%--
  Created by IntelliJ IDEA.
  User: 12632
  Date: 2023/6/17
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath(); %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%response.sendRedirect(""+path+"/UserServlet?operate=doToUser"); %>
</body>
</html>
