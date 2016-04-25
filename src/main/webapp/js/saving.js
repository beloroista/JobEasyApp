/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function ini(){
    
    $.ajax({
    type:"POST",
    url:"/GetFav",
    data:"",
    //data:{name:name,price:price},
    success:function(msg){
        
        var a = $(".result");
            
        for(var i = 0; i< msg.length; i++){
        
            a.append("<div class='res_wrap row'>" +
                      "<div class='col-lg-2 col-md-3 col-sm-3 col-xs-4'>"+
                        "<div  style='margin-left: 50%;height: 100%;width:auto;vertical-align: middle'>" + 
                           "<img  style='max-width: 100%;margin-top: 5%;' src='"+msg.imgurl+"' alt=''/>"+
                        "</div>"+
                   " </div>"+
                   " <div class='col-lg-8 col-md-7 col-sm-7 col-xs-6'>"+
                       " <div>"+
                          "  <a style='display: inline' href='"+msg.url+"'><div class='res_title container'>"+msg.jobtitle+"</div></a>"+
                        "</div>"+
                      "  <div class=' res_company container' >"+
                        "<div class = 'res_company res_company_details '>"+msg.company+
                        "</div>"+
                        "</div>"+
                        "<div class='res_location container'>Location:"+msg.location+" </div>  "+
                        "<div class='res_des container'>"+
                            "<p style='overflow: hidden'>"+ msg.jobdetail+"</p>"+
                        "</div>"+
                    "</div>"+
                    "<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2'>"+
                       " <div class='container' style='margin-top: 10%'>"+
                            "<a class='hearts' onclick='deleteThisJob.call(this)'><i class='fa fa-heart fa-2x' aria-hidden='true' >Delete</i></a>"+
                        "</div>"+
                        
                    "</div>"+
                "</div>");
        }
    }
    });
    
    
};


function deleteThisJob(){
    var a = this;
    var a = this.childNodes;
    var b = this.parentNode.parentNode.parentNode.childNodes;
    var c = b[3];
    var d = c.childNodes;
    
    var f = d[1].childNodes;
    console.log(f[1].getAttribute("href"));
    var url = f;
            $.ajax({
                type:"POST",
                url:"/GetFav",
                data:{url:url},
                
                success:function(msg){
                    
                    window.location.reload();
                }
            });
    
    
    
}
$(document).ready(function(){
    ini();
    
    
});
