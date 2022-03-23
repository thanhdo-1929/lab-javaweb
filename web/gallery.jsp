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
        <title>Gallery</title>
    </head>
    <body>
        <jsp:include page="components/header.jsp"/>
        <div class="main-content">
            <div class="content-and-share"> 
<!--                content-left-->
                <div class="content-panel">
                    <div class="title-content">${gallery.name}</div>
                    <div class="panel-img-gallery">
                        <img class="image" src="${gallery.pictureCover}" />
                    </div>                
                    <div class="view-other-gallery">
                        <c:forEach var="i" items="${listPicture}">
                            <div class="other-detail-panel shawdow">
                                <a href=""><img class="imagePicture" src="${i.name}"/></a>
                            </div>
                        </c:forEach>
<!--                        <div class="clear"></div>-->
                    </div> 
                    <div class="paging">
                        <c:forEach items="${listCount}" var="i">
                            <c:if test="${pageIndex == i}">
                                <a class="current-page" href="GalleryController?id=${gallery.id}&index=${i}">${i}</a> 
                            </c:if>
                            <c:if test="${pageIndex != i}">
                                <a href="GalleryController?id=${gallery.id}&index=${i}">${i}</a> 
                            </c:if>
                        </c:forEach>                    
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
