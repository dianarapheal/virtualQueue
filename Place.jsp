<%-- 
    Document   : place.jsp
    Created on : Feb 9, 2018, 2:21:37 PM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="c"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PlaceDetails</title>
    </head>
    <%
        String PlaceId = "", PlaceName = "", distID = "";

        if (request.getParameter("btnsubmit") != null) {

            String place = request.getParameter("txtpname");
            String dist = request.getParameter("selDistrict");
            String insQuery = "insert into tbl_place (place_name,district_id) values ('" + place + "','" + dist + "')";

            boolean b = c.executeCommand(insQuery);

            if (b == true) {

                response.sendRedirect("Place.jsp");

            } else {
                out.println(insQuery);
            }
        }

        if (request.getParameter("did") != null) {
            String del = "delete from tbl_place where place_id='" + request.getParameter("did") + "'";
            boolean b = c.executeCommand(del);
            response.sendRedirect("Place.jsp");
        }


    %>
    <body>
        <form method="post">
            <h1 align="center">Place</h1>
            <input type="hidden" name="hid" value="<%=PlaceId%>">
            <table align="center">
                <tr>
                    <td>District</td>
                    <td><select name="selDistrict">
                            <option value="">--Select--</option>
                            <%
                                String id = "";
                                String str = "select * from tbl_district";
                                ResultSet rs = c.selectCommand(str);
                                while (rs.next()) {
                                    id = rs.getString("district_id");
                            %>

                            <option value="<%=id%>"><%=rs.getString("district_name")%></option>


                            <%

                                }

                            %>

                        </select></td>
                </tr>
                <tr>
                    <td>Place </td>
                    <td><input type="text" name="txtpname" ></td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <input type="submit" name="btnsubmit" value="Submit">
                        <input type="reset" name="btncancel" value="Cancel"></td>
                </tr>
            </table>

            <table border="1" align="center">
                <th>Sl.No</th>
                <th>DistrictName</th>
                <th>PlaceName</th>
                    <%                        int i = 1;
                        String selQry = "select * from tbl_place p inner join tbl_district d on p.district_id=d.district_id";
                        ResultSet rs1 = c.selectCommand(selQry);

                        while (rs1.next()) {
                    %>
                <tr>
                    <td><%=i%> </td>

                    <td><%=rs1.getString("district_name")%></td>
                    <td><%=rs1.getString("place_name")%></td>


                    <td><a href="Place.jsp?did=<%=rs1.getString("place_id")%>" >Delete</a></td>
                </tr> 
                <%
                        i++;
                    }
                %>


            </table>
        </form>
    </body>
</html>




