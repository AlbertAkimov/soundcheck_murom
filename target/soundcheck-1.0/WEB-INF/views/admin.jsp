<%--
  Created by IntelliJ IDEA.
  User: bert
  Date: 7/27/17
  Time: 12:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}">
    <link href="${contextPath}/resources/soundcheck/css/bootstrap.min.css" rel="stylesheet">


    <title>Admin</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="post" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2>Администратор ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Выйти</a>
        </h2>
    </c:if>
</div>

<h2> Подробная таблица рабочего времени</h2>

<div class="container">
    <button class="btn btn-success" onclick="get_ajax()">Показать мои</button>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <div id="error-user"></div>
    <div id="testing">
        <table class="table table-bordered table-hover table-striped table-condensed">
            <tr>
                <th width="30">№</th>
                <th width="30">Юзверг</th>
                <th width="40">Дата создания</th>
                <th width="120">Имя группы</th>
                <th width="40">Дата</th>
                <th width="50">Время(с)</th>
                <th width="50">Время(до)</th>
                <th width="50">Кол-во часов</th>
                <th width="60">Сумма</th>
                <th width="100">Деятельность</th>
                <th width="50">Изменить</th>
                <th width="50">Удалить</th>
            </tr>
            <c:forEach items="${adminList}" var="band">
                <tr>
                    <td id="t-id">${band.id}</td>
                    <td id="t-user-id">${band.userID}</td>
                    <td id="t-create-data">${band.createDate}</td>
                    <td id="t-nameBand">${band.nameBand}</td>
                    <td id="t-dateBand">${band.dateBand}</td>
                    <td id="t-startTime">${band.startTime}</td>
                    <td id="t-endTime">${band.endTime}</td>
                    <td id="t-countHours">${band.countHours}</td>
                    <td id="t-price">${band.price}</td>
                    <td id="t-comment">${band.comment}</td>
                    <td><a href="<c:url value="/edit/${band.id}" />">Изменить</a> </td>
                    <td><a href="<c:url value="/remove/${band.id}" />">Изменить</a> </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>

