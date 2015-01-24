<%-- 
    Document   : moderator_image_slide
    Created on : Mar 20, 2012, 4:19:42 PM
    Author     : Anwesha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="jquery-1.7.1.min.js"></script>
        <script type="text/javascript">
            $(function(){
                $("#hide").hide();
               $("#b1").click(function(){
                   
                   var image=new Image();
                        $(image).load(function(){
                        
                     
                $("img").replaceWith(this);
                 
                $("#pic").slideDown();
               
                $("#hide").show();
                  }).attr('src','IssueCover/Basketball.png');
               });
            
            $("#hide").click(function(){
               
                $("#pic").slideUp();
                $("#hide").hide();
            });
    

});
            
                </script>
            
           </head>
    <body>
        <h1>MODERATOR REPORTS</h1>
        
        <hr>
         <a id="b1">VIEW REPORT</a>
         <br>
        <div id="pic" >
            <img>
        </div>
        <br>
       
        <a id="hide">HIDE</a>
    </body>
</html>
