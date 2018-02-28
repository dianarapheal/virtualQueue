<%-- 
    Document   : UserRegistration
    Created on : Feb 14, 2018, 1:46:45 PM
    Author     : ckc
--%>
<%@include file="header.jsp" %>
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
            String name1="";
            String contact1="";
            String address1="";
            String email1="";
            String idtype1="";
            String idnumber1="";
            String username1="";
            String password1="";
            String placeid1="";
            if(request.getParameter("btnsubmit")!=null)
            {
             name1=request.getParameter("txtname");
             contact1=request.getParameter("txtcon");
             address1=request.getParameter("txtadd");
             email1=request.getParameter("txtemail");
             idtype1=request.getParameter("Idtype");
             idnumber1=request.getParameter("txtidnum");
             username1=request.getParameter("txtuname");
             password1=request.getParameter("txtpass");
             placeid1=request.getParameter("placename");
             String ins ="insert into tbl_userreg(user_name,user_contact,user_address,user_email,username,password,idnumber,idtype,place_id) values('"+name1+"','"+contact1+"','"+address1+"','"+email1+"','"+username1+"','"+password1+"','"+idnumber1+"','"+idtype1+"','"+ placeid1+"')";
             boolean b=c.executeCommand(ins);
            
           
            }
            
        %>
        <form>
            <h1 align="center">User Registration</h1>
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
                    <th align="center">Address:</th> 
                    <td><input type="text" name="txtadd"></td>
                </tr>
                <tr>
                    <th align="center">Email</th> 
                    <td><input type="text" name="txtemail"></td>
                </tr>
                <tr>
                    <th align="center">UserName:</th> 
                    <td><input type="text" name="txtuname"></td>
                </tr>
                <tr>
                    <th align="center">Password</th> 
                    <td><input type="password" name="txtpass"></td>
                </tr>
                
                
                    <tr>
                    <th align="center">Id Type</th> 
                    <td><select name="Idtype">
                    <option value="sel">.....select.....</option>
                    <option value="Aadhar No">Aadhar No</option>
                    <option value="PanCard">PanCard</option>
                    <option value="Lincien No">Lincience No</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th align="center">Id Number</th> 
                    <td><input type="text" name="txtidnum"></td>
                </tr>
                <tr>
                    <th align="center">Place</th> 
                    <td><select name="placename">
                            <option>--select--</option>
                        <%
            String str = "select * from tbl_place ";
            ResultSet rs=c.selectCommand(str);
            while(rs.next())
            {
                String id=rs.getString("place_id");
                String name=rs.getString("place_name");
                
                %>
            
                <option value="<%=id%>"><%=name%></option>
                            <%
            }
                            %>
                        </select>
                       
                    </td>
                </tr>
                
                </table>
                <table border="1" align="center">
                <tr>
                    <td align="center" colspan="2"><input type="submit" name="btnsubmit" value="Submit"> </td>
                    <td align="center" colspan="2"><input type="submit" name="btncancel" value="Cancel"> </td>
                </tr>
                </table>
              
            
            
            
        </form>
       
        
    </body>
</html>
<%@include file="footer.jsp" %>