<%-- 
    Document   : Registration
    Created on : Aug 1, 2016, 11:55:22 AM
    Author     : kabil
--%>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.text.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head runat="server">
        <title>Register Form</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="Styles/Main.css" />
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script type="text/javascript" src="Scripts/Validate.js"></script>
        <script type="text/javascript">
            $(function () {
                $("#txtDob").datepicker({dateFormat: 'yy/mm/dd'});
            });
        </script>
    </head>
    <body class="registration-background">
        <%
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String dateofbirth = request.getParameter("dateofbirth");
            java.util.Date date = null;
            Date sqlDate = null;
            if (dateofbirth != null) {
                date = new SimpleDateFormat("yy/mm/dd").parse(dateofbirth);
                sqlDate = new Date(date.getDate());
            }
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            if (firstname != null) {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myfirstdb", "root", "kabil9929");
                PreparedStatement st = con.prepareStatement("insert into users(uFirstname,uLastname,uDob,uEmail,uUsername,uPassword) values (?,?,?,?,?,?)");
                st.setString(1, firstname);
                st.setString(2, lastname);
                st.setDate(3, sqlDate);
                st.setString(4, email);
                st.setString(5, username);
                st.setString(6, password);
                int i = st.executeUpdate();
            if (i > 0) {%>
        <script type="text/javascript">
            alert("User registered successfully");
        </script>
        <%
                }
            }
        %>
        <div class="jumbotron text-center jumbotronbg">
            <h1>Shopping Cart</h1>
            <p>A place for all your needs.</p>
        </div>
        <h1 class="text-center">Register</h1>
        <div>
            <form id="register-form" role="form" method="post" action="Registration.jsp">
                <div class="Container">
                    <div class="col-sm-4"></div>

                    <div class="col-sm-3">
                        <div class="form-group" style="margin-top: 20px">
                            <label for="First Name">First Name:</label>
                            <input type="text" name="firstname" class="form-control" id="txtFirstName" />
                        </div>

                        <div class="form-group">
                            <label for="LastName">Last Name:</label>
                            <input type="text" name="lastname" class="form-control" id="txtLastName" />
                        </div>

                        <div class="form-group">
                            <label for="Date of Birth">Date of Birth:</label>
                            <input type="text" name="dateofbirth" class="form-control" id="txtDob" />
                        </div>

                        <div class="form-group">
                            <label for="Email">Email:</label>
                            <input type="text" name="email" class="form-control" id="txtEmail" />
                        </div>

                        <div class="form-group">
                            <label for="username">User Name:</label>
                            <input type="text" name="username" class="form-control" id="txtUserName" />
                        </div>

                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input type="Password" name="password" class="form-control" id="txtPassword" />
                        </div>

                        <input type="submit" class="btn btn-default" value="Submit" onclick="return validateForm()" style="margin-top: 10px;" />

                        <button type="button" class="btn btn-default" onclick="return clearAllValues()" style="margin-top: 10px;">Reset</button>

                    </div>
                </div>
            </form>
            <div class="col-sm-5"></div>

        </div>


    </body>
</html>
