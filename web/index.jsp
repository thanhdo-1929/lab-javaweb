<%-- 
    Document   : index
    Created on : Jun 23, 2021, 5:09:25 PM
    Author     : Hùng
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css" />
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h2>
                    <a href="HomeController">
                        <img src="images/timetable.png" style="width: 30px; height: 30px" />
                    </a>  
                    <a href="HomeController"> Time Table </a>
                </h2>
                <p style="text-align: center;color: red;">${error}</p>
                <form action="SearchController" method="POST">
                    <div class="from">
                        <p>From Date</p>
                        <input type="date" name="from" value="${from}" required/>
                    </div>
                    <div class="to">
                        <p>To Date</p>
                        <input type="date" name="to" value="${to}" required/>
                        <button type="submit">Search</button>
                    </div>
                    <img src="images/add.png" style="width: 20px; height: 25px; margin-bottom: -10px;" />
                    <a href="PreAddController">Add timetable</a>
                </form>
            </div>
            <c:if test="${check==0}">
                <p style="text-align: center;color: red;">There is no Schedule for this period!</p>
            </c:if>
            <c:if test="${check==1}">
                <div class="content">
                    <table>
                        <thead>
                            <tr>
                                <th>
                                    <img src="images/timetable.png" style="height: 15px; width: 15px"/>
                                    Date
                                </th>
                                <th>
                                    <img src="images/clock.png" style="height: 15px; width: 15px" />
                                    Tiết
                                </th>
                                <th>
                                    <img src="images/clock.png" style="height: 15px; width: 15px" />
                                    Time
                                </th>
                                <th>Class</th>
                                <th>Teacher</th>
                                <th>Room</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="o">
                                <tr>
                                    <td>${o.date}</td>
                                    <td>${o.slot}</td>
                                    <td>${o.time}</td>
                                    <td><p>${o.className}</p></td>
                                    <td>${o.teacher}</td>
                                    <td>${o.room}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>

        </div>
    </body>
</html>
