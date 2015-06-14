<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>
<%if (session.getAttribute("userName") == null) {
				response.sendRedirect("login.jsp");
			}%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>问题回复页面</title>
<script language="JavaScript"><!--
function validateCompose(){ 
	var MB_TITLE = document.frmCompose.MB_TITLE.value;
	var MB_CONTENT = document.frmCompose.MB_CONTENT.value;
	if (MB_TITLE ==""){
		alert("必须填写标题！");
		return false;
	}
	if (MB_CONTENT ==""){
		alert("必须填写内容！");
	return false;
	}
}
-->
</script>
</head>
<body background="image/010.jpg">
<div align=center>
<form name="frmCompose" method="POST" action="ReplyServlet"
	onSubmit="javaScript:return validateCompose();">
<table border="0" width="75%" bgcolor="#efefef" cellspacing="0"
	cellpadding="0">
    <tr><td width="100%" height="100%" colspan="2"><img  width="100%" src="image/logo.jpg" ></td></tr>
	<tr>
		<td width="100%" align=center colspan="2" height="30"
			bgcolor="#70A9E9"><font color="#FFFFFF"><b>回复问题</b></font></td>
	</tr>
	<tr>
		<td width="33%" bgcolor="#FCFCFC" align=right>标题：&nbsp;</td>
		<td width="67%" bgcolor="#FCFCFC"><input type="text" name="MB_TITLE"
			size="50" maxlength="50" value="Re:<%=new String(request.getParameter("title").getBytes("ISO8859-1"), "gb2312")%>"></td>
	</tr>
		<tr>
		<td width="33%" bgcolor="#FCFCFC" align=right valign="top">内容：&nbsp;</td>
		<td width="67%" bgcolor="#FCFCFC"><textarea rows="10" name="MB_CONTENT"
			cols="50">
</textarea></td>
	</tr>
	<tr>
		<td width="33%" bgcolor="#FCFCFC" align=right valign="top">表情：&nbsp;</td>
		<td width="67%" bgcolor="#FCFCFC"><%for (int i = 1; i <= 40; i++) {

				%> <INPUT type="radio" value="<%=i %>" name="face" <%if(i==1){ %>checked="checked"<%} %>><img
			src="image/<%=i %>.gif"> <%if (i % 8 == 0) {
					out.println("<br>");
				}
			}

			%></td>
	</tr>
	<tr>
		<td width="33%" bgcolor="#FCFCFC" align=right>回复者：&nbsp;</td>
		<td width="67%" bgcolor="#FCFCFC"><font color=#FF0000><input type="hidden" value="<%=session.getAttribute("userName")%>" name="username"/><label><%=session.getAttribute("userName")%></label></font>
		</td>
	</tr>
	<tr>
		<td width="100%" align=center colspan="2" height="50"><input
			type="hidden" name="fatherid" value="<%=request.getParameter("fatherid")%>"> <input type="submit"
			value="提交" name="submit">&nbsp;&nbsp; <input type="reset" value="重置"
			name="reset"></td>
	</tr>
</table>
</form>
</div>
</body>
</html>
