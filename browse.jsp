<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>
<%@ page import="java.util.Collection,java.util.Iterator"%>
<%@ page import="com.zr.cpro.servlet.BBSMsg"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>问题浏览页面</title>
<style type="text/css">
.t1 {
FONT-SIZE: 10.5pt; WORD-BREAK: break-all; BORDER-COLLAPSE: collapse; TEXT-ALIGN: justify
}
</style>

<!-- <script type="text/javascript">
function confirmExit(){
if(window.confirm(" 确认退出登录吗? ")){
 session.removeAttribute(" userName ");
 session.invalidate();
 response.sendRedirect("index.jsp");
}
}
</script> -->
</head>

<body background="image/010.jpg">
<center>
<table width="100%">
<tr height="50%"><td width="100%" height="100%" colspan="2"><img  width="100%"    src="image/logo.jpg"></td></tr>
	<tr>
		<td width="75%" bgcolor="#70A9E9" height="35" align=center><b><font color="#FFFFFF">浏览问题</font></b></td>
		<td width="75%" colspan=8 align=center height="35" bgcolor="#70A9E9"><font color="#FFFFFF">
		<%//如果用户已经登录，则允许提问：
			if (session.getAttribute("userName") != null) {%>  
			 欢迎您！<font color="RED"><%=session.getAttribute("userName")%></font> [<a href="logout.jsp"><font color="RED">退出登录</font></a>]
			   <%} else {

			%>[<a href="login.jsp"><font color="RED">登录</font></a>]&nbsp;[<a href="register.jsp"><font color="RED">注册</font></a>] <%}%></font>
	</tr>
</table>
<table width="100%" class="t1">
	<%if (request.getAttribute("c") == null) {

			%>
	<tr>
		<td width="75%" colspan=8 bgcolor="#FCFCFC" align=center>还没有任何问题。</td>
	</tr>
	<%} else {
				Collection c = (Collection)request.getAttribute("c");
				if (c == null) {

				%>
	<tr>
		<td width="75%" colspan=8 bgcolor="#FCFCFC" align=center>还没有任何问题。</td>
	</tr>
	<%} else {
					int totalPageNum = ((Integer) (request.getAttribute("totalPageNum"))).intValue();
					int currentPage = 1;
					if (request.getParameter("page") != null) {
						currentPage = Integer.parseInt(request.getParameter("page"));
					}
					Iterator iterator = c.iterator();
%>
	<tr>
		<td width="75%" colspan=8 align=right height="20" bgcolor="#EFEFEF"><%if (totalPageNum > 1) {%>
		<a href="BrowseServlet?page=1">首页</a>|<a
			href="BrowseServlet?page=<%=currentPage>1?currentPage-1:1 %>">上一页</a>|<a
			href="BrowseServlet?page=<%=currentPage<totalPageNum?currentPage+1:totalPageNum %>">下一页</a>|<a
			href="BrowseServlet?page=<%=totalPageNum%>">末页</a> <%}%>
	</tr>
<%
						while (iterator.hasNext()) {
						BBSMsg msg = (BBSMsg) iterator.next();

						%>
	<tr>
		<td width="100%">
		<hr size=1 color=#99ccff>
		<%for (int i = 0; i < msg.getLevel(); i++) {%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%}%>
		<a href="ReadServlet?id=<%=msg.getItem_id()%>"> 
		<img src="image/<%=msg.getFace()%>.gif" border="0"><font
			color=#000000><%=msg.getItem_title()%></font>-&nbsp;<%=msg.getAuthor()%>&nbsp;<%=msg.getStrCompose_date()%>(<%=msg.getBrowsed_times()%>次点击)
			<%if((msg.getIs_origional()==1)&&(msg.getLatest_replyer()!=null)&&(!msg.getLatest_replyer().equals(""))){%>
			[最新回复:<%=msg.getLatest_replyer()%>&nbsp;<%=msg.getStrLatest_reply_date()%>]<%}%>
			</td>
	</tr>
	<%}%>

	<form name="form1" method="post">
			<tr>
				<td width="" colspan=5 align=right bgcolor="#EFEFEF">
				<%for (int i = 1; i <= totalPageNum; i++) {%>
				         <a href="BrowseServlet?page=<%=i %>">[<%=i%>]</a> <%}%>
                                                          共[<%=totalPageNum%>]页
					  
					</td>
			</tr>
			</form>
	<%}
	}%>
	<tr>
		<td width="75%" colspan=8 align=center height="35" bgcolor="#EFEFEF">
		<%//如果用户已经登录，则允许提问：
			if (session.getAttribute("userName") != null) {%> [<a
			href="compose.jsp">发表问题</a>] <%} else {

			%>[<a href="login.jsp">登录</a>] <%}%>
	</tr>
    <tr><td height="180px">&nbsp;</td></tr>
</table>
</center>
</body>
</html>