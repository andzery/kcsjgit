<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>
<%@ page import="com.zr.cpro.servlet.BBSMsg"%>
<%@ page import="java.util.Collection,java.util.Iterator"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>问题阅读页面</title>
<script type="text/javascript">
function confirmDelete(id){
if(window.confirm("您真的要彻底删除这些留言吗?")){
window.location="DeleteServlet?id="+id;
}
}
</script>
</head>

<body background="image/010.jpg">
<div align=center>
<table border="0" width="75%" cellspacing="0" cellpadding="0"
	bordercolorlight="#000000" bordercolordark="#FFFFFF">
    <tr><td width="100%" height="100%" colspan="3"><img  width="100%"  src="image/logo.jpg"></td></tr>
	<tr>
		<td width="75%" colspan=3 bgcolor="#70A9E9" height="35" align=center><b><font
			color="#FFFFFF">阅读问题</font></b></td>
	</tr>
	<tr>
		<td colspan=3 align=center bgcolor="#EFEFEF">[<a href="jlhd.jsp">回主列表</a>]
		<%if (session.getAttribute("userName") == null) {

			%>[<a href="login.jsp">登录</a>] <%}%></td>
	</tr>
	<%if (request.getAttribute("c") == null) {

			%>
	<tr>
		<td width="75%" colspan=3 bgcolor="#FCFCFC" align=center>还没有任何问题。</td>
	</tr>
	<%} else {
				Collection c = (Collection) request.getAttribute("c");
				Iterator iterator = c.iterator();
				while (iterator.hasNext()) {
					BBSMsg msg = (BBSMsg) (iterator.next());

					%>

	<tr>
		<td align=right bgcolor="#FCFCFC">作者：&nbsp;</td>
		<td align=left bgcolor="#FCFCFC"><img src="image/<%=msg.getFace()%>.gif" border="0"><%=msg.getAuthor()%><%=(msg.getLevel() == 0 ? "发表" : "回复")%>于<%=msg.getStrCompose_date()%></td>
		<td align=right bgcolor="#FCFCFC"><%if(msg.getLevel()==1){%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<a href="ReadServlet?id=<%=msg.getItem_id()%>">查看回复</a>]<%} %>
		[<a
			href="reply.jsp?fatherid=<%=msg.getItem_id() %>&title=<%=msg.getItem_title() %>">回复</a>] <%
					//如果是一个特定的用户，这里是“admin”,则拥有删除的权利：
					if ("admin".equals(session.getAttribute("userName"))) {%>&nbsp;&nbsp;&nbsp;
		[<a href="javascript:confirmDelete(<%=msg.getItem_id() %>)">删除</a>] <%}
					//如果是当前留言的作者，则拥有修改的权利：
					if (msg.getAuthor().equals(session.getAttribute("userName"))) {%>&nbsp;&nbsp;&nbsp;
		[<a href="ModifyServlet?id=<%=msg.getItem_id() %>">修改</a>]<%}%>
		</td>
	</tr>
	<tr>
		<td bgcolor="#FCFCFC" align=right>标题：&nbsp;</td>
		<td bgcolor="#FCFCFC" colspan=2 align=left><%=msg.getItem_title()%></td>
	</tr>	
	<tr>
		<td align=right valgin=top bgcolor="#FCFCFC">内容：&nbsp;</td>
		<td align=left colspan=2 bgcolor="#FCFCFC"><%=msg.getItem_content()%></td>
	</tr>
	<tr>
		<td colspan=3 align=center bgcolor="#EFEFEF"></td>
	</tr>
	
	<%}%>
	 <tr>
		<td colspan=3 align=center bgcolor="#EFEFEF">[<a href="jlhd.jsp">回主列表</a>]
		<%if (session.getAttribute("userName") == null){%>
		[<a href="login.jsp">登录</a>] <%}%></td>
	</tr>
	<%}%>
</table>
</div>
</body>
</html>
