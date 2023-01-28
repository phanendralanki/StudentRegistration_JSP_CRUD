
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>

<!--//edit code-->
<% 
    
    if(request.getParameter("submit")!=null){ 
    
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspcrud","root","user");
        pst = con.prepareStatement("update data set name=?, course=?, fee=? where id=?");
        
        pst.setString(1,name);
        pst.setString(2,course);
        pst.setString(3,fee);
        pst.setString(4,id);
        
        pst.executeUpdate();
  
%>

<script>
    alert("record updated");
</script>


<%
}

%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update page</title>
        
        <!--bootstrap css-->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        
    </head>
    <body>
        <h1>Update Data</h1>
        
        <div class="row">
             <div class="col-sm-4">
                <!--form-->
                <form action="#" method="POST" class="">
                    
                    <% 
                         Connection con;
                         PreparedStatement pst;
                         ResultSet rs;
        
                         Class.forName("com.mysql.cj.jdbc.Driver");
                         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspcrud","root","user");
                         
                         String id = request.getParameter("id");
                         pst = con.prepareStatement("select *from data where id=?");
                         pst.setString(1,id);
                         
                         rs = pst.executeQuery();
                         
                         while(rs.next()){
                         
                            
                        
                    %>

                    <div align="left">
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student Name" name="name" id="name" required value="<%= rs.getString("name") %> " />
                    </div>

                    <div align="left">
                        <label class="form-label">course</label>
                        <input type="text" class="form-control" placeholder="course" name="course" id="course" required value="<%= rs.getString("course") %> " />
                    </div>

                    <div align="left">
                        <label class="form-label">fee</label>
                        <input type="text" class="form-control" placeholder="fee" name="fee" id="fee" required value="<%= rs.getString("fee") %> " />
                    </div>
                    
                    <% } %>
                    
                    <br/>
                    <div align="right">
                        <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                        <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">

                    </div>
                        
                    <div align="right">
                        <p><a href="index.jsp">Click Back</a></p>
                    </div>
                </form>
            </div>
            </div>
        
        
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
</html>
