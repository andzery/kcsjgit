<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>错误提示页面</title>
</head>
<body background="image/010.jpg">
<table align="center" bgColor="#70A9E9" border="0" cellPadding="0"
	cellSpacing="0" width="273">
	<%if (request.getAttribute("error") != null) {%>
	<tr>
		<td   colspan=2 height="50" align=center><strong><font color="red"><%=request.getAttribute("error")%></font></strong>
		</td>
	</tr>
	<%}

		%>
		<tr>
		<td colspan=2  height="50" align=center > <strong><a href="javascript:history.back();"><font color="red">返回</font></a></strong>
		</td>
	</tr>
</table>
</body>
</html>
