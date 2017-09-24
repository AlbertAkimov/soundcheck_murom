<%--
  Created by IntelliJ IDEA.
  User: bert
  Date: 9/1/17
  Time: 4:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Личный кабинет</title>
    <meta charset="utf-8">
    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}">
    <link href="${contextPath}/resources/soundcheck/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <h1>Личный кабинет</h1>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <div id="testing2">
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
