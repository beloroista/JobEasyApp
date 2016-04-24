/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var skills = ["JavaScript","JQuery", "HTML"];

var id;

var states = ["AL","AK","AS","AZ","AR","CA","CO","CT","DE","DC","FM","FL","GA","GU","HI","ID","IL","IN","IA","KS","KY",
    "LA","ME","MH","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND" ,"MP" ,"OH","OK","OR","PW",
    "PA","PR","RI","SC","SD","TN","TX","UT", "VT","VI","VA","WA","WV","WI","WY"];


var app = angular.module("MyJobEveryDayApp", []);


app.controller('searchController', ['$scope','$http', function searchController($scope,$http) {
    
    $scope.skillList = ["JavaScript","JQuery", "HTML"];
    $scope.results = [];
    $scope.testresults = [];

    $scope.addSkillButton = function(){
       $("#addSkill").show();   
    };
    $scope.hideSkillButton = function(){
       $("#addSkill").hide(); 
    };
    $scope.addSkill = function(){
        $scope.skillList.push($scope.newSkill);
        skills.push($scope.newSkill);
    };
    
    
    $scope.deleteSkillButton = function(){
        var minus = $("#minusSkill");
        $("#minusSkill").hide();
        minus.after("<div id='delWrap'><span style='margin-left:15px'>Please Click to delete the skill you want! and click <span> <a id = 'finish' ng-click='finish()' style='margin-left:20px'><i ng-click= 'finish()' class='fa fa-check fa-lg'></i></a><span style='margin-left:15px'> to finish <span></div>");
        $(".skills").attr("class","skills label label-danger");
        $(".skills").attr("ng-click","alert('hahah');");
        console.log("1");
        $scope.remove = function(array, index){
            console.log("2");
            array.splice(index, 1);
        };
        
        $(".skills").click(function(){
            $(this).attr("style","text-decoration: line-through;background-color:grey;font-size: 15px;display: inline-block;margin: 5px;  display:none");
            
            
            var value = this.innerHTML;
            console.log(value);
            for(var i = 0 ;i < $scope.skillList.length;i++){
                if(value === $scope.skillList[i]){
                    //$scope.skillList.push("hhh");
                    delete $scope.skillList[i];
                }
            }
            console.log($scope.skillList);
        });
        
        
        $("#finish").click(function(){
            $("#minusSkill").show();
            $("#delWrap").hide();
            $(".skills").attr("class","skills label label-primary  ng-binding ng-scope");
             $(".skills").unbind();
        });

    
    
    };

    $scope.togg = function(){
        var a = this;
        var b = this.childNodes;
        alert("asd");
        console.log(a);
        b.toggle(); 
  
       
   };
    $scope.testglo = function(){
      
        console.log($scope.results);
        console.log($scope.testresults);
       
  
       
   };

    //search function and ini page 
    
    
    $scope.ini = function(){
        
        var jt = "fulltime";
        var q = "software engineer";
        var sort ="relevance";
        var start = "0";
        var limit = "10";
        var l = "san jose,ca";
        var userip = "1.2.3.4";      

        
        $http({
            method : "GET",
            url : "GetResults",
            params:{jt:jt,q:q,sort:sort,start:start,limit:limit,l:l,userip:userip}
            }).then(function(response) {
                $scope.results = response.data.results;  
                $("#good").text(JSON.stringify(response.data.results));


           }, function myError(response) {
                console.log("error");
            });            
        console.log($scope.results);
    }; 
    
//    $scope.ini = function(){
//          $http({
//            method : "GET",
//            url : "GetProfile",
//            params:{state: "OK"}
//            }).then(function(response) {
//                $scope.skillList =response.data.skills;
//                
//                $scope.id=response.data.id;
//                $("#username").text("Hi,"+response.data.id+" "+response.data.lastName);
//                $("#userID").text(response.data.id);
//                var jt = "fulltime";
//                var q = getStringSkills($scope.skillList);
//                q = q.substring(1,q.length+1);
//            var sort ="relevance";
//            var start = "0";
//            var limit = "10";
//            var l = "san jose,ca";
//            var userip = "1.2.3.4";      
//
//        
//        $http({
//            method : "GET",
//            url : "GetResults",
//            params:{jt:jt,q:q,sort:sort,start:start,limit:limit,l:l,userip:userip}
//            }).then(function(response) {
//                $scope.results = response.data.results;  
//                $("#good").text(JSON.stringify(response.data.results));
//                
//
//           }, function myError(response) {
//                console.log("error");
//            });            
//                
//            }, function myError(response) {
//                console.log("error");
//            });
//
//       
//        console.log($scope.results);
//    }; 
    
    $scope.search = function(){
        
        if($scope.page !== 0){
            console.log($scope.page);
            $scope.page === 10;
        }
        
        var skills = getSkillsData();
        
        var q1 = getStringSkills(skills);
   
        var jt = "fulltime";
        var q = q1 +" " +$("#JobTitle").val();
        q = q.substring(1,q.length+1);
        var sort ="relevance";
        var start = "0";
        var limit = "10";
        var l = $("#newCity").val()+","+$("#newState").val();
        var userip = "1.2.3.4";
        console.log(l);
        
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
    
    //update results
    $scope.page = 10;
    $scope.loadmore = function(){
        $scope.page = $scope.page + 5;
        var skills = getSkillsData();   
        var q1 = getStringSkills(skills);
        var jt = "fulltime";
        var q = q1 +" " +$("#JobTitle").val();
        q = q.substring(1,q.length+1);
        console.log(q);
        var sort ="relevance";
        var start = "0";
        var limit = $scope.page;
        var l = $("#newCity").val()+","+$("#newState").val();
        var userip = "1.2.3.4";
        console.log($scope.page);
        var beforeLen = $scope.results.length;
        $http({
            method : "GET",
            url : "/GetResults",
            params:{jt:jt,q:q,sort:sort,start:start,limit:limit,l:l,userip:userip}
            }).then(function(response) {
                $scope.results = response.data.results;
                console.log(response.data.results);
                var nowLen = $scope.results.length;
                console.log(nowLen);
                if(nowLen === beforeLen){
//                    alert("No more data");
                }
            }, function myError(response) {
                console.log("error");
            });

        console.log($scope.results);
    };
    
    // get company detail
    

    
    $scope.getProfileAndIni=function(){
            $http({
            method : "GET",
            url : "GetProfile",
            params:{state: "OK"}
            }).then(function(response) {
                $scope.skillList =response.data.skills;
                $scope.id=response.data.id;
                $("#username").text("Hi,"+response.data.id+" "+response.data.lastName);
                $("#userID").text(response.data.id);
                
                
            }, function myError(response) {
                console.log("error");
            });

    };
    
//    $scope.putFav=function(){
//            $http({
//            method : "GET",
//            url : "PutFav",
//            params:{id: "rrOK",jobtitle:"ook",company:"iu",url:"abc",imgurl:"def",jobdetail:"wq"}
//            }).then(function(data) {
//            $("#LastName").text("ok"); 
//
//            }, function myError(data) {
//                console.log("error");
//            });
//    };
    

}]);



//typeahead related
function stateTypeAHead(){
    $("#newState").typeahead({source:states});
   
}

function cityTypeAHead(){
    $("#newCity").one('focus',function(){
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

//save function  !!!! important
function clickHeart(){

    var a = this.childNodes;
    var b = a[0];
    var classNameNow = b.className;
    if(classNameNow ==="fa fa-heart-o fa-2x"){
       $(b).attr("class","fa fa-heart fa-2x");
       //function to save this job, you can use ajax using jQuery or javascript to finish this function
       
           var jobputfav = {id: "OtK",jobtitle:"ook",company:"iu",url:"abc",imgurl:"def",jobdetail:"wq"};
        $.ajax({
        url: "PutFav",
        type: 'POST',
        data: jobputfav,
   // data: JSON.stringify(jobputfav),
      //  dataType:'json',    
        success: function (data) {
            $("#newCity").typeahead('destroy');
            $("#newCity").typeahead({source:data});
            console.log(state+","+data[0]);
            
        },
     error: function() {
           console.log("error");
       }
    });
    }else{
        $(b).attr("class","fa fa-heart-o fa-2x");
       //function to unsave this job
    
    }
    
    
}

function toggleInfo(){
    var a = this;
    
    $(this).children(".res_company_details").children(".ratings").toggle();
}

function getSkillsData(){
    var skills = [];
    var a = $(".skills");
    var size = a.length;

    for (var i=0;i<size;i++)
    {
        if(a[i].style.display === "none"){
            continue;
        }
        skills.push(a[i].innerHTML);
    }
   
    return skills;  
}

function getStringSkills(s){
    var res = "";
    for (var i=0;i<s.length;i++)
    {
        res = res+" " +s[i] + " "+ "or";
    }
    return res;
}

$(document).ready(function(){   
     $("#addSkill").hide();
     stateTypeAHead();
     //cityTypeAHead();
     backToTop();
     
});


  
   
 



