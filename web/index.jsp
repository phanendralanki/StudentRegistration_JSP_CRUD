<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page import="java.sql.*" %>

<% 

    if(request.getParameter("submit")!=null){
        String name = request.getParameter("name");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspcrud","root","user");
        pst = con.prepareStatement("insert into data(name,course,fee) values(?,?,?)");
        
        pst.setString(1,name);
        pst.setString(2,course);
        pst.setString(3,fee);
        
        pst.executeUpdate();
        
%> 

<script>
    alert("record added");
</script>


<%
}

%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP CRUD</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">


    </head>
    <body>
        <h1>Student Registration System</h1>
        <br/>

        <div class="row">
            <div class="col-sm-4">
                <!--form-->
                <form action="#" method="POST" class="">

                    <div align="left">
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student Name" name="name" id="name" required />
                    </div>

                    <div align="left">
                        <label class="form-label">course</label>
                        <input type="text" class="form-control" placeholder="course" name="course" id="course" required />
                    </div>

                    <div align="left">
                        <label class="form-label">fee</label>
                        <input type="text" class="form-control" placeholder="fee" name="fee" id="fee" required />
                    </div>
                    <br/>
                    <div align="right">
                        <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                        <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">

                    </div>

                </form>
            </div>

            <div class="col-sm-8">
                <!--table-->
                <div class="panel-body">
                    <table class="table table-responsive table-bordered" id="tbl-student" cellpadding="0" width="100%">
                        
                            <tr>
                                <th scope="col">Student Name</th>
                                <th scope="col">Course</th>
                                <th scope="col">Fee</th>
                                <th scope="col">Edit</th>
                                <th scope="col">Delete</th>
                            </tr>
                        
                       

                            <%
                                 Connection con;
                                 PreparedStatement pst;
                                 ResultSet rs;
        
                                 Class.forName("com.mysql.cj.jdbc.Driver");
                                 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspcrud","root","user");
                                 
                                  String query ="select *from data";
                                  Statement st = con.createStatement();
                                  
                                  rs = st.executeQuery(query);

                                  while(rs.next()){
                                    String id = rs.getString("id");
                                    
                                

                            %>

                            <tr>
                                <td><%=rs.getString("name") %></td>
                                <td><%=rs.getString("course") %></td>
                                <td><%=rs.getString("fee") %></td>
                                <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
                                <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
                            </tr>
                            
                            <% 
                                }
                            %>

                        
                    </table>
                </div>
            </div>


            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>


</html>
