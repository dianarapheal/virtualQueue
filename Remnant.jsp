<%-- 
    Document   : remnant.jsp
    Created on : Feb 9, 2018, 12:06:26 PM
    Author     : ckc
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="c"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        String RemnantId = "", RemnantName = "";
        if (request.getParameter("btnsubmit") != null) 
        {
            if(!request.getParameter("hid").equals(""))
            {
                String rname=request.getParameter("txtrname");
                String upQuery="update tbl_remnanttype set rtype_name='"+rname+"'where rtype_id='"+request.getParameter("hid")+"'";
                boolean b=c.executeCommand(upQuery);
                if (b == true) 
            {
                out.println("success");
                response.sendRedirect("remnant.jsp");

            } else 
            {
                out.println(upQuery);
            }
            }
                
            
            else
            {
            String remnanttype = request.getParameter("txtrname");
            String insQuery = "insert into tbl_remnanttype (rtype_name) values ('" + remnanttype + "')";
            
            boolean b = c.executeCommand(insQuery);

            if (b == true) 
            {
                out.println("success");
                response.sendRedirect("remnant.jsp");

            }
            else 
            {
                out.println(insQuery);
            }
           }

        }
        if(request.getParameter("did")!= null)
        {
            String del="delete from tbl_remnanttype where rtype_id='"+request.getParameter("did")+"'";
             boolean b=c.executeCommand(del);
             response.sendRedirect("remnant.jsp");
        }
        if(request.getParameter("eid")!=null)
        {
            String sel="select * from tbl_remnanttype where rtype_id='"+request.getParameter("eid")+"'";
            ResultSet rs1=c.selectCommand(sel);
            if(rs1.next())
            {
                RemnantId=rs1.getString("rtype_id");
                RemnantName=rs1.getString("rtype_name");
            }
        
        }


    %>
    <body>
        <form method="post">
            <h1 align="center">Remnant Type</h1>
            <input type="hidden" name="hid" value="<%=RemnantId%>">
            <table align="center">
                <tr>
                    <td>Remnant Type</td>
                    <td><input type="text" name="txtrname" value="<%=RemnantName%>"></td>
                </tr>
                <tr>
                    <td align="center" colspan="2"><input type="submit" name="btnsubmit" Value="Submit"></td>
                    <td align="center" colspan="2"><input type="reset" name="btncancel" value="cancel"></td>
                </tr>
            </table>

            <table border="1" align="center">
                <th>Sl.No</th>
                <th>Remnant Type</th>
                    <%
                        int i = 1;
                        String selQry = "select * from tbl_remnanttype";
                        ResultSet rs = c.selectCommand(selQry);

                        while (rs.next()) {
                    %>
                <tr>
                    <td><%=i%>                 
                    </td>

                    <td><%=rs.getString("rtype_name")%></td>

                    <td><a href="remnant.jsp?eid=<%=rs.getString("rtype_id")%>" >EDIT</a></td>
                    <td><a href="remnant.jsp?did=<%=rs.getString("rtype_id")%>" >Delete</a></td>
                </tr> 
                <%
                        i++;
                    }
                %>


            </table>
        </form>
    </body>
</html>
