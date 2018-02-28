<%-- 
    Document   : vehicleType.jsp
    Created on : Feb 14, 2018, 10:36:25 AM
    Author     : ckc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="c"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        
    </head>
    
    <body>
        <% 
            String ee="";
            String name2="";
              String name="";
               String hh="";
           
            if(request.getParameter("eid")!=null)
            {
               ee=request.getParameter("eid");
            
              String take="select * from tbl_vehicletype where vehicle_id='"+ee+"'";
              ResultSet rs1=c.selectCommand(take);
              if(rs1.next())
               {
                   name2=rs1.getString("vehicle_name");
              }
          }
             
            
            if(request.getParameter("btnsubmit")!=null)
            {
                name=request.getParameter("txtname");
              
               hh=request.getParameter("hid");
                 if(!hh.equals(""))
                {
                    String up="update  tbl_vehicletype set vehicle_name='"+name+"' where vehicle_id='"+hh+"'";
                    boolean a=c.executeCommand(up);
                } else
                {
                 
                String ins="insert into tbl_vehicletype(vehicle_name)values('"+name+"')";
                boolean b=c.executeCommand(ins);
                
            
            
            }
            }
        
        %>
        
        <form>
         
            <table border="2" align="center">
                <tr>
                    <th>Vehicle Name</th>
                    <td>
                        <input type="text" name="txtname" value="<%=name2%>">
                        <input type="hidden" name="hid" value="<%=ee%>">
                    </td>
                </tr>
               
                    <tr>
                    <td align="center" colspan="2"><input type="submit" name="btnsubmit" value="submit">
                    <input type="reset" name="btncancel" value="cancel"></td>
                </tr>
                </table>
                
           
            <br>
            <table border="1" align="center">
                <tr>
                    <th>Sl.No</th>
                    <th>Vehicle Name</th>
                </tr>
               <%
            int i=0;
            String id="";
            String name1="";
            String sel="select * from tbl_vehicletype";
            ResultSet rs=c.selectCommand(sel);
            while(rs.next())
            {
                id=rs.getString("vehicle_id");
                name1=rs.getString("vehicle_name");
                i++;
            
               %>
               <tr>
                    <td><%=i%></td>
                    <td><%=name1%></td>
                    <td><a href="vehicleType.jsp?eid=<%=id%>">Edit</a></td>
                    <td><a href="vehicleType.jsp?did=<%=id%>">Delete</a></td>
                           
               </tr>
                   
                           <%
                           }
                   
                   %>
                           
                   
               
                           
            </table>
                
                
            
        </form>
        
     
      
    </body>
</html>
