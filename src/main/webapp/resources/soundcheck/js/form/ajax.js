var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

$(document).ajaxSend(function (e, xhr, options) {
    xhr.setRequestHeader(header, token);
});


$(document).ready(function () {

    $("#add-time").submit(function (event) {

        //stop submit the form, we will post it manually.
        event.preventDefault();

        fire_ajax_submit();

    });

});

/*Этот метод получает данные с контроллера и формирует таблицу для определённого юзера и его данных*/

function get_ajax() {
    $.ajax({
        type: "GET",
        contentType: "application/json",
        url: "/personal-list",
        dataType: 'json',
        cache: false,
        timeout: 600000,
        success: function (data) {
            $("#testing").html("");

            if (data.status === "SUCCESS") {
                getFilteredData
                var json = "<table class='table table-bordered table-hover table-striped table-condensed'>" +
                    "<tr>" +
                    "<th width='30'>№</th>" +
                    "<th width='120'>Имя группы</th>" +
                    "<th width='40'>Дата</th>" +
                    "<th width='50'>Время(с)</th>" +
                    "<th width='50'>Время(до)</th>" +
                    "<th width='50'>Кол-во часов</th>" +
                    "<th width='50'>Деятельность</th>" +
                    "</tr>";

                for (i = 0; i < data.result.length; i++) {
                    json += "<tr>" +
                        "<td>" + data.result[i].id + "</td>" +
                        "<td>" + data.result[i].nameBand + "</td>" +
                        "<td>" + data.result[i].dateBand + "</td>" +
                        "<td>" + data.result[i].startTime + "</td>" +
                        "<td>" + data.result[i].endTime + "</td>" +
                        "<td>" + data.result[i].countHours + "</td>" +
                        "<td>" + data.result[i].comment + "</td>" +
                        "</tr>";
                }

                json += "</table>";
                $('#testing').html(json);
            }
            else {
                $("#error-user").html(data.result);
            }
        }
    });
}

/*Этот метод для асинхронной валидации формы (проверяет дату и время из формы)*/
function fire_ajax_submit() {

    var band = {};
    band["nameBand"] = $("#name").val();
    band["dateBand"] = $("#date-band").val();
    band["startTime"] = $("#startTime").val();
    band["endTime"] = $("#endTime").val();
    band["comment"] = $("#view").val();

    if (band.nameBand === "" ||
        band.dateBand === "" ||
        band.startTime === "" ||
        band.endTime === "") {

        return;
    }

    else {
        $('#success').html("Отправка запроса..");
        $("#add-time").prop("disabled", true);

        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/main/add/band",
            data: JSON.stringify(band),
            dataType: 'json',
            cache: false,
            timeout: 700000,
            success: function (data) {

                if (data.status === "SUCCESS") {
                    $('#success').html("Ваша заявка принята, спасибо.");
                    $('#start-time').html("");
                    $('#end-time').html("");
                    $('#date-error').html("");

                    refresh();
                }

                else {
                    for (i = 0; i < data.result.length; i++) {

                        if (data.result[i].field === "startTime") {
                            $('#start-time').html(data.result[i].code);
                        }

                        if (data.result[i].field === "endTime") {
                            $('#end-time').html(data.result[i].code);
                        }

                        if (data.result[i].field === "dateBand") {
                            $("#date-error").html(data.result[i].code);
                        }
                    }

                    $("#success").html("Ошибка обработки запроса.")
                }
            },
            error: function (e) {

                var json = "<h4>Ajax Response</h4><pre>"
                    + e.responseText + "</pre>";
                $('#success').html(json);

                console.log("ERROR : ", e);
                $("#add-band").prop("disabled", false);

            }
        });
    }
}

/*Подмена контента при успешной заявки на сотрудничество*/
function refresh() {
    $.ajax({
        type: "GET",
        contentType: "application/json",
        url: "/refresh",
        dataType: 'json',
        cache: false,
        timeout: 600000,
        success: function (data) {
            if (data.status === "SUCCESS") {
                var json = "<section id='dates' class='full-wrapper parallax-wrapper dates'>" +
                    "<div class='parallax' data-velocity='-.3' data-fit='0'>" +
                    "<div class='front-content dates'>" +
                    "<h1>Время</h1>" +
                    "<div class='spacer'></div>" +
                    "<div class='dates-wrapper'>";

                json += "<ul>";

                $("#albert").html("");

                for (i = 0; i < data.result.length; i++) {

                    json += "<li>";

                    var bands = data.result[i];

                    for (j = 0; j < bands.length; j++) {
                        json += "<div class='date-box'>" +
                            "<div class='info date'>" +
                            "<div class='day' id='band-day'>" + bands[j].day + "</div>" +
                            "<div class='month' id='band-month'>" + bands[j].month + "</div>" +
                            "<div class='year' id='band-year'>" + bands[j].year + "</div>" +
                            "</div>" +
                            "<div class='info'>" +
                            "<div class='city' id='band-name'>" + bands[j].nameBand + "</div>" +
                            "<div class='place' id='band-comment'><div class='ico'></div>" + bands[j].comment + "</div>" +
                            "<div class='time' id='band-time'><div class='ico'></div>" + "c " + bands[j].startTime + " до " + bands[j].endTime + "</div>" +
                            "</div>" +
                            "<div class='clear'></div>" +
                            "</div>";
                    }

                    json += "</li>";
                }
                json += "</ul>" +
                    "</div>" +
                    "<div class='controller'>" +
                    "<ul class='dots'>";

                json += "</ul>";

                json += "</div>" +
                    "<div class='dates-nav'>" +
                    "<div class='next'></div>" +
                    "<div class='prev'></div>" +
                    "</div>" +
                    "</div>" +
                    "<div class='square-bg'></div>" +
                    "<div class='overlay'></div>" +
                    "</div>" +
                    "</section>" +
                    "<div class='clear'></div>";

                $("#albert").html(json);
                loadCarousel();
            }
        }
    });
}

