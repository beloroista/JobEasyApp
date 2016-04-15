<%-- 
    Document   : main.jsp
    Created on : Apr 6, 2016, 10:23:42 PM
    Author     : zhangqian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="MyJobEveryDayApp">
    <head>
        <title>MainPage</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--AngularJS-->
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.16/angular.min.js"></script>
        <!--JQuery-->
        <script src="js/jquery-1.11.1.min.js"></script>
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
        <!--MyJS-->
        <script src="js/main.js" type="text/javascript"></script>
       
        
    </head>
    <body>
        <!--indeed api test-->
<!--        <button onclick="getQuery()">indeed api test</button>>
        <div id="div3">url</div>
        <div id="div4">job title</div>-->
           <!--indeed api test-->
           
        <div class="header">
            <h1 style="margin-left: 50%"><i class="fa fa-spinner fa-pulse fa-lg"></i></h1>
        </div>
        
        <div class="container content" ng-controller="searchController">
           
            <div class="container search container-fluid search">
                <hr>
                <!--search-->
                <div class="search_section row" id = "jobTitle">
                    <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4">
                        <span class="title" style="font-size: 20px;font-family: 'Montserrat', sans-serif;  padding-left: 40%">Job Title:</span>
                    </div>
                    <div class="col-lg-5 col-md-6 col-sm-6 col-xs-5">
                        <label class="sr-only">Job Title</label>
                        <input type="jobtitle" class="form-control" id="JobTitle" placeholder='Job title...'> 
                    </div>

                </div>
                <!--skills-->
                <div class="search_section row" id ="skillType">
                    <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4">
                        <span class="title" style="font-size: 20px;font-family: 'Montserrat', sans-serif;  padding-left: 40%">Skills:</span>
                    </div>
                    <div class="col-lg-10 col-md-9 col-sm-9 col-xs-7">
                        
                        <span ng-repeat="skill in skillList" class="label label-primary " style=" display: inline-block;margin: 5px;font-size: 15px;">{{skill}}</span>
                          
                        <a href="" ng-click=""><i ng-click="addSkillButton()" class="fa fa-plus fa-lg"></i></a>
                        
                        <div class="row" id = "addSkill" style="margin-top: 10px">
                            <div class="col-lg-6 col-md-8 col-sm-8 col-xs-8">
                            <label class="sr-only">Job Title</label>
                            <input ng-model="newSkill" type="jobtitle" class="form-control" id="" placeholder='Job title...'> 
                            </div>
                            <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">
                                <button type="button" class="btn" ng-click="addSkill()">Add</button>

                            </div>
                            <div class="col-lg-1 col-md-2 col-sm-3 col-xs-2">
                                <button type="button" class="btn" ng-click="hideSkillButton()">Hide</button>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class=" search_section row" id="location">
                    <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4">
                        <span class="title" style="font-size: 20px;font-family: 'Montserrat', sans-serif;  padding-left: 40%">Locations:</span>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-2" id="bloodhound">
<!--                        <label class="sr-only">Job Title</label>-->
                        <input  type="" class="form-control typeahead" id="newState" placeholder='State...'> 
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3" id="bloodhound">
<!--                        <label class="sr-only">Job Title</label>-->
                        <input  type="" class="form-control typeahead" id="newCity" placeholder='City...'> 
                    </div>
                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1" id="bloodhound">
                        <a href="" ng-click=""><i ng-click="addLocationButton()" style="margin:5px;" class="fa fa-plus fa-2x"></i></a>

                    </div>
                    <div class="col-lg-1 col-md-4 col-sm-2 col-xs-2" id="locationTap" >
                        <span ng-repeat="location in getlocationList()" class="label label-primary " style=" display: inline-block;font-size: 17px;margin: 5px;">{{location}}</span>
                    </div>
                </div>
                <div class="container-fluid">
<!--                    <div class="col-lg-2 col-md-3 col-xs-3 col-sm-3" >-->
                        <button type="button" ng-click="search()" class="btn" style="width:30%;margin-left: 35%;margin-top: 20px">Search</button>
                    <!--</div>-->
                </div>
                <hr>
            </div>
            
           
            
            <div class="container result" ng-init="ini()">
                
                <div class="res_wrap row" ng-repeat="res in results">
                    <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4">
                        <div style="margin-left: 50%;height: 100%;width:auto;vertical-align: middle">
                            <img style="max-width: 100%;margin-top: 5%;" src="img/ibm-squarelogo.png" alt=""/>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-8 col-sm-8 col-xs-6">
                        <a href="{{res.url}}"><div class="res_title container">{{res.jobtitle}}</div></a>
                        <div class="res_company container" >{{res.company}}</div>
                        <div class="res_time container">Date: {{res.formattedRelativeTime}}</div>  
                        <div class="res_location container">Location: {{res.formattedLocation}}</div>  
                        <div class="res_des container">
                            <p style="overflow: hidden">{{res.snippet}}</p>
                        </div>
                    </div>
                    
                    
                </div>
                <hr>
                
                
                
                <!--page-->
                <div class="container btn-group res_page" role="group" aria-label="First group"> 
                    <button type="button" class="btn btn-default">1</button>
                    <button type="button" class="btn btn-default">2</button> 
                    <button type="button" class="btn btn-default">3</button> 
                    <button type="button" class="btn btn-default">4</button> 
                    <button type="button" class="btn btn-default"><i class="fa fa-angle-right fa-lg"></i></button> 
                </div>
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
    </body>
</html>
