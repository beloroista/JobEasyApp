
jQuery(document).ready(function() {
    /*
       validate username availabilty
    */
    $("#form-username").bind("blur", function(){
        console.log($(this).val());
        var username = $(this).val();
        $.ajax({
            type:"POST",
            url:"check",
            data:"username=" + username,
            success:function(msg){
                console.log(msg);
                //alert(msg);
                $("#status").html (msg);

            }

        });

    });

    $("#signup").click(function(){
        window.location.href='signup.jsp';
    })
	

    $("#login1").click(function(){
        window.location.href='index.jsp';
    })
    /*
        Fullscreen background
    */
    $.backstretch("img/4983.jpg");
    
    /*
        Form validation
    */
    $('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea').on('focus', function() {
    	$(this).removeClass('input-error');
    });
    
    $('.login-form').on('submit', function(e) {
    	
    	$(this).find('input[type="text"], input[type="password"], textarea').each(function(){
    		if( $(this).val() == "" ) {
    			e.preventDefault();
    			$(this).addClass('input-error');
    		}
    		else {
    			$(this).removeClass('input-error');
    		}
    	});
    	
    });
    
    
});
