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
<%--
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/datepicker.css" rel="stylesheet">
    <script src="${contextPath}/resources/js/bootstrap-datepicker.js"></script>
    <script src="${contextPath}/resources/js/moment-with-locales.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/js/main.js"></script>--%>


    <!-- Latest compiled and minified CSS -->
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="${contextPath}/resources/css/bootstrap-datepicker.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/js/bootstrap-datepicker.min.js"></script>

    <script type="text/javascript">
        $(function () {
            $('#datetimepicker1').datetimepicker();
        });
    </script>--%>

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

    <title>Admin</title>

</head>

<body>
<div class="container-fluid">
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

<c:if test="${!empty listBand}">
<div class="container-fluid">
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
</c:if>

<div class="container-fluid">
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
                        <%--<form:input path="id" readonly="true" size="8" disabled="true"/>--%>
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <div class='input-group date'>
                                                <form:input type='text' class="form-control" path="id" readonly="true" size="8" disabled="true"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                    <div class="container">
                        <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <div class='input-group date'>
                                    <form:input type='text' class="form-control"  path="nameBand"/>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar">
                                        </span>
                                    </span>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="dateBand">
                        <spring:message text="Дата работы"/>
                    </form:label>
                </td>
                <td>
                    <div class="container">
                        <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <div class='input-group date' id='datetimepicker2'>
                                    <form:input type='text' class="form-control"  path="dateBand"/>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar">
                                        </span>
                                    </span>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="startTime">
                        <spring:message text="Время начала"/>
                    </form:label>
                </td>
                <td>
                    <div class="container">
                        <div class="row">
                            <div class='col-sm-6'>
                                <div class="form-group">
                                    <div class='input-group date' id='datetimepicker3'>
                                        <form:input path="startTime" type='text' class="form-control" />
                                            <span class="input-group-addon">
                                         <span class="glyphicon glyphicon-time"></span>
                                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="endTime">
                        <spring:message text="Время завершения"/>
                    </form:label>
                </td>
                <td>
                    <div class="container">
                        <div class="row">
                            <div class='col-sm-6'>
                                <div class="form-group">
                                    <div class='input-group date' id='datetimepicker4'>
                                        <form:input path="endTime" type='text' class="form-control" />
                                        <span class="input-group-addon">
                                         <span class="glyphicon glyphicon-time"></span>
                                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <c:if test="${!empty band.dateBand}">
                        <input type="submit" class="btn btn-lg btn-primary"
                               value="<spring:message text="Редактировать"/>"/>
                    </c:if>
                    <c:if test="${empty band.dateBand}">
                        <input type="submit" class="btn btn-lg btn-primary"
                               value="<spring:message text="Добавить"/>"/>
                    </c:if>
                </td>
            </tr>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </table>
    </form:form>
</div>


<%--Test datepicker--%>

</body>

<script type="text/javascript">
    $(function () {
        $('#datetimepicker2').datetimepicker({
            format: 'YYYY/MM/DD'
        });
    });
</script>

<script type="text/javascript">
    $(function () {
        $('#datetimepicker3').datetimepicker({
            format: 'HH:mm'
        });
    });
</script>

<script type="text/javascript">
    $(function () {
        $('#datetimepicker4').datetimepicker({
            format: 'HH:mm'
        });
    });
</script>

</html>

