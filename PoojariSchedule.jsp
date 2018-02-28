<%-- 
    Document   : PoojariSchedule
    Created on : Feb 14, 2018, 1:43:16 PM
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
        <%

            if (request.getParameter("btnsubmit") != null) {

                String PoojaScheduleDate = request.getParameter("txtpsd");
                String PoojariName = request.getParameter("selpname");
                String PoojaSection = request.getParameter("selpoojasec");
                String ins = "insert into tbl_poojarischedule(poojarischedule_date,poojari_id,poojasection_id)values('" + PoojaScheduleDate + "','" + PoojariName + "','" + PoojaSection + "')";

                boolean b = c.executeCommand(ins);
                out.println(ins);
                if (b == true) {
                    out.println("success");

                } else {
                    out.println("unsuccess");
                }
            }

            if (request.getParameter("did") != null) {
                String del = "delete from tbl_poojarischedule where poojarischedule_id='" + request.getParameter("did") + "'";
                boolean b = c.executeCommand(del);
                response.sendRedirect("PoojariSchedule.jsp");
            }


        %>
        <form>
            <h1 align="center">Poojari Schedule</h1>
            <table border="0" align="center">
                <tr>
                    <th align="center"> PoojaSchedule Date</th>
                    <td><input type="date" name="txtpsd"></td>
                </tr>
                <tr>
                    <td>
                        PoojariName

                    </td>
                    <td><select name="selpname">
                            <option value="sel">----select----</option>
                            <%                                String Id = "";
                                String Pname = "";
                                String sel1 = "Select * from tbl_poojari";
                                ResultSet rs2 = c.selectCommand(sel1);
                                while (rs2.next()) {
                                    Id = rs2.getString("poojari_id");
                                    Pname = rs2.getString("poojari_name");
                            %>
                            <option value="<%=Id%>" ><%=Pname%></option>

                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        PoojaSection

                    </td>
                    <td><select name="selpoojasec">
                            <option value="sel">----select----</option>
                            <%
                                String Id1 = "";
                                String Psname = "";
                                String sel = "Select * from tbl_poojasection";
                                ResultSet rs1 = c.selectCommand(sel);
                                while (rs1.next()) {
                                    Id = rs1.getString("poojasection_id");
                                    Psname = rs1.getString("poojasection_name");
                            %>
                            <option value="<%=Id%>" ><%=Psname%></option>

                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
            </table>
            <table border="1" align="center">
                <tr>
                    <td align ="center" colspan="2"><input type ="submit" name="btnsubmit" value="Submit"></td>
                    <td align="center" colspan="2"><input type="reset" name="btncancel" value="Cancel"></td>
                </tr>
            </table>
            <table border="1" align="center">
                <tr>
                    <th>Sl.No</th>

                    <th>ScheduleDate</th>
                    <th>PoojariName</th>
                    <th>PoojaSection</th>
                        <%
                            int i = 1;
                            String selQry = "select * from tbl_poojarischedule ps inner join tbl_poojari p on ps.poojari_id=p.poojari_id inner join tbl_poojasection psec on ps.poojasection_id=psec.poojasection_id";
                            ResultSet rs = c.selectCommand(selQry);

                            while (rs.next()) {
                        %>
                <tr>
                    <td><%=i%>                 
                    </td>


                    <td><%=rs.getString("poojarischedule_date")%></td>
                    <td><%=rs.getString("poojari_name")%></td>
                    <td><%=rs.getString("poojasection_name")%></td>
                    <td><a href="PoojariSchedule.jsp?did=<%=rs.getString("poojarischedule_id")%>" >Delete</a></td>
                </tr> 
                <%
                        i++;
                    }
                %>


            </table>



        </form>

    </body>
</html>
