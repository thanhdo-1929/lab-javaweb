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
        <title>JSP Page</title>
    </head>
    <body>
        <div class="nav-bar">
            <div class="content-bar" id="myTopnav">
                <div class="item">
                    <a class="bold-font" href="../home.jsp">My front page</a>
                   
                </div>

                <div class="item">
                    <a  href="../gallery.jsp">Gallery 1</a>
                   
                </div>
                <div class="item">
                    <a  href="../gallery.jsp">Gallery 2</a>
                </div>
                <div class="item">
                    <a  href="../gallery.jsp">Gallery 3</a>
                </div>

                <div class="item">
                    <a  href="../contact.jsp">Contact</a>
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
                    <div class="photo-link"><a href="../home.jsp">PHOTOGRAPHER</a></div>
                    <div class="welcome-text">Welcome to this website</div>
                </div>
            </div>
        </div>
    </body>
</html>
