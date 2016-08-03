<%-- 
    Document   : Login
    Created on : Aug 1, 2016, 11:53:59 AM
    Author     : kabil
--%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.text.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Shopping Cart</title>
        <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
                    <link rel="stylesheet" href="Styles/Main.css" />
                    <script src="Scripts/Validate.js" type="text/javascript"></script>
                    </head>
                    <body class="login-background">
                        <%
                            String username = request.getParameter("username");
                            if (username != null) {
                                String pwd = request.getParameter("password");
                                Class.forName("com.mysql.jdbc.Driver");
                                java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myfirstdb", "root", "kabil9929");
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("select * from users where uUsername='" + username + "'");
                                if (rs.next()) {
                                    if (rs.getString("uPassword").equals(pwd)) {
                                        int userid = rs.getInt("pkUserId");
                                        session.putValue("userid", userid);
                                        session.putValue("username", username);
                                        response.sendRedirect("/Basic_Front/Home.jsp");
                                    } else { %>
                        <script type="text/javascript">
                            $('.errorSummary').empty();
                            $('.errorSummary').add('<p class="errorMsg">Invalid username or password. Please try again.</p>');
                        </script>
                        <%
                            }
                        } else { %>
                        <script type="text/javascript">
                            $('.errorSummary').empty();
                            $('.errorSummary').add('<p class="errorMsg">Invalid username or password. Please try again.</p>');
                        </script>
                        <%
                                }
                            }
                        %>
                        <div class="jumbotron text-center jumbotronbg" >
                            <h1>Shopping Cart</h1>
                            <p>A place for all your needs.</p>
                        </div>
                        <div class="container">
                            <h1 class="text-center">LOGiN</h1>

                            <div class="row">
                                <div class="col-sm-4"></div>
                                <div class="col-sm-4">
                                    <form role="form" style="margin-top: 50px;" method="post" action="Index.jsp">
                                        <div class="form-group">
                                            <label for="username">Username :</label>
                                            <input type="text" class="form-control" name="username" onblur="return validateLoginFormOnLeave('txtUsername');" id="txtUsername" />
                                        </div>

                                        <div class="form-group">
                                            <label for="pwd">Password :</label>
                                            <input type="password" class="form-control" name="password" onblur="return validateLoginFormOnLeave('txtPassword');" id="txtPassword" />
                                        </div>

                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" />
                                                Remember me</label>
                                        </div>
                                        <div class="btn-link">
                                            <a href="ForgetPassword.aspx">
                                                Forget Password?
                                            </a>
                                        </div>
                                        <div class="btn-link">
                                            <a href="Registration.jsp">
                                                Sign Up
                                            </a>
                                        </div>
                                        <div class="btn-link errorSummary">

                                        </div>
                                        <input type="submit" class="btn btn-default" onclick="return validateLoginForm()" style="margin-top: 10px;" value="LogIn" />
                                    </form>
                                </div>
                                <div class="col-sm-4"></div>
                            </div>
                        </div>


                    </body>
                    </html>

