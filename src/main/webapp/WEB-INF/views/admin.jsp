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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/datepicker/jquery.datetimepicker.css"/>
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

<div align="center">
    <h2> Подробная таблица рабочего времени</h2>
</div>

<div class="container">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <div id="error-user"></div>
    <div id="testing">
        <table class="table table-bordered table-hover table-striped table-condensed">
            <tr>
                <th width="30">№</th>
                <th width="30">Пользователь</th>
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
            <c:forEach items="${listBand}" var="band">
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
                    <td><a href="<c:url value="/remove/${band.id}" />">Удалить</a> </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<div class="container">
    <c:url var="addAction" value="/band/add"/>

    <form:form action="${addAction}" commandName="band">
        <table>
            <c:if test="${!empty band.nameBand}">
                <tr>
                    <td>
                        <form:label path="id">
                            <spring:message text="ID"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="id" readonly="true" size="8" disabled="true"/>
                        <form:hidden path="id"/>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td>
                    <form:label path="nameBand">
                        <spring:message text="Имя группы"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="nameBand" cssClass="form-control"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="dateBand">
                        <spring:message text="Дата работы"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="dateBand" cssClass="form-control" />
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="startTime">
                        <spring:message text="Время начала"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="startTime" cssClass="form-control"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="endTime">
                        <spring:message text="Время завершения"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="endTime" cssClass="form-control"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <c:if test="${!empty band.dateBand}">
                        <input type="submit" class="btn btn-lg btn-primary btn-block"
                               value="<spring:message text="Редактировать"/>"/>
                    </c:if>
                    <c:if test="${empty band.dateBand}">
                        <input type="submit" class="btn btn-lg btn-primary btn-block"
                               value="<spring:message text="Добавить"/>"/>
                    </c:if>
                </td>
            </tr>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </table>
    </form:form>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script>
    $('#endTime').datetimepicker({
        datepicker:false,
        format:'H:i'
    });
    $('#startTime').datetimepicker({
        datepicker:false,
        format:'H:i'
    });

</script>

</body>
</html>

