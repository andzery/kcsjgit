<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.zr.cpro.servlet.User"%>
<% request.setCharacterEncoding("gb2312");%>

<body>
 <% out.println("<script language='javascript'>alert('注册成功，点击确定到登录界面!');</script>");  
   response.setHeader("refresh","1;url=login.jsp");
   %>
</body>

