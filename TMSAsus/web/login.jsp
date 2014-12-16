<!DOCTYPE html>
<%@page import="dbConnection.DBConnect"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html lang="en">

    <head>
        <%
            DBConnect myDBConnection = new DBConnect();
            myDBConnection.loadConnection();
            Connection myConnection = myDBConnection.getConnection();
            Statement stmt = myConnection.createStatement();
        %>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Training Management System</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>

        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Please Sign In</h3>
                        </div>
                        <div class="panel-body">
                            <form name="form" method="POST" action="./loginVerify">
                                <fieldset>
                                    <% int error = 0;
                                        if (request.getParameter("error") != null) {
                                            error = Integer.parseInt(request.getParameter("error"));
                                    }

                                    if (error == 2) {%>
                                    <div class="form-group">
                                        <p>Wrong Username / Password</p>
                                       
                                    </div>
                                     <% }myDBConnection.closeConnection(); %>
                                    <div class="form-group">
                                        <div class="form-group">
                                            <input class="form-control" placeholder="Username" name="username" type="acid" autofocus>
                                        </div>
                                        <div class="form-group">
                                            <input class="form-control" placeholder="Password" name="password" type="password" value="">
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>
                                                <input class="btn btn-lg btn-success btn-block" type="submit" value="Login">
                                            </label>
                                        </div>
                                        <!-- Change this to a button or input when using this as a form -->
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="js/plugins/metisMenu/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="js/sb-admin-2.js"></script>

    </body>

</html>