$(document).ready(function () {

    $("#contact22").submit(function (event) {

        //stop submit the form, we will post it manually.
        event.preventDefault();

        getMessage();

    });

});

$(document).ready(function () {

    $("#admin-filter").submit(function (event) {

        //stop submit the form, we will post it manually.
        event.preventDefault();

        getFilteredData();

    });

});

function getMessage() {

    var message = {};

    message["nameAuthor"] = $("#author").val();
    message["email"] = $("#email").val();
    message["message"] = $("#comments").val();

    if (message.nameAuthor === "" ||
        message.email === "" ||
        message.message === "") {
        return;
    }

    $("#message-send").html("Отправка сообщения..");

    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/contact",
        data: JSON.stringify(message),
        dataType: 'json',
        cache: false,
        timeout: 600000,
        success: function (data) {

            if (data.status === "SUCCESS") {
                $("#message-send").html("Ваше сообщение успешно отправленно!");
            }

            else {
                $("#message-send").html("Ошибка отправки сообщения..");
            }
        }
    });
}

function getFilteredData() {

    var filter = {};

    filter["nameBand"] = $("#band").val();
    filter["dateBand"] = $("#firstDate").val();

    /*    if(filter.band === "" ||
            filter.firstDate === "") {
            return;
        }*/

    if (filter.nameBand === "" && filter.dateBand === "") {
        return;
    }

    /*$("#message-send").html("Отправка сообщения..");*/

    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/filter",
        data: JSON.stringify(filter),
        dataType: 'json',
        cache: false,
        timeout: 600000,
        success: function (data) {

            if (data.status === "SUCCESS") {
                var json = "<div class=\"table-responsive\">\n" +
                    "<div class=\"table-scroll\">\n" +
                    "<table class=\"table table-striped\">\n" +
                    "<thead>\n" +
                    "<tr>\n" +
                    "<th width=\"30\">ID</th>\n" +
                    "<th width=\"30\">USER ID</th>\n" +
                    "<th width=\"40\">Дата создания</th>\n" +
                    "<th width=\"120\">Группа</th>\n" +
                    "<th width=\"40\">Дата работы</th>\n" +
                    "<th width=\"50\">Начало</th>\n" +
                    "<th width=\"50\">Завершение</th>\n" +
                    "<th width=\"50\">Часы</th>\n" +
                    "<th width=\"60\">Сумма</th>\n" +
                    "<th width=\"100\">Деятельность</th>\n" +
                    "<th width=\"8\"></th>\n" +
                    "<th width=\"8\"></th>\n" +
                    "</tr>\n" +
                    "</thead>"

                for (i = 0; i < data.result.length; ++i) {

                    json += "<tbody>" +
                        "<tr>" +
                        "<td>" + data.result[i].id + "</td>" +
                        "<td>" + data.result[i].userID + "</td>" +
                        "<td>" + data.result[i].createDate + "</td>" +
                        "<td>" + data.result[i].nameBand + "</td>" +
                        "<td>" + data.result[i].dateBand + "</td>" +
                        "<td>" + data.result[i].startTime + "</td>" +
                        "<td>" + data.result[i].endTime + "</td>" +
                        "<td>" + data.result[i].countHours + "</td>" +
                        "<td>" + data.result[i].price + "</td>" +
                        "<td>" + data.result[i].comment + "</td>" +
                        "<td>" +
                        "<a class='glyphicon glyphicon-pencil' href='/edit/1'>" +
                        "</a>" +
                        "</td>"

                }
                json += "</c:forEach>" +
                    "</table>" +
                    "</div>" +
                    "</div>"
                $('#testing').html(json);


            }

            else {
                $("#error-message-filter").html("Ошибка отправки сообщения..");
            }
        }
    });
}