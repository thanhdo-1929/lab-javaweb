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
                                <li>Address:&nbsp; ${photographerInfor.address}</li>
                                <li>City:&nbsp; ${photographerInfor.city}</li>
                                <li>Country:&nbsp; ${photographerInfor.country}</li>
                            </ul>
                        </div>
                        <div class="contact-way">
                            <p>Tel: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${photographerInfor.phone}</p>
                            <p>Email:&nbsp;&nbsp; ${photographerInfor.email}</p>
                        </div>
                    </div>
                    <div class="image-map">
                      
                        <img src="${photographerInfor.map}" alt=""/>
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
