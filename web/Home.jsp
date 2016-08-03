<%-- 
    Document   : Home
    Created on : Aug 1, 2016, 11:56:13 AM
    Author     : kabil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head runat="server">
    <title>HomePage</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="Styles/Main.css" />
    <script type="text/javascript">
        function redirect()
        {
            window.location.href = "Index.aspx";
        }
    </script>
</head>
<body class="home-background">
    <div class="jumbotron text-center jumbotronbg">
        <h1>Shopping Cart</h1>
        <p>The Destiny for all your needs.</p>
    </div>
    <div>
        <label class="text-left" style="margin-left: 20px; font-size: 30px">Welcome User,</label>
        <button type="button" class="btn btn-default" onclick="return redirect()" style="float: right; margin-right: 40px;">Logout</button>
    </div>
    <nav class="navbar navbar-inverse" style="margin-top: 10px; margin-left: 20px; margin-right: 20px">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">WebSiteName</a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Men
        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Shirts</a></li>
                        <li><a href="#">Pants</a></li>
                        <li><a href="#">Slippers</a></li>
                    </ul>
                </li>
                <li><a href="#">Women</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Sarees</a></li>
                        <li><a href="#">Salwar</a></li>
                        <li><a href="#">Slippers</a></li>
                    </ul>
                </li>
                <li><a href="#">Kids</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Boys</a></li>
                        <li><a href="#">Girls</a></li>
                        <li><a href="#">Toys</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</body>
</html>

