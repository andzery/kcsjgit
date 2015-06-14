<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
 <%@ page contentType="text/html; charset=gbk" language="java"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
<%
session.removeAttribute("username");
session.invalidate();
response.sendRedirect("jlhd.jsp");
%>
</body>
</html>
