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

function getCityData(){
    var state = $("#newState").val();
    
//    $.ajax({
//       type: "GET",
//       dataType: 'json',
//       contentType: 'text/plain',
//       xhrFields: {
//   
//        withCredentials: false
//        },
//
//        headers: {
//   
//       },
//       url:"http://api.sba.gov/geodata/city_links_for_state_of/pa.json",
//       success:function(data){
//           console.log(data);
//       },
//       error: function() {
//           console.log("error");
//       }
//    });
    

}



    

$(document).ready(function(){
     $("#addSkill").hide();
     stateTypeAHead();
     getCityData();
});