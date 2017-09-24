<%--
  Created by IntelliJ IDEA.
  User: bert
  Date: 8/28/17
  Time: 9:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="float" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Список работ</title>
    <meta charset="utf-8">
    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}">
    <link href="${contextPath}/resources/soundcheck/css/bootstrap.min.css" rel="stylesheet">

    <%--    <style>
            body {
                background: url(../../resources/img/mzkds.jpg) no-repeat;
                -moz-background-size: 100%; /* Firefox 3.6+ */
                -webkit-background-size: 100%; /* Safari 3.1+ и Chrome 4.0+ */
                -o-background-size: 100%; /* Opera 9.6+ */
                background-size: 100%; /* Современные браузеры */
            }
        </style>--%>
</head>
<body>
<div class="container">
    <button class="btn btn-success" onclick="get_ajax()">Показать мои</button>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <div id="error-user"></div>
    <div id="testing">
        <table class="table table-bordered table-hover table-striped table-condensed">
            <tr>
                <th width="30">№</th>
                <th width="120">Имя группы</th>
                <th width="40">Дата</th>
                <th width="50">Время(с)</th>
                <th width="50">Время(до)</th>
                <th width="50">Кол-во часов</th>
                <th width="100">Деятельность</th>
            </tr>
            <c:forEach items="${listBand}" var="band">
                <tr>
                    <td id="t-id">${band.id}</td>
                    <td id="t-nameBand">${band.nameBand}</td>
                    <td id="t-dateBand">${band.dateBand}</td>
                    <td id="t-startTime">${band.startTime}</td>
                    <td id="t-endTime">${band.endTime}</td>
                    <td id="t-countHours">${band.countHours}</td>
                    <td id="t-comment">${band.comment}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${contextPath}/resources/soundcheck/js/form/ajax.js"></script>
</body>
</html>
