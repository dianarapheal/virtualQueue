<%-- 
    Document   : Login
    Created on : Jan 2, 2018, 10:50:49 AM
    Author     : HP
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class ="DB.ConnectionClass"></jsp:useBean>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%

            String msg = "";
            String name = "", pwd = "";

            if (request.getParameter("btnlogin") != null) {

                name = request.getParameter("txtusername");
                pwd = request.getParameter("txtpassword");

                String seladmin = "select * from tbl_admin where admin_username='" + name + "' and admin_password='" + pwd + "'";
                ResultSet rsadmin = obj.selectCommand(seladmin);

                if (rsadmin.next()) {

                    session.setAttribute("userid", rsadmin.getString("admin_id"));
                    response.sendRedirect("../Admin/HomePage.jsp");

                } else {
                    msg = "Invalid Login....";
                }
            }

        %>

        <form name="frmLogin">
            <table align="center">
                <tr>
                    <td>UserName</td>
                    <td>
                        <input type="text" name="txtusername">
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <input type="password" name="txtpassword">
                    </td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <input type="Submit" name="btnlogin"value="Login" >
                        <input type="Reset" name="btncancel" value="Cancel" >
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <%=msg%>
                    </td>
                </tr>
            </table>
    </body>
</html>

<%@include file="footer.jsp" %>