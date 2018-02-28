<%-- 
    Document   : AgencyApprove
    Created on : Feb 14, 2018, 1:44:38 PM
    Author     : ckc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="c"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
        </head>

        <body>
       

        <form>
            <table border="1" align="center">
                <tr>
                    <th>SINo</th>
                    <th>DistrictName</th>
                    <th>PlaceName</th>
                    <th>AgencyName</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Reg.Date</th>

                </tr>
                <%
                    int i = 0;

                    String sel = "select * from tbl_agency a inner join tbl_place p on p.place_id=a.place_id inner join tbl_district d on d.district_id=p.district_id where a.agency_status=2";
                    ResultSet bb = c.selectCommand(sel);
                    while (bb.next()) {

                        i++;


                %>
                <tr>
                    <td><%=i%></td> 
                    <td><%=bb.getString("district_name")%></td>
                    <td><%=bb.getString("place_name")%></td>
                    <td><%=bb.getString("agency_name")%></td>
                    <td><%=bb.getString("agency_contact")%></td>
                    <td><%=bb.getString("agency_email")%></td>
                    <td><%=bb.getString("agency_address")%></td>
                    <td><%=bb.getString("agency_regdate")%></td>
                   
                </tr>


                <%
                    }
                %>        



            </table>
        </form>
    </body>
</html>
