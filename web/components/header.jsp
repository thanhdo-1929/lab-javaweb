<%-- 
    Document   : header
    Created on : Sep 8, 2021, 9:47:43 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script
            src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>

        <div class="nav-bar">
            <div class="content-bar" id="myTopnav">

                <div class="item">
                    <a class="${linkActive=="HomeController"?"bold-font":""}"  href="HomeController">My front page</a>
                </div>
                <c:forEach items="${listTop3}" var="i">
                    <div class="item" >
                        <a class="${linkActive==i.id?"bold-font":""}" href="GalleryController?id=${i.id}">${i.name}</a>

                    </div>
                </c:forEach>
                <div class="item">
                    <a class="${linkActive=="ContactController"?"bold-font":""}" href="ContactController">Contact</a>
                </div>

            </div>
            <div id="toggle">
                <i class="fa fa-bars"></i>
            </div>

        </div>
        <div class="title">
            <div class="title-main">
                <div class="icon">
                </div>
                <div class="text">
                    <div class="photo-link"><a href="HomeController">PHOTOGRAPHER</a></div>
                    <div class="welcome-text">Welcome to this website</div>
                </div>
            </div>
        </div>

    </body>
</html>
