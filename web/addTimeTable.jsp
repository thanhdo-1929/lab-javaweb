<%-- 
    Document   : addTimeTable
    Created on : Jun 23, 2021, 5:09:47 PM
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
                    <a href="PreAddController">Add TimeTable </a>
                </h2>
                <c:if test="${check ==0}">
                    <div style="text-align: center;color:blue;font-size: 18px;font-weight: bold;padding: 0 0 20px;"> ${mess}</div> 
                </c:if>
                <c:if test="${check !=0}">
                    <div style="text-align: center;color:red;font-size: 18px; padding: 0 0 20px;"> ${mess}</div> 
                </c:if>
            </div>
            <div class="content_add">
                <form action="AddController" method="POST">
                    <table>
                        <tbody>
                            <tr>
                                <td>Date</td>
                                <td>
                                    <input type="date" id="date" name="date" required />
                                </td>
                            </tr>
                            <tr>
                                <td>Slot</td>
                                <td>
                                    <select name="slot">
                                        <c:forEach items="${sessionScope.slot}" var="o">
                                            <option  value="${o.id}">${o.id}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Room</td>
                                <td>
                                    <select name="room"> 
                                        <c:forEach items="${sessionScope.room}" var="o">
                                            <option value="${o.id}">${o.room}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Teacher</td>

                                <td>
                                    <input type="text" name="teacher" required />
                                </td>
                            </tr>
                            <tr>
                                <td>Class/Course</td>
                                <td>
                                    <select name="class">
                                        <c:forEach items="${sessionScope.class}" var="o">
                                            <option value="${o.id}">${o.className}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><button type="submit" onclick="date()">Save</button></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
