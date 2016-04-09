/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var skills = ["Java","JavaScript","JQuery", "HTML","CSS","AngularJS","D3","SQL","Sring","Algorithm"];
var locations =[];
var states = ["AL","AK","AS","AZ","AR","CA","CO","CT","DE","DC","FM","FL","GA","GU","HI","ID","IL","IN","IA","KS","KY",
    "LA","ME","MH","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND" ,"MP" ,"OH","OK","OR","PW",
    "PA","PR","RI","SC","SD","TN","TX","UT", "VT","VI","VA","WA","WV","WI","WY"];


var app = angular.module("MyJobEveryDayApp", []);

app.controller('jobTitleController', ['$scope', function jobTitleController($scope) {
    
}]);

app.controller('skillTypeController', ['$scope', function skillTypeController($scope) {
    
    $scope.skillList = skills;
   
    
    $scope.add = function(){
       $("#addSkill").show();   
    };
    $scope.hide = function(){
       $("#addSkill").hide(); 
    };
    $scope.addSkill = function(){
        console.log("as");
        $scope.skillList.push($scope.newSkill);
    };
}]);

app.controller('locationController', ['$scope', function locationController($scope) {
    
    
}]);

function stateTypeAHead(){
    $("#newState").typeahead({source:states});
    
}





    

/**
//abandoned city list with duplication , no proxy needed

function getCityData1(){
    state = $("#newState").val();
    var geocodingAPI = "http://gomashup.com/json.php?fds=geo/usa/zipcode/state/"+state+"&jsoncallback=?";
    var cities =[];
    
$.getJSON(geocodingAPI, function (json) {
    
$.each( json.result, function(index) {
    // this["City"] is the name of each city
      cities[index]=this["City"];
      });
      
      $('#div2').text(cities);
});   

}
**/

function getCityData(){
    state = $("#newState").val();
     var jobcity = {state: state};

    $.ajax({
        url: "GetCities",
        type: 'POST',
        data: JSON.stringify(jobcity),
        dataType:'json',  
       // contentType: 'text/html;charset=UTF-8',
//        mimeType: 'application/json',
 
        success: function (data) {
            // data is the jsonarray of cities
         $('#div1').text(state);
         $('#div2').text("");
         $('#div2').text(data);
        },
     error: function() {
           console.log("error");
       }
    });
   
 

}

$(document).ready(function(){
     $("#addSkill").hide();
     stateTypeAHead();
     getCityData();
});