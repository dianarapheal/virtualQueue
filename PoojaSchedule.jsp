<%-- 
    Document   : PoojaSchedule
    Created on : Feb 14, 2018, 1:41:40 PM
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
                String Poojaschtime = request.getParameter("txtpst");
                String PoojaScheduleDate = request.getParameter("txtpsd");
                String PoojaType = request.getParameter("selpooja");
                String PoojaSection = request.getParameter("selpoojasec");
                String ins = "insert into tbl_poojaschedule(pschedule_time,pschedule_date,ptype_id,poojasection_id)values('" + Poojaschtime + "','" + PoojaScheduleDate + "','" + PoojaType + "','" + PoojaSection + "')";

                boolean b = c.executeCommand(ins);
                out.println(ins);
                if (b == true) {
                    out.println("success");

                } else {
                    out.println("unsuccess");
                }
            }

            if (request.getParameter("did") != null) {
                String del = "delete from tbl_poojaschedule where pschedule_id='" + request.getParameter("did") + "'";
                boolean b = c.executeCommand(del);
                response.sendRedirect("PoojaSchedule.jsp");
            }


        %>
    <body>
        <form>
            <h1 align="center"> Pooja Schedule</h1>

            <table border="0" align="center">

                <tr>
                    <th align="center"> PoojaSchedule Time</th> 
                    <td><input type="time" name="txtpst"></td>
                </tr>
                <tr>
                    <th align="center"> PoojaSchedule Date</th>
                    <td><input type="date" name="txtpsd"></td>
                </tr>
                <tr>
                    <td>
                        PoojaType

                    </td>
                    <td><select name="selpooja">
                            <option value="sel">----select----</option>
                            <%  String id = "";
                                String pname = "";
                                String sel = "select * from tbl_poojatype";
                                ResultSet rs1 = c.selectCommand(sel);
                                while (rs1.next()) {
                                    id = rs1.getString("ptype_id");
                                    pname = rs1.getString("ptype_name");
                            %>
                            <option value="<%=id%>" ><%=pname%></option>

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
                                String Id = "";
                                String Psname = "";
                                String sel1 = "Select * from tbl_poojasection";
                                ResultSet rs2 = c.selectCommand(sel1);
                                while (rs2.next()) {
                                    id = rs2.getString("poojasection_id");
                                    Psname = rs2.getString("poojasection_name");
                            %>
                            <option value="<%=id%>" ><%=Psname%></option>

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
                <th>SlNo</th>
                <th>ScheduleTime</th>
                <th>ScheduleDate</th>
                <th>PoojaType</th>
                <th>PoojaSection</th>

                <%
                    int i = 1;
                    String selQry = "select * from tbl_poojaschedule ps inner join tbl_poojatype pt on ps.ptype_id=pt.ptype_id inner join tbl_poojasection psch on psch.poojasection_id=ps.poojasection_id";
                    ResultSet rs = c.selectCommand(selQry);

                    while (rs.next()) {
                %>
                <tr>
                    <td><%=i%>                 
                    </td>

                    <td><%=rs.getString("pschedule_time")%></td>
                    <td><%=rs.getString("pschedule_date")%></td>
                    <td><%=rs.getString("ptype_name")%></td>
                    <td><%=rs.getString("poojasection_name")%></td>
                    <td><a href="PoojaSchedule.jsp?did=<%=rs.getString("pschedule_id")%>" >Delete</a></td>
                </tr> 
                <%
                        i++;
                    }
                %>
            </table>

        </form>

    </body>
</html>
