<%-- 
    Document   : District
    Created on : Feb 7, 2018, 12:07:07 PM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="c"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DistrictDetails</title>
    </head>
    <%
        String districtId = "", districtName = "";
        if (request.getParameter("btnsubmit") != null) {
            if (!request.getParameter("hid").equals("")) {
                String dname = request.getParameter("txtdistrictname");
                String upQuery = "update tbl_district set district_name='" + dname + "'where district_id='" + request.getParameter("hid") + "'";
                boolean b = c.executeCommand(upQuery);
                if (b == true) {
                    out.println("success");
                    response.sendRedirect("District.jsp");

                } else {
                    out.println(upQuery);
                }
            } else {
                String district = request.getParameter("txtdistrictname");
                String insQuery = "insert into tbl_district (district_name) values ('" + district + "')";
                boolean b = c.executeCommand(insQuery);

                if (b == true) {
                    out.println("success");
                    response.sendRedirect("District.jsp");

                } else {
                    out.println(insQuery);
                }
            }

        }
        if (request.getParameter("did") != null) {
            String del = "delete from tbl_district where district_id='" + request.getParameter("did") + "'";
            boolean b = c.executeCommand(del);
            response.sendRedirect("District.jsp");
        }
        if (request.getParameter("eid") != null) {
            String sel = "select * from tbl_district where district_id='" + request.getParameter("eid") + "'";
            ResultSet rs1 = c.selectCommand(sel);
            if (rs1.next()) {
                districtId = rs1.getString("district_id");
                districtName = rs1.getString("district_name");
            }

        }


    %>
    <body>
        <form method="post">
            <h1 align="center">Districts</h1>
            <input type="hidden" name="hid" value="<%=districtId%>">
            <table align="center">
                <tr>
                    <td>District</td>
                    <td><input type="text" name="txtdistrictname" value="<%=districtName%>"></td>
                </tr>
                <tr>
                    <td align="center" colspan="2"><input type="submit" name="btnsubmit" value="Submit"></td>
                    <td align="center" colspan="2"><input type="reset" name="btncancel" value="cancel"></td>
                </tr>
            </table>

            <table border="1" align="center">
                <th>Sl.No</th>
                <th>District</th>
                    <%
                        int i = 1;
                        String selQry = "select * from tbl_district";
                        ResultSet rs = c.selectCommand(selQry);

                        while (rs.next()) {
                    %>
                <tr>
                    <td><%=i%>                 
                    </td>

                    <td><%=rs.getString("district_name")%></td>

                    <td><a href="District.jsp?eid=<%=rs.getString("district_id")%>" >EDIT</a></td>
                    <td><a href="District.jsp?did=<%=rs.getString("district_id")%>" >Delete</a></td>
                </tr> 
                <%
                        i++;
                    }
                %>


            </table>
        </form>
    </body>
</html>
