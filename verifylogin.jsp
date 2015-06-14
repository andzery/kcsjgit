<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.zr.cpro.db.ConnectionPool"%>
<%@ page
	import="java.sql.Connection,java.sql.Statement,java.sql.ResultSet,java.sql.SQLException"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Language" content="zh-cn">
<title>登录</title>
</head>
<body>
<div align=center><font color="red"><strong> <%
			String strUserName = request.getParameter("txtUserName");
                  strUserName = new String(strUserName.getBytes("iso-8859-1"),"gb2312");
			//获取提交的用户名
			String strPassword = request.getParameter("txtPassword");
               strPassword = new String(strPassword.getBytes("iso-8859-1"),"gb2312");
			///获取提交的密码
			String strYzm=request.getParameter("yzm");
                       //获取验证码
                      String stryz=(String)session.getAttribute("check");
                      //Servlet中生成的验证码
                        boolean check=false;
			strYzm=strYzm.toLowerCase();
			
                        if(stryz.equals(strYzm))
                          {
                           check=true;
                           }
			else
			{
                          out.print("<script>alert('验证码错误！');location.href='login.jsp';</script>"); 
			}
			
		if(check)
               {
			 //创建数据库连接对象
			ConnectionPool connPool=new ConnectionPool();
			Connection conn=null;
			 conn = connPool.getConnection();
			Statement stmt = null;
			ResultSet rs = null;

			try {
				int nextMessageid = 0;
				String relative_path = null;
				//sql语句
				String sql = "select * from student where username='"
						+ strUserName + "' and userpwd='" + strPassword + "'";
				//创建数据记录集对象
				stmt = conn.createStatement();
				//执行sql语句，返回一个记录集到rs
				rs = stmt.executeQuery(sql);
		//如果记录集为非空，表明有相匹配的用户名和密码，登录成功
				if (rs.next()) {
					//登录成功时,把strUserName设成session变量UserName
				  request.getSession(true).setAttribute("userName", strUserName);
				 response.sendRedirect("jlhd.jsp");
				} else {
					//否则（记录集为空），表明失败
				request.setAttribute("error", "登录失败!");
				try {
					request.getRequestDispatcher("logerror.jsp").forward(request,
							response);
				} catch (Throwable t) {
					getServletContext().log(t.getMessage());
				}
				}
			} catch (SQLException sqlExc) {
				sqlExc.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				//关闭连接，释放数据库资源
				try {
					if (rs != null) {
						rs.close();
					}
					if (stmt != null) {
						stmt.close();
					}
					connPool.freeConnection(conn);
				} catch (SQLException sqlExc) {
					sqlExc.printStackTrace();
				}
			}
             }
		%> </strong> </font></div>
</body>
</html>
