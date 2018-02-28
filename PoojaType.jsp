<%-- 
    Document   : PoojaType
    Created on : Feb 7, 2018, 1:21:38 PM
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
    <body>
    <%
        String poojaId = "", poojaName = "";
        if (request.getParameter("btnsubmit") != null) 
        {
            if(!request.getParameter("hid").equals(""))
            {
                String pname=request.getParameter("txtpoojaname");
                String upQuery="update tbl_poojatype set ptype_name='"+pname+"'where ptype_id='"+request.getParameter("hid")+"'";
                boolean b=c.executeCommand(upQuery);
                if (b == true) 
            {
                out.println("success");
                response.sendRedirect("PoojaType.jsp");

            } else 
            {
                out.println(upQuery);
            }
            }
                
            
            else
            {
            String poojatype = request.getParameter("txtpoojaname");
            String insQuery = "insert into tbl_poojatype (ptype_name) values ('" + poojatype + "')";
            boolean b = c.executeCommand(insQuery);

            if (b == true) 
            {
                out.println("success");
                response.sendRedirect("PoojaType.jsp");

            }
            else 
            {
                out.println(insQuery);
            }
           }

        }
        if(request.getParameter("did")!= null)
        {
            String del="delete from tbl_poojatype where ptype_id='"+request.getParameter("did")+"'";
             boolean b=c.executeCommand(del);
             response.sendRedirect("PoojaType.jsp");
        }
        if(request.getParameter("eid")!=null)
        {
            String sel="select * from tbl_poojatype where ptype_id='"+request.getParameter("eid")+"'";
            ResultSet rs1=c.selectCommand(sel);
            if(rs1.next())
            {
                poojaId=rs1.getString("ptype_id");
                poojaName=rs1.getString("ptype_name");
            }
        
        }


    %>
        <form method="post">
            <h1 align="center">PoojaType</h1>
            <input type="hidden" name="hid" value="<%=poojaId%>">
            <table align="center">
                <tr>
                    <td>PoojaType</td>
                    <td><input type="text" name="txtpoojaname" value="<%=poojaName%>"></td>
                </tr>
                <tr>
                    <td align="center" colspan="2"><input type="submit" name="btnsubmit" value="Submit"></td>
                    <td align="center" colspan="2"><input type="reset" name="btncancel" value="cancel"></td>
                </tr>
            </table>

            <table border="1" align="center">
                <th>Sl.No</th>
                <th>PoojaName</th>
                    <%
                        int i = 1;
                        String selQry = "select * from tbl_poojatype";
                        ResultSet rs = c.selectCommand(selQry);

                        while (rs.next()) {
                    %>
                <tr>
                    <td><%=i%>                 
                    </td>

                    <td><%=rs.getString("ptype_name")%></td>

                    <td><a href="PoojaType.jsp?eid=<%=rs.getString("ptype_id")%>" >EDIT</a></td>
                    <td><a href="PoojaType.jsp?did=<%=rs.getString("ptype_id")%>" >Delete</a></td>
                </tr> 
                <%
                        i++;
                    }
                %>


            </table>
        </form>
    </body>
</html>
