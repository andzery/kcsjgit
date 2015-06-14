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
<script>
	
	function checkdata(){
		var userName = document.getElementById("txtUserName");
		var passwd = document.getElementById("txtPassword");
		var randcode = document.getElementById("yzm");
		if(userName.value == ""){
			alert("请输入用户名！");
			userName.focus();
			return false;  
		}else if (passwd.value == ""){
			alert("请输入密码！");
			passwd.focus();
			return false;  
		}else if (randcode.value == ""){	
			alert("请输入验证码！");
			randcode.focus();
			return false;  
		}
		return true;
	}
</script>
</head>
<center>
<body background="image/010.jpg">
<div align="center">
<form  name="login_form" action="verifylogin.jsp" method="post" onSubmit="return checkdata();" target="_self">
  
    <table border="0" width="75%"  bgcolor="#efefef" cellspacing="0" cellpadding="0">
      <tr><td width="100%" height="100%" colspan="2"><img width="100%" src="image/logo.jpg" ></td></tr>
      <tr>
        <td width="100%" align=center colspan="2" height="30"
			bgcolor="#70A9E9"><font color="#FFFFFF"><marquee direction ="lift" behavior="scroll" scrollamount="3"><b>欢迎来到高级语言程序设计互动交流平台！</b></marquee></font></td>
 
      </tr>
      
         <tr><td>&nbsp;</td></tr>
       <tr>
         <td align="center"colspan="2"><font color="RED" size="4"><b>用户登录</b></font></td></tr>
       <tr><td>&nbsp;</td></tr>
       <tr>
        <td height="35px" align="right" width="44%"><span class="STYLE5">用户名:</span></td>
         <td   ><input type="text" name="txtUserName" id="txtUserName" /></td>
      </tr>
      <tr><td>&nbsp;</td></tr>
       <tr>
        <td height="35" align="right" width= "44%" ><span class="STYLE5">密   码:</span></td>
        <td >   
          <input type="password" name="txtPassword" id="txtPassword"></td>
      </tr> 
      <tr><td>&nbsp;</td></tr>
      <tr>
        <td height="35" align="right" width="44%"><span class="STYLE5">验证码:</span></td>
          <td > 
            <p>
              <input name="yzm" id="yzm" class="check" type="text" maxlength="16" style="  float: left;margin:5px 0px 0px 1px !important; margin:5px 0px 0px 3px;" />
          <img src="/kcsj/CheckYzmServlet" onClick="history.go(0)"   style="  float: left; padding:6px 1px 0px 0px; margin-left:3px; cursor: hand;height:20px;" ;" />看不清？点击图片换一张</p></td>
      </tr>
     <tr><td colspan="2" align="right"><a href="register.jsp">没有帐号，立即注册一个？</a></td></tr>
      <tr>
        <td align="center" height="10" colspan="2" >      <input type="submit" name="Submit" value="登录" /> 　　　
          <input type="reset" name="Reset" value="重置" />
         </td>
      </tr>
     <tr><td height="180px">&nbsp;</td></tr>
     </table>
  
</form>
</div>
</body>
</center>
</html>
