<%-- 
    Document   : saving
    Created on : Apr 21, 2016, 8:06:32 PM
    Author     : zhangqian
--%>

<%@page contentType='text/html' pageEncoding='UTF-8'%>
<!DOCTYPE html>
<html>
    <head>
        <title>MainPage</title>
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <!--AngularJS-->
        <script src='https://ajax.googleapis.com/ajax/libs/angularjs/1.3.16/angular.min.js'></script>
        <!--JQuery-->
        <script src='js/jquery-1.11.1.min.js'></script>
        <script src='//code.jquery.com/ui/1.11.4/jquery-ui.js'></script>
        <!--Bootstrap-->
        <!-- Latest compiled and minified CSS -->
        <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css' integrity='sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7' crossorigin='anonymous'>
        <!-- Optional theme -->
        <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css' integrity='sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r' crossorigin='anonymous'>
        <!-- Latest compiled and minified JavaScript -->
        <script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js' integrity='sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS' crossorigin='anonymous'></script><!--GoogleFont-->
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic&subset=latin,greek,greek-ext' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700|Noto+Sans:400,700|Cabin|Oxygen:400,700' rel='stylesheet' type='text/css'>
        <!--FontAwesome-->
        <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>
        <!--TypeAhead-->
        <script src='typeahead.js/typeahead.bundle.js' type='text/javascript'></script>
        <script src='typeahead.js/bloodhound.js' type='text/javascript'></script>
        <script src='typeahead.js/bootstrap3-typeahead.min.js' type='text/javascript'></script>
        <!--MyCSS-->
        <link href='css/mainCSS.css' rel='stylesheet' type='text/css'/>
        <link href='css/headercss.css' rel='stylesheet' type='text/css'/>
        <script src='js/saving.js' type='text/javascript'></script>
        <!--MyJS-->
        
       
        
    </head>
    <body>
        <body>
        <div class=' rtl'>
            <div id='logo'>
                <span style='font-family:Open Sans;color:#582f37'>Hi, Chi Zhang</span>
                <!--use username to do identification-->
                <span style='font-family:Open Sans;color:#582f37'><% //out.println(username); %></span>
                <a href='/'>
                <img src='img/logo.png' alt=''/>
                <span style='font-family:Open Sans;color:#582f37 '>Welcome to <strong>JobEasily</strong></span>
            </a>
            </div>

            <div id='menu'>
                <a class='home-link' href='main.jsp'>My Index</a>
                <a href='saving.jsp'>My Savings</a>
            </div>
             
            <!--my savings-->
            <div class='container result'>
                
               
                
               

            </div>
    </body>
</html>
