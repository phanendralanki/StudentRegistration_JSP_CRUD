
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>

<!--//edit code-->
<% 
        String id = request.getParameter("id");
       
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspcrud","root","user");
        pst = con.prepareStatement("delete from data where id=?");
        
        
        pst.setString(1,id);
        
        pst.executeUpdate();
  
%>

<script>
    alert("record deleted");
</script>

