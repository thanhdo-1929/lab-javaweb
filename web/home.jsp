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
                        <img class="image" src="${photographerInfor.specialImage}" />
                    </div>
                    <div class="title-img">${photographerInfor.title}</div>
                    <div class="view-gallery-panel">
                        <c:forEach items="${listTop3}" var="i">
                            <div class="gallery-item">
                                <div class="image-gallery">
                                    <img class="img-gallery" src="${i.pictureCover}">
                                </div>
                                <div class="title-gallery">

                                    <a href="GalleryController?id=${i.id}">View ${i.name}</a>
                                </div>
                                <div class="content-gallery">
                                   ${i.description}
                                </div>
                            </div>

                        </c:forEach>

                    </div>
                    <div class="about-me">
                        <div class="title-about">About me</div>
                        <div class="content-about">
                            ${photographerInfor.aboutMe}
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
