<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.zr.cpro.servlet.*"%>
<% request.setCharacterEncoding("gb2312");%>
 

<head>
 <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>高级语言程序设计互动注册页面</title>
<style type="text/css">
<!--
.STYLE2 {font-size: 24px;color: #9966FF;}
.STYLE5 {font-size: 18px; color: #9966FF; }
.STYLE7 {color: #663300;font-size: 36px;}
-->
</style>
<script language="JavaScript">
function ValidateLoginForm(form)
{
   if (form1.txtUserName.value == "")
   {
      alert("请输入用户名");
      return false
   }
      if (form1.txtPassword.value == "")
   {
      alert("请输入密码");
      return false
   }
   else if((form1.txtPassword.value.length<6)||(form1.txtPassword.value.length>20))
        {
	  alert("密码必须是6-20位字母或数字组合");
	  return false;
         }
      if (form1.txtConfPassword.value == "")
      {
      alert("请输入确认密码");
      return false
      }
   else if(form1.txtPassword.value!=form1.txtConfPassword.value)
      {
	alert("两次密码不同！");
	return false;
       }
	  if(form1.txtMajor.value=="")
	     {alert("请输入所修专业！");
		 return false;}
	  if(form1.txtEmail.value=="")
	   {
		   alert("请输入邮箱！");
		   return false;
		   }
		   else {
			    if(form1.txtEmail.value.length>50||form1.txtEmail.value.length<7)
				  {
				  alert("邮件的长度应在7到50之间！");
				  return false;
				  }
				 else if(form1.txtEmail.value.indexOf("@")==-1){
                    alert("没有\"@\"符号,非法邮件地址！");
					return false;}
					else if(form1.txtEmail.value.indexOf(".")==-1){
						alert("没有\".\"符号,非法邮件地址！");
						return false;
					}
				 }
	       
return true;
}
 </script>
</head>
<center>
<body background="image/010.jpg">
<div align="center">
<form id="form1" name="form1" method="post" action="CheckRegisterServlet" onSubmit="return ValidateLoginForm(this)">
  
    <table border="0" width="75%" bgcolor="#efefef" cellspacing="0" cellpadding="0">
      <tr><td width="100%" height="100%" colspan="2"><img width="100%" src="image/logo.jpg" ></td></tr>
      <tr>
        <td width="100%" align=center colspan="2" height="30"
			bgcolor="#70A9E9"><font color="#FFFFFF"><marquee direction ="lift" behavior="scroll" scrollamount="3"><b>欢迎来到高级语言程序设计互动交流平台！</b></marquee></font></td>
 
      </tr>
      <% Object errorMsg = request.getAttribute("result");
	     User user = (User) request.getAttribute("user");
		 if (errorMsg != null)
		 {%>
         <tr><td colspan="2" align="center" height="26"><font size="4" color="RED"><b>注册失败！<%=errorMsg.toString()%></b></font></td></tr><%}%>
         <tr><td>&nbsp;</td></tr>
       <tr><td align="center"colspan="2"><font color="RED" size="4"><b>用户注册</b></font></td></tr>
       <tr><td>&nbsp;</td></tr>
       <tr>
        <td height="26" align="right" width="44%"><span class="STYLE5">用户名:</span></td>
         <td >  <input type="text" name="txtUserName" value="<%=(user==null)?"":user.getUserName()%>"><font size="2" color="#FF0000">*</font>
         </td>
      </tr>
      <tr><td>&nbsp;</td></tr>
       <tr>
        <td height="26" align="right" width="44%"><span class="STYLE5">密码:</span></td>
        <td  >   
          <input type="password" name="txtPassword" value="<%=(user==null)?"":user.getUserPwd()%>" /><font size="2" color="#FF0000">*(6-20位)</font>
         </td>
      </tr> 
      <tr><td>&nbsp;</td></tr>
      <tr>
        <td height="26" align="right" width="44%"><span class="STYLE5">确认密码:</span></td>
          <td > 
          <input type="password" name="txtConfPassword" value="<%=(user==null)?"":user.getUserPwd()%>" /><font size="2" color="#FF0000">*</font>
         </td>
      </tr>
      <tr><td>&nbsp;</td></tr>
      <tr>
        <td height="26" align="right" width="44%"><span class="STYLE5">所修专业:</span></td>
         <td >  
          <input type="text" name="txtMajor" value="<%=(user==null)?"":user.getUserMajor()%>" />
         </td>
      </tr>
      <tr><td>&nbsp;</td></tr>
<tr>
        <td height="26" align="right" width="44%"><span class="STYLE5">性别:</span></td>
        <td > 
          <select size="1" name="sltGender">
			<%if (user == null) {

			%>
			<option selected value="">--</option>
			<%} else 
			{
			%>
			<option selected value="<%=user.getGender()%>"><%=user.getGender() == 0 ? "女" : "男"%></option>
			<%}

			%>
			<option value="0">女</option>
			<option value="1">男</option>
		</select
             
        ></td>
      </tr>
      <tr><td>&nbsp;</td></tr>
<tr>
        <td height="26" align="right" width="44%"><span class="STYLE5">邮箱:</span></td>
        <td >  
          <input type="text" name="txtEmail" value="<%=(user==null)?"":user.getEmail()%>" />
         </td>
      </tr>
      <tr><td>&nbsp;</td></tr>
      <tr>
        <td align="center" height="10" colspan="2" ><input type="submit" name="Submit" value="提交" /> 　　　
          <input type="reset" name="Reset" value="重置" />
         </td>
      </tr>
     <tr><td height="100">&nbsp;</td></tr>
     </table>
  
</form>
</div>
</body>
</center>
</html>
