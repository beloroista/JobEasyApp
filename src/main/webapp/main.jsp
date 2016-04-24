<%-- 
    Document   : main.jsp
    Created on : Apr 6, 2016, 10:23:42 PM
    Author     : zhangqian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String name = (String) request.getSession().getAttribute("username");
    
    //.....others:)

%>
<!DOCTYPE html>
<html ng-app="MyJobEveryDayApp">
    <head>
        <title>MainPage</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--AngularJS-->
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.16/angular.min.js"></script>
        <!--JQuery-->
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <!--Bootstrap-->
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script><!--GoogleFont-->
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic&subset=latin,greek,greek-ext' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700|Noto+Sans:400,700|Cabin|Oxygen:400,700' rel='stylesheet' type='text/css'>
        <!--FontAwesome-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <!--TypeAhead-->
        <script src="typeahead.js/typeahead.bundle.js" type="text/javascript"></script>
        <script src="typeahead.js/bloodhound.js" type="text/javascript"></script>
        <script src="typeahead.js/bootstrap3-typeahead.min.js" type="text/javascript"></script>
        <!--MyCSS-->
        <link href="css/mainCSS.css" rel="stylesheet" type="text/css"/>
        <link href="css/headercss.css" rel="stylesheet" type="text/css"/>
        <!--MyJS-->
        <script src="js/main.js" type="text/javascript"></script>
       
        
    </head>
    <body>
        <div class=" rtl">
            <div id="logo">
                <span  id="username" style="font-family:Open Sans;color:#582f37">Hi, Chi Zhang</span>
                <!--use username to do identification-->
                <span style="font-family:Open Sans;color:#582f37"><% //out.println(username); %></span>
                <a href="/">
                <img src="img/logo.png" alt=""/>
                <span style="font-family:Open Sans;color:#582f37 ">Welcome to <strong>JobEasily</strong></span>
            </a>
            </div>

            <div id="menu">
                <a class="home-link" href="main.jsp">My Index</a>
                <a href="saving.jsp">My Favorites</a>
            </div>
        </div>

        
        <div class="container content" ng-controller="searchController">
           <div class="container"><hr style="border-color:#fff"></div>
            <div class="container search container-fluid search">
                
                <!--search-->
                <div class="search_section row" id = "jobTitle">
                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-5">
                        <span class="title" style="font-size: 20px;font-family: 'Montserrat', sans-serif;  padding-left: 40%">Key Word:</span>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-5">
                        <label class="sr-only">Key Word</label>
                        <input type="jobtitle" class="form-control" id="JobTitle" placeholder='Key word...'> 
                    </div>

                </div>
                <!--skills-->
                <div class="search_section row" id ="skillType">
                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-5">
                        <span class="title" style="font-size: 20px;font-family: 'Montserrat', sans-serif;  padding-left: 40%">Skills:</span>
                    </div>
                    <div class="col-lg-9 col-md-9 col-sm-8 col-xs-7">
                        
                        <span ng-repeat="skill in skillList" class="skills label label-primary " style=" display: inline-block;margin: 5px;font-size: 15px;">{{skill}}</span>
                          
                        <a href="" ng-click=""><i ng-click="addSkillButton()" class="fa fa-plus fa-lg"></i></a>
                        <a href="" ng-click="" id="minusSkill"><i ng-click="deleteSkillButton()" class="fa fa-minus fa-lg"></i></a>
                        
                        <div class="row" id = "addSkill" style="margin-top: 10px">
                            <div class="col-lg-6 col-md-8 col-sm-8 col-xs-8">
                            <label class="sr-only">Job Title</label>
                            <input ng-model="newSkill" type="jobtitle" class="form-control" id="" placeholder='Job title...'> 
                            </div>
                            <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
                                <button type="button" class="btn btn-default" ng-click="addSkill()">Add</button>

                            </div>
                            <div class="col-lg-1 col-md-2 col-sm-3 col-xs-2">
                                <button type="button" class="btn" ng-click="hideSkillButton()">Hide</button>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class=" search_section row" id="location">
                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-5">
                        <span class="title" style="font-size: 20px;font-family: 'Montserrat', sans-serif;  padding-left: 40%">Locations:</span>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-2" id="bloodhound">
