<%-- 
    Document   : Hotels
    Created on : Feb 14, 2018, 1:51:48 PM
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
    <%

        if (request.getParameter("btnsubmit") != null) {
            String ename = request.getParameter("txtname");
            String cnum = request.getParameter("txtcon");
            String email1 = request.getParameter("txtemail");
            String address1 = request.getParameter("txtadd");
            String place1 = request.getParameter("selplace");

            String ins = "insert into tbl_hotel(hotel_name,hotel_contact,hotel_email,hotel_address,place_id) values('" + ename + "','" + cnum + "','" + email1 + "','" + address1 + "','" + place1 + "')";
            boolean b = c.executeCommand(ins);
            out.println(ins);
            if (b == true) {
                out.println("success");

            } else {
                out.println("unsuccess");
            }
        }

        if (request.getParameter("did") != null) {
            String del = "delete from tbl_hotel where hotel_id='" + request.getParameter("did") + "'";
            boolean b = c.executeCommand(del);
            response.sendRedirect("HotelDetails.jsp");
        }


    %>
    <body>
        <form>
            <h1 align="center"> Hotels</h1>

            <table border="0" align="center">

                <tr>
                    <th align="center"> Name:</th> 
                    <td><input type="text" name="txtname"></td>
                </tr>
                <tr>
                    <th align="center"> Contact:</th>
                    <td><input type="text" name="txtcon"></td>
                </tr>
                <tr>
                    <th align="center"> Address:</th>
                    <td><input type="text" name="txtadd"></td>
                </tr>
                <tr>
                    <th align="center"> Email</th>
                    <td><input type="text" name="txtemail"></td>
                </tr>
                <tr>
                    <td>
                        PlaceName

                    </td>
                    <td><select name="selplace">
                            <option value="sel">----select----</option>
                            <%                                String id = "";
                                String pname = "";
                                String sel = "select * from tbl_place";
                                ResultSet rs1 = c.selectCommand(sel);
                                while (rs1.next()) {
                                    id = rs1.getString("place_id");
                                    pname = rs1.getString("place_name");
                            %>
                            <option value="<%=id%>" ><%=pname%></option>

                            <%
                                }
                            %>
                        </select>
                </tr>
            </table>
            <table border="1" align="center">
                <tr>
                    <td align ="center" colspan="2"><input type ="submit" name="btnsubmit" value="Submit"></td>
                    <td align="center" colspan="2"><input type="reset" name="btncancel" value="Cancel"></td>
                </tr>
            </table>
            <table border="1" align="center">
                <th>SlNo</th>
                <th>HotelName</th>
                <th>Address</th>
                <th>Email</th>
                <th>Contact</th>
                <th>PlaceName</th>
                    <%
                        int i = 1;
                        String selQry = "select * from tbl_hotel h inner join tbl_place p on h.place_id=p.place_id";
                        ResultSet rs = c.selectCommand(selQry);

                        while (rs.next()) {
                    %>
                <tr>
                    <td><%=i%>                 
                    </td>

                    <td><%=rs.getString("hotel_name")%></td>
                    <td><%=rs.getString("hotel_address")%></td>
                    <td><%=rs.getString("hotel_contact")%></td>
                    <td><%=rs.getString("hotel_email")%></td>
                    <td><%=rs.getString("place_name")%></td>
                    <td><a href="HotelDetails.jsp?did=<%=rs.getString("hotel_id")%>" >Delete</a></td>
                </tr> 
                <%
                        i++;
                    }
                %>
            </table>

        </form>

    </body>
</html>
