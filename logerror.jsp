<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>错误提示</title>
</head>
<body>
<table align="center" bgColor="#cccccc" border="0" cellPadding="0"
	cellSpacing="0" width="273">
	<%if (request.getAttribute("error") != null) { 
	  out.println("<script language='javascript'>alert(' 登录失败，请重新登录！');</script>");  
      response.setHeader("refresh","1;url=login.jsp");//<jsp:forward page="register.jsp"/>
	 }%>
		
</table>
</body>
</html>
