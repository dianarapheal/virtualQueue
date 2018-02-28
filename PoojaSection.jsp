<%-- 
    Document   : PoojaSection.jsp
    Created on : Feb 9, 2018, 9:47:07 AM
    Author     : ckc
--%>

<%-- 
    Document   : vehicle.jsp
    Created on : Feb 8, 2018, 12:23:28 PM
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
        String PoojaId = "", PoojaName = "";
        if (request.getParameter("btnsubmit") != null) 
        {
            if(!request.getParameter("hid").equals(""))
            {
                String pname=request.getParameter("txtpname");
                String upQuery="update tbl_poojasection set poojasection_name='"+pname+"'where poojasection_id='"+request.getParameter("hid")+"'";
                boolean b=c.executeCommand(upQuery);
                if (b == true) 
            {
                out.println("success");
                response.sendRedirect("PoojaSection.jsp");

            } else 
            {
                out.println(upQuery);
            }
            }
                
            
            else
            {
            String poojasection = request.getParameter("txtpname");
            String insQuery = "insert into tbl_poojasection (poojasection_name) values ('" + poojasection + "')";
            
            boolean b = c.executeCommand(insQuery);

            if (b == true) 
            {
                out.println("success");
                response.sendRedirect("PoojaSection.jsp");

            }
            else 
            {
                out.println(insQuery);
            }
           }

        }
        if(request.getParameter("did")!= null)
        {
            String del="delete from tbl_poojasection where poojasection_id='"+request.getParameter("did")+"'";
             boolean b=c.executeCommand(del);
             response.sendRedirect("PoojaSection.jsp");
        }
        if(request.getParameter("eid")!=null)
        {
            String sel="select * from tbl_poojasection where poojasection_id='"+request.getParameter("eid")+"'";
            ResultSet rs1=c.selectCommand(sel);
            if(rs1.next())
            {
                PoojaId=rs1.getString("poojasection_id");
                PoojaName=rs1.getString("poojasection_name");
            }
        
        }


    %>
    <body>
        <form method="post">
            <h1 align="center">PoojaSection</h1>
            <input type="hidden" name="hid" value="<%=PoojaId%>">
            <table align="center">
                <tr>
                    <td>PoojaSection</td>
                    <td><input type="text" name="txtpname" value="<%=PoojaName%>"></td>
                </tr>
                <tr>
                    <td align="center" colspan="2"><input type="submit" name="btnsubmit"></td>
                    <td align="center" colspan="2"><input type="reset" name="btncancel" value="cancel"></td>
                </tr>
            </table>

            <table border="1" align="center">
                <th>Sl.No</th>
                <th>poojaSection</th>
                    <%
                        int i = 1;
                        String selQry = "select * from tbl_poojasection";
                        ResultSet rs = c.selectCommand(selQry);

                        while (rs.next()) {
                    %>
                <tr>
                    <td><%=i%>                 
                    </td>

                    <td><%=rs.getString("poojasection_name")%></td>

                    <td><a href="PoojaSection.jsp?eid=<%=rs.getString("poojasection_id")%>" >EDIT</a></td>
                    <td><a href="PoojaSection.jsp?did=<%=rs.getString("poojasection_id")%>" >Delete</a></td>
                </tr> 
                <%
                        i++;
                    }
                %>


            </table>
        </form>
    </body>
</html>
