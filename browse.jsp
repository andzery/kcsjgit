<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>
<%@ page import="java.util.Collection,java.util.Iterator"%>
<%@ page import="com.zr.cpro.servlet.BBSMsg"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�������ҳ��</title>
<style type="text/css">
.t1 {
FONT-SIZE: 10.5pt; WORD-BREAK: break-all; BORDER-COLLAPSE: collapse; TEXT-ALIGN: justify
}
</style>

<!-- <script type="text/javascript">
function confirmExit(){
if(window.confirm(" ȷ���˳���¼��? ")){
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
		<td width="75%" bgcolor="#70A9E9" height="35" align=center><b><font color="#FFFFFF">�������</font></b></td>
		<td width="75%" colspan=8 align=center height="35" bgcolor="#70A9E9"><font color="#FFFFFF">
		<%//����û��Ѿ���¼�����������ʣ�
			if (session.getAttribute("userName") != null) {%>  
			 ��ӭ����<font color="RED"><%=session.getAttribute("userName")%></font> [<a href="logout.jsp"><font color="RED">�˳���¼</font></a>]
			   <%} else {

			%>[<a href="login.jsp"><font color="RED">��¼</font></a>]&nbsp;[<a href="register.jsp"><font color="RED">ע��</font></a>] <%}%></font>
	</tr>
</table>
<table width="100%" class="t1">
	<%if (request.getAttribute("c") == null) {

			%>
	<tr>
		<td width="75%" colspan=8 bgcolor="#FCFCFC" align=center>��û���κ����⡣</td>
	</tr>
	<%} else {
				Collection c = (Collection)request.getAttribute("c");
				if (c == null) {

				%>
	<tr>
		<td width="75%" colspan=8 bgcolor="#FCFCFC" align=center>��û���κ����⡣</td>
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
		<a href="BrowseServlet?page=1">��ҳ</a>|<a
			href="BrowseServlet?page=<%=currentPage>1?currentPage-1:1 %>">��һҳ</a>|<a
			href="BrowseServlet?page=<%=currentPage<totalPageNum?currentPage+1:totalPageNum %>">��һҳ</a>|<a
			href="BrowseServlet?page=<%=totalPageNum%>">ĩҳ</a> <%}%>
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
			color=#000000><%=msg.getItem_title()%></font>-&nbsp;<%=msg.getAuthor()%>&nbsp;<%=msg.getStrCompose_date()%>(<%=msg.getBrowsed_times()%>�ε��)
			<%if((msg.getIs_origional()==1)&&(msg.getLatest_replyer()!=null)&&(!msg.getLatest_replyer().equals(""))){%>
			[���»ظ�:<%=msg.getLatest_replyer()%>&nbsp;<%=msg.getStrLatest_reply_date()%>]<%}%>
			</td>
	</tr>
	<%}%>

	<form name="form1" method="post">
			<tr>
				<td width="" colspan=5 align=right bgcolor="#EFEFEF">
				<%for (int i = 1; i <= totalPageNum; i++) {%>
				         <a href="BrowseServlet?page=<%=i %>">[<%=i%>]</a> <%}%>
                                                          ��[<%=totalPageNum%>]ҳ
					  
					</td>
			</tr>
			</form>
	<%}
	}%>
	<tr>
		<td width="75%" colspan=8 align=center height="35" bgcolor="#EFEFEF">
		<%//����û��Ѿ���¼�����������ʣ�
			if (session.getAttribute("userName") != null) {%> [<a
			href="compose.jsp">��������</a>] <%} else {

			%>[<a href="login.jsp">��¼</a>] <%}%>
	</tr>
    <tr><td height="180px">&nbsp;</td></tr>
</table>
</center>
</body>
</html>