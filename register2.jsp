<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.zr.cpro.servlet.*"%>
<% request.setCharacterEncoding("gb2312");%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>ȷ��ע��ҳ��</title>
<style type="text/css">
<!--
.STYLE2 {
	font-size: 24px;
	color: #9966FF;
}
.STYLE5 {font-size: 18px; color: #9966FF; }
.STYLE7 {
	color: #663300;
	font-size: 36px;
}
-->
</style>
<script language="JavaScript">
function ValidateLoginForm(form)
{
   if (form.user.value == "")
   {
      alert("�������û���");
      return false
   }
      if (form.pwd1.value == "")
   {
      alert("����������");
      return false
   }
   else if((form.pwd1.value.length<6)||(form.pwd1.value.length>20))
        {
	  alert("���������6-20λ��ĸ���������");
	  return false;
         }
      if (form.pwd2.value == "")
      {
      alert("������ȷ������");
      return false
      }
   else if(form.pwd1.value!=form.pwd2.value)
      {
	alert("�������벻ͬ��");
	return false;
       }
	  if(form.major.value=="")
	     {alert("����������רҵ��");
		 return false;}
	  if(form.mail.value=="")
	   {
		   alert("���������䣡");
		   return false;
		   }
		   else {
			    if(form.mail.value.length>50)
				  {
				  alert("�ʼ���λ�����ܳ���50��");
				  return false;
				  }
				 else if(form.mail.value.indexOf("@")==-1){
                    alert("û��\"@\"����,���Ǹ���Ч���ʼ���ַ��");
					return false;}
					else if(form.mail.value.indexOf(".")==-1){
						alert("û��\".\"����,���Ǹ���Ч���ʼ���ַ��");
						return false;
					}
							   
			   }
	       
return tue
}
 </script>
</head>
<center>
<body  background="image/010.jpg">
<div align="center">
<form id="form1" name="form1" method="post" action="RegisterServlet" onSubmit="return ValidateLoginForm(this)">
  
    <table border="0" width="75%" bgcolor="#efefef" cellspacing="0" cellpadding="0">
      <tr><td width="100%" height="100%" colspan="2"><img width="100%" src="image/logo.jpg" ></td></tr>
       <tr>
        <td width="100%" align=center colspan="2" height="30"
			bgcolor="#70A9E9"><font color="#FFFFFF"><marquee direction ="lift" behavior="scroll" scrollamount="3"><b>��ӭ�����߼����Գ�����ƻ�������ƽ̨��</b></marquee></font></td>
 
      </tr>
      <tr><td>&nbsp;</td></tr>
      <tr><td align="center"colspan="2"><font color="RED" size="4"><b>�û�ע��ȷ����Ϣ</b></font></td></tr>
       <% User user = (User) request.getAttribute("user");%>
       <tr><td>&nbsp;</td></tr>
       <tr>
        <td height="26" align="right" width="44%"><span class="STYLE5">�û���:</span></td>
         <td  ><%=(user == null)?"":user.getUserName()%><input type="hidden" name="txtUserName" value="<%=(user==null)?"":user.getUserName()%>">
         </td>
      </tr>
      <tr><td>&nbsp;</td></tr>
       <tr>
        <td height="26" align="right" width="44%"><span class="STYLE5">����:</span></td>
        <td ><%=(user == null)?"":user.getUserPwd()%>   
          <input type="hidden" name="txtPassword" value="<%=(user==null)?"":user.getUserPwd()%>" /><input type="hidden" name="txtConfPassword" value="<%=(user==null)?"":user.getUserPwd()%>" />
         </td>
      </tr> <tr><td>&nbsp;</td></tr>
     <tr>
        <td height="26" align="right" width="44%"><span class="STYLE5">����רҵ:</span></td>
         <td ><%=(user==null)?"":user.getUserMajor()%>  
          <input type="hidden" name="txtMajor" value="<%=(user==null)?"":user.getUserMajor()%>" />
         </td>
      </tr><tr><td>&nbsp;</td></tr>
<tr>
        <td height="26" align="right" width="44%"><span class="STYLE5">�Ա�:</span></td>
        <td ><%=user.getGender() == 0 ? "Ů" : "��"%> <%if (user != null) {

				%> <input type="hidden" name="sltGender"
			value="<%=user.getGender()%>"> <%}

			%>
         </td>
      </tr><tr><td>&nbsp;</td></tr>
<tr>
        <td height="26" align="right" width="44%"><span class="STYLE5">����:</span></td>
        <td > <%=(user==null)?"":user.getEmail()%> 
          <input type="hidden" name="txtEmail" value="<%=(user==null)?"":user.getEmail()%>" />
         </td>
      </tr><tr><td>&nbsp;</td></tr>
      <tr>
        <td height="10" colspan="2"  align="center"><input type="button" name="edit" value="�޸�" onClick="javascript:history.go(-1);" />����������<input type="submit" name="Submit" value="�ύ" /> ������
          
         </td>
      </tr>
     
     </table>
  
</form>
</div>
</body>
</center>
</html>
