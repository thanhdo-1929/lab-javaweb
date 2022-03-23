<%-- 
    Document   : home
    Created on : Sep 8, 2021, 3:50:12 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <script
            src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
        <title>Home Page</title>
    </head>
    <body>
        <jsp:include page="components/header.jsp"/>
        <div class="main-content">
            <div class="content-and-share">
                <div class="content-panel">
                    <div>
                        <img class="image" src="../image/max.jpg" alt="" />
                    </div>
                    <div class="title-img">Lorem ipsum dolor sit amet</div>
                   
                    <div class="view-gallery-panel">
                      
                            <div class="gallery-item">
                                <div class="image-gallery">
                                    <img class="img-gallery" src="../image/1.jpg">
                                    
                                </div>
                                <div class="title-gallery">

                                    <a href="../gallery.jsp">View Gallery 1</a>
                                </div>
                                <div class="content-gallery">
                                   Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation
                                </div>
                            </div>

                         <div class="gallery-item">
                                <div class="image-gallery">
                                    <img class="img-gallery" src="../image/2.jpg">
                                    
                                </div>
                                <div class="title-gallery">

                                    <a href="../gallery.jsp">View Gallery 2</a>
                                </div>
                                <div class="content-gallery">
                                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation
                                </div>
                            </div>
                         <div class="gallery-item">
                                <div class="image-gallery">
                                    <img class="img-gallery" src="../image/3.jpg">
                                    
                                </div>
                                <div class="title-gallery">

                                    <a href="../gallery.jsp">View Gallery 3</a>
                                </div>
                                <div class="content-gallery">
                                 Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation
                                </div>
                            </div>
                      

                    </div>
                    <div class="about-me">
                        <div class="title-about">About me</div>
                        <div class="content-about">
                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim
                        </div>
                    </div>
                </div>
                <jsp:include page="components/right.jsp"/>
               
            </div>
        </div>
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
