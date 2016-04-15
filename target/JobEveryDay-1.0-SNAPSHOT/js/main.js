/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var skills = ["Java","JavaScript","JQuery", "HTML","CSS","AngularJS","D3","SQL","Sring","Algorithm"];


var states = ["AL","AK","AS","AZ","AR","CA","CO","CT","DE","DC","FM","FL","GA","GU","HI","ID","IL","IN","IA","KS","KY",
    "LA","ME","MH","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND" ,"MP" ,"OH","OK","OR","PW",
    "PA","PR","RI","SC","SD","TN","TX","UT", "VT","VI","VA","WA","WV","WI","WY"];


var app = angular.module("MyJobEveryDayApp", []);


app.controller('searchController', ['$scope','$http', function searchController($scope,$http) {
    
    $scope.skillList = skills;

    $scope.addSkillButton = function(){
       $("#addSkill").show();   
    };
    $scope.hideSkillButton = function(){
       $("#addSkill").hide(); 
    };
    $scope.addSkill = function(){
        $scope.skillList.push($scope.newSkill);

    };
    
    var locations =[];
    var locationList = [];
    console.log("len="+locations.length);
    $scope.addLocationButton = function(){
        
        locationList.push({state:$("#newState").val(),city:$("#newCity").val()});
        locations.push($("#newCity").val()+", "+$("#newState").val());
        console.log(locations);

    };
    
    $scope.getlocationList = function(){
       if(locations.length === 0){
           $("#locationTap").hide();
           //console.log("iniLocation");
       }else{
            $("#locationTap").show();
       }
        return locations;
    };
    function getLoc(){
        var index = 0;
        var res = [];
        while(index < locationList.length){
            //console.log(locationList[index].state);
            res.push(locationList[index].state);
            index ++;
        }
        return res;
    };
    

    //search function
    $scope.results = [];
    $scope.ini = function(){
        var jt = "fulltime";
        var q = "software engineer";
        var sort ="relevance";
        var start = "0";
        var limit = "10";
        var l = "pittsburgh,pa";
        var userip = "1.2.3.4";
        
        $http({
            method : "GET",
            url : "/GetResults",
            params:{jt:jt,q:q,sort:sort,start:start,limit:limit,l:l,userip:userip}
            }).then(function(response) {
                $scope.results = response.data.results;

            }, function myError(response) {
                console.log("error");
            });

        console.log($scope.results);
       
    };
    
    $scope.search = function(){
        var jt = "fulltime";
        var q = $("#JobTitle").val();
        var sort ="relevance";
        var start = "0";
        var limit = "10";
        var l = $("#newState").val();
        var userip = "1.2.3.4";
        
        $http({
            method : "GET",
            url : "/GetResults",
            params:{jt:jt,q:q,sort:sort,start:start,limit:limit,l:l,userip:userip}
            }).then(function(response) {
                $scope.results = response.data.results;

            }, function myError(response) {
                console.log("error");
            });

        console.log($scope.results);
    };
    
    
    
}]);



//typeahead related
function stateTypeAHead(){
    $("#newState").typeahead({source:states});
    
}

function cityTypeAHead(){
    $("#newCity").focus(function(){
        console.log("focus");
        getCityData();
    });
    
}

function getCityData(){
    var state = $("#newState").val();
    console.log(state);
    var jobcity = {state: state};
    $.ajax({
        url: "GetCities",
        type: 'POST',
        data: JSON.stringify(jobcity),
        dataType:'json',  
        success: function (data) {
            $("#newCity").typeahead('destroy');
            $("#newCity").typeahead({source:data});
            console.log(state+","+data[0]);
            
        },
     error: function() {
           console.log("error");
       }
    });
   
 

}

//backtoTop
function backToTop(){
    var amountScrolled = 300;

        $(window).scroll(function() {
            if ( $(window).scrollTop() > amountScrolled ) {
   		$('#top-link-block').fadeIn('fast');
            } else {
   		$('#top-link-block').fadeOut('fast');
            }
         });
}


function iniPage(){
   
   
}

$(document).ready(function(){
     $("#addSkill").hide();
     stateTypeAHead();
     cityTypeAHead();
     backToTop();
     //iniPage();
});