<!--                        <label class="sr-only">Job Title</label>-->
                        <input  type="" class="form-control typeahead" id="newState" placeholder='State...' onchange="cityTypeAHead()"> 
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3" id="bloodhound">
<!--                        <label class="sr-only">Job Title</label>-->
                        <input  type="" class="form-control typeahead" id="newCity" placeholder='City...'> 
                    </div>

                    <div class="col-lg-1 col-md-4 col-sm-2 col-xs-2" id="locationTap" >
                        <span ng-repeat="location in getlocationList()" class="label label-primary " style=" display: inline-block;font-size: 17px;margin: 5px;">{{location}}</span>
                    </div>
                </div>
                <div class="container-fluid">
                        <button type="botton" ng-click="search()" class="btn" style="width:30%;margin-left: 35%;margin-top: 20px">Search</button>
                </div>
                <div class="container"><hr style="border-color:#fff"></div>
            </div>
            
           
            
            <div class="container result" ng-init="ini()">
                
                <div class="res_wrap row" ng-repeat="res in results">
                    <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4">
                        <div  style="margin-left: 50%;height: 100%;width:auto;vertical-align: middle">
                            <img  style="max-width: 100%;margin-top: 5%;" src="{{res.imgurl}}" alt=""/>
                           
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-7 col-sm-7 col-xs-6">
                        <div>
                            <a style="display: inline" href="{{res.url}}"><div class="res_title container">{{res.jobtitle}}</div></a>
                        </div>
                        <div class=" res_company container" onclick="toggleInfo.call(this)" ><a type="bottom">{{res.company}}</a>
                        <div class = "res_company res_company_details ">
                            <div class=" row ratings" style="display:none">
                                <div class="col-lg-4 col-md-5 col-sm-5 col-xs-12 company_rating">
                                    <span class="rating_des">Culture And Values Rating:</span> <span class="rating_res">{{res.company}}</span>
                                </div>
                                <div class="col-lg-4 col-md-5 col-sm-5 col-xs-12 company_rating">
                                    <span class="rating_des">Senior Leadership Rating:</span> <span  class="rating_res">{{res.company}}</span>

                                </div>
                            </div>
                            <div class="row ratings" style="display:none">
                                <div class="col-lg-4 col-md-5 col-sm-5 col-xs-12 company_rating">
                                    <span class="rating_des">Compensation And Benefits Rating:</span> <span  class="rating_res">{{res.company}}</span>
                                </div>
                                <div class=" company_rating col-lg-4 col-md-5 col-sm-5 col-xs-12 ">
                                    <span class="rating_des">Work Life Balance Rating:</span> <span  class="rating_res">{{res.company}}</span>
                                </div>
                            </div>
                        </div>
                        </div>
                        <div class="res_time container">Date: {{res.formattedRelativeTime}}</div>  
                        <div class="res_location container">Location: {{res.formattedLocation}}</div>  
                        <div class="res_des container">
                            <p style="overflow: hidden">{{res.snippet}}</p>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                        <div class="container" style="margin-top: 10%">
                            <a class="hearts" onclick="clickHeart.call(this)"><i class="fa fa-heart-o fa-2x" aria-hidden="true" ></i></a>
                        </div>
                        
                    </div>
                </div>
                
                <button ng-click="loadmore()" type="button" class="btn" id="loadMoreButton" style="width:30%;margin-left: 35%;margin-top: 20px">Load More</button>
                
               
                
                
                
                <!--page-->
                
            </div>
        </div>
         
        
        
        <span id="top-link-block" hidden="" style="display: block;">
            <a href="#top" class="well well-sm" onclick="$('html,body').animate({scrollTop:0},'slow');return false;">
                <i class="glyphicon glyphicon-chevron-up"></i>Top
            </a>
        </span>
        <div class="footer">
            <div>
            <hr>
            <p class="text-muted text-center">Copyright @ MyJob. All rights reserved. </p>
            </div>
        </div>
                <h1 id="LastName">ooooo</h1>
                <h1 id="goo">iii</h1>
                 <h1 id="good">isii</h1>
        
    </body>
</html>
