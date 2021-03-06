<%--
  Created by IntelliJ IDEA.
  User: bert
  Date: 7/27/17
  Time: 12:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}">

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/dashboard.css" rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css"/>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

    <style>
        body {
            background-size: cover;
            background: #333646 url(../../resources/soundcheck/img/background/setwalls.ru-18005.jpg) no-repeat fixed center center;
        }
    </style>

    <title>Admin</title>

</head>

<body>

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">SOUNDCHECK</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Dashboard</a></li>
                <li><a href="#">Settings</a></li>
                <li><a href="#">Profile</a></li>
                <li><a href="#">Help</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row">
        <form method="post" id="admin-filter">
            <div class="col-sm-3 col-md-2 sidebar">
                <ul class="nav nav-sidebar">
                    <%--<li class="active"><a href="#">Overview</a></li>--%>
                    <li>
                        <div class="row">
                            <div class="col-sm-11">
                                <label for="band" style="margin-left: 15px">Группа</label>
                                <input type='text' class="form-control" id="band" style="margin-left: 15px"/>
                            </div>
                        </div>
                    </li>
                    <br>
                    <li>
                        <label for="firstDate" style="margin-left: 15px">Период (с)</label>
                        <div class="row">
                            <div class="col-sm-11">
                                <div class="form-group">
                                    <div class='input-group date' id='datetimepicker1'>
                                        <input class="form-control" id="firstDate" style="margin-left: 15px"/>
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar" style="margin-left: 15px"></span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <br>
                    <li>
                        <label for="secondDate" style="margin-left: 15px">Период (до)</label>
                        <div class="row">
                            <div class="col-sm-11">
                                <div class="form-group">
                                    <div class='input-group date' id='datetimepicker5'>
                                        <input type='text' class="form-control" id="secondDate"
                                               style="margin-left: 15px"/>
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"
                                                  style="margin-left: 15px"></span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
                <button type="submit" class="btn btn-lg btn-primary btn-block">Найти</button>
                <ul class="nav nav-sidebar">
                    <li><a href="">Nav item</a></li>
                    <li><a href="">Nav item again</a></li>
                    <li><a href="">One more nav</a></li>
                    <li><a href="">Another nav item</a></li>
                    <li><a href="">More navigation</a></li>
                </ul>
                <ul class="nav nav-sidebar">
                    <li><a href="">Nav item again</a></li>
                    <li><a href="">One more nav</a></li>
                    <li><a href="">Another nav item</a></li>
                </ul>
            </div>
        </form>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">


            <c:if test="${pageContext.request.userPrincipal.name != null}">
            <form id="logoutForm" method="post" action="${contextPath}/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
            <h3 class="page-header" align="center">Администратор ${pageContext.request.userPrincipal.name} | <a
                    onclick="document.forms['logoutForm'].submit()">Выйти</a>
            </h3>
            </c:if>

            <h3 class="sub-header" align="center">Подробная таблица рабочего времени</h3>

            <c:if test="${!empty listBand}">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div id="error-user"></div>
            <div id="testing">
                <div class="table-responsive">
                    <div class="table-scroll">
                        <table class="table table-striped" style="opacity: 0.7;">
                            <thead>
                            <tr>
                                <th width="30">ID</th>
                                <th width="30">USER ID</th>
                                <th width="40">Дата создания</th>
                                <th width="120">Группа</th>
                                <th width="40">Дата работы</th>
                                <th width="50">Начало</th>
                                <th width="50">Завершение</th>
                                <th width="50">Часы</th>
                                <th width="60">Сумма</th>
                                <th width="100">Деятельность</th>
                                <th width="8"></th>
                                <th width="8"></th>
                            </tr>
                            </thead>

                            <c:forEach items="${listBand}" var="band">
                                <tbody>
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
                                    <td><a href="<c:url value="/edit/${band.id}"/>" class="glyphicon glyphicon-pencil"
                                           style="color: #2e2d2d"></a></td>
                                    <td><a href="<c:url value="/remove/${band.id}" />"
                                           class="glyphicon glyphicon-remove"
                                           style="color: #ac2925"></a></td>
                                </tr>
                                </tbody>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
            </c:if>

            <c:url var="addAction" value="/band/add"/>
            <br>
            <form:form action="${addAction}" commandName="band" id="admin">
            <h3 align="center">Форма регистрации и редактирования</h3>
            <c:if test="${!empty band.nameBand}">

            <form:label path="id" class="control-label">
                <spring:message text="Идентификатор"/>
            </form:label>

            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <div class='input-group date'>
                            <form:input type='text' class="form-control" path="id"
                                        readonly="true" size="8" disabled="true" id="id"/>
                        </div>
                    </div>
                </div>
            </div>

                <form:hidden path="id"/>

            </c:if>

            <form:label path="nameBand" class="control-label">
                <spring:message text="Имя группы"/>
            </form:label>

            <div class="row">
                <div class="col-sm-4">
                    <form:input type='text' class="form-control" path="nameBand" id="nameBand"/>
                </div>
            </div>
            <div class="has-error">
                <form:errors path="nameBand"></form:errors>
            </div>

            <form:label path="dateBand" class="control-label">
                <spring:message text="Дата работы"/>
            </form:label>

            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker2'>
                            <form:input type='text' class="form-control" path="dateBand" id="dateBand"/>
                            <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="has-error">
                <form:errors path="dateBand"></form:errors>
            </div>

            <form:label path="startTime">
                <spring:message text="Время начала"/>
            </form:label>

            <div class="row">
                <div class='col-sm-4'>
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker3'>
                            <form:input path="startTime" type='text' class="form-control"
                                        id="startTime"/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-time"></span>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="has-error">
                <form:errors path="startTime"></form:errors>
            </div>

            <form:label path="endTime">
                <spring:message text="Время завершения"/>
            </form:label>

            <div class="row">
                <div class='col-sm-4'>
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker4'>
                            <form:input path="endTime" type='text' class="form-control" id="endTime"/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-time"></span>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="has-error">
                <form:errors path="endTime"></form:errors>
            </div>

            <c:if test="${!empty band.dateBand}">
            <div class="row">
                <div class="col-sm-4">
                    <input type="submit" class="btn btn-lg btn-primary btn-block"
                           value="<spring:message text="Редактировать"/>"/>
                    <form action="${pageContext.request.contextPath}/canceled">
                        <input type="submit" class="btn btn-primary btn-danger btn-block"
                               value="<spring:message text="Отмена"/>"/>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </div>
            </div>
            </c:if>

            <c:if test="${empty band.dateBand}">
            <div class="row">
                <div class="col-sm-4">
                    <input type="submit" class="btn btn-lg btn-primary btn-block"
                           value="<spring:message text="Добавить"/>" align="center"/>
                </div>
            </div>
            </c:if>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form:form>
</body>

<script type="text/javascript">
    $(function () {
        $('#datetimepicker1').datetimepicker({
            format: 'YYYY-MM-DD'
        });
    });
</script>

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

<script type="text/javascript">
    $(function () {
        $('#datetimepicker5').datetimepicker({
            format: 'YYYY/MM/DD'
        });
    });
</script>
<script src="${contextPath}/resources/soundcheck/js/jquery.validate.js"></script>
<script src="${contextPath}/resources/soundcheck/js/jquery.form.js"></script>
<script src="${contextPath}/resources/soundcheck/js/adminValidate.js"></script>
<script src="${contextPath}/resources/soundcheck/js/form/ajax.js"></script>
</html>

