<%-- 
    Document   : contact
    Created on : Sep 8, 2021, 9:52:21 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/contact.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="../css/contact.css" rel="stylesheet" type="text/css"/>
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script
            src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
        <title>Contact</title>
    </head>
    <body>
        <jsp:include page="components/header.jsp"/>
        <!--main content-->
        <div class="main-content">            
            <div class="content-and-share">
                <!--content-->
                <div class="content-panel">                    
                    <div class="title-content">Contact</div>
                    <div class="info-title">PHOTOGRAPHER</div>                    
                    <div class="info">
                        <div class="address">
                            <ul>
                                <li>Address:&nbsp;Xuan Phu, Xuan Truong, Nam Dinh</li>
                                <li>City:&nbsp; Nam Dinh </li>
                                <li>Country:&nbsp; Viet Nam</li>
                            </ul>
                        </div>
                        <div class="contact-way">
                            <p>Tel: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0393611610 </p>
                            <p>Email:&nbsp;&nbsp; giangtong3005@gmail.com</p>
                        </div>
                    </div>
                    <div class="image-map">
                      
                        <img src="../image/map.png" alt=""/>
                       
                    </div>
                </div>
                <!--end content-->
                <!--share-->
                <jsp:include page="components/right.jsp"/>
                <!--end share-->
            </div>         
        </div>
        <!-- end main content -->
        <jsp:include page="components/footer.jsp"/>
          <script>
            $(document).ready(function () {
                $('#toggle').click(function () {
                   
                    $('.item').slideToggle();
                });
            });
        </script>
    </body>
</html>
