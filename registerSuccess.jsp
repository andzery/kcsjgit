<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.zr.cpro.servlet.User"%>
<% request.setCharacterEncoding("gb2312");%>

<body>
 <% out.println("<script language='javascript'>alert('ע��ɹ������ȷ������¼����!');</script>");  
   response.setHeader("refresh","1;url=login.jsp");
   %>
</body>

