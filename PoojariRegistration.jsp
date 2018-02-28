<%-- 
    Document   : TeamUpload
    Created on : Jan 29, 2018, 2:55:21 PM
    Author     : HP
--%>

<%@include file="header.jsp" %>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="DB.ConnectionClass"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <%

        if (request.getParameter("did") != null) {
            String del = "delete from tbl_poojari where poojari_id='" + request.getParameter("did") + "'";
            boolean b = obj.executeCommand(del);
            response.sendRedirect("PoojariRegistration.jsp");
        }
    %>
    <body>


        <form name="teamReg" action="PoojariRegAction.jsp" method="post" enctype="multipart/form-data">
            <table border="0" align="center">
                <tr>
                    <td>
                        PlaceName

                    </td>
                    <td><select name="ddlplace">
                            <option value="sel">----select----</option>
                            <%
                                String id = "";
                                String pname = "";
                                String sel = "select * from tbl_place";
                                ResultSet rs = obj.selectCommand(sel);
                                while (rs.next()) {
                                    id = rs.getString("place_id");
                                    pname = rs.getString("place_name");
                            %>
                            <option value="<%=id%>" ><%=pname%></option>

                            <%
                                }
                            %>
                        </select>
                </tr>
                <tr>
                    <td>PoojariName</td>
                    <td>
                        <input type="text" name="txtname" required="">
                    </td>
                </tr>
                <tr>
                    <td>FromDate</td>
                    <td>
                        <input type="date" name="txtfrom" placeholder="" required="">
                    </td>
                </tr>
                <tr>
                    <td>ToDate</td>
                    <td>
                        <input type="date" name="txtto" placeholder="" required="">
                    </td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <textarea name="txtaddress"></textarea>

                    </td>
                </tr>

                <tr>
                    <td>Contact</td>
                    <td>
                        <input type="number" name="txtcontact" placeholder="" required="" pattern="[0-9][10]">
                    </td>
                </tr>
                <tr>
                    <td>E-mail</td>
                    <td>
                        <input type="email" name="txtemail" required="">
                    </td>
                </tr>
                <tr>
                    <td>AddhrNumber</td>
                    <td>
                        <input type="text" name="txtaddhr" required="">
                    </td>
                </tr>


                <tr>
                    <td>Photo</td>
                    <td>
                        <input type="file" name="fphoto" required="">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="Submit">
                        <input type="reset" name="btnreset" value="Cancel" >
                    </td>
                </tr>

            </table>
            <table border="1" align="center">
                <tr>
                    <th>sl.no</th>
                    <th>Photo</th>
                    <th>PoojariName</th>
                    <th>Address</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th>AdharNo</th>
                    <th>FromDate</th>
                    <th>ToDate</th>
                   

                    <%
                        int i = 1;
                        String selQry = "select * from tbl_poojari p inner join tbl_place pl on pl.place_id=p.place_id";
                        ResultSet rs1 = obj.selectCommand(selQry);

                        while (rs1.next()) {
                    %>
                <tr>
                    <td><%=i%> </td>
                    <td><img src="PoojariImage/<%=rs1.getString("poojari_photo")%>" width="50" height="50"></td>
                    <td><%=rs1.getString("poojari_name")%></td>
                    <td><%=rs1.getString("poojari_address")%></td>
                    <td><%=rs1.getString("poojari_contact")%></td>
                    <td><%=rs1.getString("poojari_email")%></td>
                    <td><%=rs1.getString("poojari_adharno")%></td>
                    <td><%=rs1.getString("poojari_fromdate")%></td>
                    <td><%=rs1.getString("poojari_todate")%></td>




                    <td><a href="PoojariRegistration.jsp?did=<%=rs1.getString("poojari_id")%>" >Delete</a></td>
                </tr>
                <%
                        i++;
                    }
                %>


            </table>

        </form>

    </body>
</html>


<%@include file="footer.jsp" %>