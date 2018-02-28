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
        <title>AgencyDetails</title>
    </head>
    <body>


        <form name="teamReg" action="AgencyRegAction.jsp" method="post" enctype="multipart/form-data">
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
                    <td>AgencyName</td>
                    <td>
                        <input type="text" name="txtname" required="">
                    </td>
                </tr>
                <tr>
                    <td>Reg.Date</td>
                    <td>
                        <input type="date" name="txtdob" placeholder="" required="">
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
                    <td>UserName</td>
                    <td>
                        <input type="text" name="txtusername" required="">
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <input type="password" name="txtpassword" required="" >
                    </td>
                </tr>

                <tr>
                    <td>Proof</td>
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

        </form>

    </body>
</html>


<%@include file="footer.jsp" %>