<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>
<%@ page import="com.zr.cpro.servlet.BBSMsg"%>
<%@ page import="java.util.Collection,java.util.Iterator"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����Ķ�ҳ��</title>
<script type="text/javascript">
function confirmDelete(id){
if(window.confirm("�����Ҫ����ɾ����Щ������?")){
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
			color="#FFFFFF">�Ķ�����</font></b></td>
	</tr>
	<tr>
		<td colspan=3 align=center bgcolor="#EFEFEF">[<a href="jlhd.jsp">�����б�</a>]
		<%if (session.getAttribute("userName") == null) {

			%>[<a href="login.jsp">��¼</a>] <%}%></td>
	</tr>
	<%if (request.getAttribute("c") == null) {

			%>
	<tr>
		<td width="75%" colspan=3 bgcolor="#FCFCFC" align=center>��û���κ����⡣</td>
	</tr>
	<%} else {
				Collection c = (Collection) request.getAttribute("c");
				Iterator iterator = c.iterator();
				while (iterator.hasNext()) {
					BBSMsg msg = (BBSMsg) (iterator.next());

					%>

	<tr>
		<td align=right bgcolor="#FCFCFC">���ߣ�&nbsp;</td>
		<td align=left bgcolor="#FCFCFC"><img src="image/<%=msg.getFace()%>.gif" border="0"><%=msg.getAuthor()%><%=(msg.getLevel() == 0 ? "����" : "�ظ�")%>��<%=msg.getStrCompose_date()%></td>
		<td align=right bgcolor="#FCFCFC"><%if(msg.getLevel()==1){%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<a href="ReadServlet?id=<%=msg.getItem_id()%>">�鿴�ظ�</a>]<%} %>
		[<a
			href="reply.jsp?fatherid=<%=msg.getItem_id() %>&title=<%=msg.getItem_title() %>">�ظ�</a>] <%
					//�����һ���ض����û��������ǡ�admin��,��ӵ��ɾ����Ȩ����
					if ("admin".equals(session.getAttribute("userName"))) {%>&nbsp;&nbsp;&nbsp;
		[<a href="javascript:confirmDelete(<%=msg.getItem_id() %>)">ɾ��</a>] <%}
					//����ǵ�ǰ���Ե����ߣ���ӵ���޸ĵ�Ȩ����
					if (msg.getAuthor().equals(session.getAttribute("userName"))) {%>&nbsp;&nbsp;&nbsp;
		[<a href="ModifyServlet?id=<%=msg.getItem_id() %>">�޸�</a>]<%}%>
		</td>
	</tr>
	<tr>
		<td bgcolor="#FCFCFC" align=right>���⣺&nbsp;</td>
		<td bgcolor="#FCFCFC" colspan=2 align=left><%=msg.getItem_title()%></td>
	</tr>	
	<tr>
		<td align=right valgin=top bgcolor="#FCFCFC">���ݣ�&nbsp;</td>
		<td align=left colspan=2 bgcolor="#FCFCFC"><%=msg.getItem_content()%></td>
	</tr>
	<tr>
		<td colspan=3 align=center bgcolor="#EFEFEF"></td>
	</tr>
	
	<%}%>
	 <tr>
		<td colspan=3 align=center bgcolor="#EFEFEF">[<a href="jlhd.jsp">�����б�</a>]
		<%if (session.getAttribute("userName") == null){%>
		[<a href="login.jsp">��¼</a>] <%}%></td>
	</tr>
	<%}%>
</table>
</div>
</body>
</html>
