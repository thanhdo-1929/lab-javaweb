<%-- 
    Document   : gallery
    Created on : Sep 8, 2021, 9:52:08 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/gallery.css" rel="stylesheet" type="text/css"/>
        <link href="../css/gallery.css" rel="stylesheet" type="text/css"/>
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script
            src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
        <title>Gallery</title>
    </head>
    <body>
        <jsp:include page="components/header.jsp"/>
        <div class="main-content">
            <div class="content-and-share"> 
<!--                content-left-->
                <div class="content-panel">
                    <div class="title-content">Gallery 1</div>
                    <div class="panel-img-gallery">
                        <img class="image" src="../image/1.jpg" />
                       
                    </div>                
                    <div class="view-other-gallery">
                        
                            <div class="other-detail-panel shawdow">
                                <a href=""><img class="imagePicture" src="../image/1.jpg"/></a>
                            </div>
                         <div class="other-detail-panel shawdow">
                                <a href=""><img class="imagePicture" src="../image/2.jpg"/></a>
                            </div>
                         <div class="other-detail-panel shawdow">
                                <a href=""><img class="imagePicture" src="../image/3.jpg"/></a>
                            </div>
                         <div class="other-detail-panel shawdow">
                                <a href=""><img class="imagePicture" src="../image/4.jpg"/></a>
                            </div>
                         <div class="other-detail-panel shawdow">
                                <a href=""><img class="imagePicture" src="../image/5.jpg"/></a>
                            </div>
                         <div class="other-detail-panel shawdow">
                                <a href=""><img class="imagePicture" src="../image/6.jpg"/></a>
                            </div>
                         <div class="other-detail-panel shawdow">
                                <a href=""><img class="imagePicture" src="../image/7.jpg"/></a>
                            </div>
                         <div class="other-detail-panel shawdow">
                                <a href=""><img class="imagePicture" src="../image/8.jpg"/></a>
                            </div>
                       
<!--                        <div class="clear"></div>-->
                    </div> 
                    <div class="paging">
                       
                                <a class="current-page" href="#">1</a> 
                                <a class="current-page" href="#">2</a> 
                                              
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
