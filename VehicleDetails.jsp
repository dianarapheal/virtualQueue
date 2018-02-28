<%-- 
    Document   : VehicleDetails
    Created on : Feb 14, 2018, 1:45:30 PM
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

                String vehicleName = request.getParameter("txtvname");
                String vehicleReg = request.getParameter("txtrno");
                String vehicleEng = request.getParameter("txteno");
                String Seatcapacity = request.getParameter("txtsc");
                  String VehicleType = request.getParameter("selvtype");
                   String VehicleStatus = request.getParameter("txtstat");
                   String VehicleRate = request.getParameter("txtrate");
                   String Agency = request.getParameter("selag");
                String ins = "insert into tbl_vehicle(vehicle_name,vehicletype_id,vehicle_regno,vehicle_engineno,seatcapacity,agency_id,status,rate)";

                boolean b = c.executeCommand(ins);
                out.println(ins);
                if (b == true) {
                    out.println("success");

                } else {
                    out.println("unsuccess");
                }
            }
              %>
            <form>
                <h1 align="center">Vehicle Details</h1>
                <table border="0" align="center">
                    <tr>
                        <th align="center"> VehicleName:</th> 
                        <td><input type="text" name="txtvname"></td>
                    </tr>
                    <tr>
                        <th align="center"> VehicleRegno:</th> 
                        <td><input type="text" name="txtrno"></td>
                    </tr>
                    <tr>
                        <th align="center"> VehicleEngineno:</th> 
                        <td><input type="text" name="txteno"></td>
                    </tr>
                    <tr>
                        <th align="center"> Seatcapacity:</th> 
                        <td><input type="text" name="txtsc"></td>
                    </tr>
                    <tr>
                        <td>
                            VehicleType

                        </td>
                        <td><select name="selvtype">
                                <option value="sel">----select----</option>
                            <%  String Id = "";
                                String vname = "";
                                String sel1 = "Select * from tbl_vehicletype";
                                ResultSet rs2 = c.selectCommand(sel1);
                                while (rs2.next()) {
                                    Id = rs2.getString("vehicle_id");
                                    vname = rs2.getString("vehicle_name");
                            %>
                            <option value="<%=Id%>" ><%=vname%></option>

                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th align="center"> VehicleStatus:</th> 
                    <td><input type="text" name="txtstat"></td>
                </tr>
                <tr>
                    <th align="center"> VehicleRate:</th> 
                    <td><input type="text" name="txtrate"></td>
                </tr>
                <tr>
                        <td>
                          Agency

                        </td>
                        <td><select name="selag">
                                <option value="sel">----select----</option>
                            <%  String Id1 = "";
                                String agname = "";
                                String sel = "Select * from tbl_agency";
                                ResultSet rs = c.selectCommand(sel);
                                while (rs.next()) {
                                    Id = rs.getString("agency_id");
                                    agname = rs.getString("agency_name");
                            %>
                            <option value="<%=Id%>" ><%=agname%></option>

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
        </form>

    </body>
</html>
