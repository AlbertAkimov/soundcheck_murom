"use strict";
/*
* Validator for form ADMIN
* */
$ (function () {

    $("#admin").validate({

        rules: {
            nameBand: {
                required: true,
                rangelength: [4, 13]
            },

            dateBand: {
                required: true,
                checkDate: true
            },

            startTime: {
                required: true
            },

            endTime: {
                required: true,
                checkTime: true
            }
        },
        messages:{
            nameBand: {
                required: "Поле обязательно для заполнения",
                rangelength: "Имя группы должно быть в диапазоне от 4 до 14 символов"
            },

            dateBand:{
                required: "Поле обязательно для заполнения"
            },

            startTime: {
                required: "Поле обязательно для заполнения"
            },

            endTime: {
                required: "Поле обязательно для заполнения"
            }
        },

        focusCleanup: true,
        focusInvalid: false
    });
});

/*Добавление правила валидации в плагин JQuery для сравнения время начала и время завершения*/

$.validator.addMethod("checkTime", function(val, el, args){
    var startTime = $("#startTime").val();

    var start = Number(startTime.substr(0,2));
    var end = Number(val.substr(0, 2));

    if(start > end)
        return false;
    return true;
}, "Ошибка! Поле Время(до) не может быть меньше поля Время(с)");

/*Добавление правила валидации в плагин JQuery для проверки даты*/

$.validator.addMethod("checkDate", function(val, el, args){
        var dateBand = new Date(Date.parse(val));
        var currentDate = new Date();
        var id = $("#id").val();

        currentDate.setHours(0,0,0,0);

        if(typeof(id) === "undefined") {
            if (dateBand < currentDate) {
                return false;
            }
        }
        return true;
    }, "Ошибка! Выбранная дата не может быть меньше текущей"
);


$(function () {
    $("#contact22").validate({

        rules: {
            author: {
                required: true
            },

            email: {
                required: true,
                email: true
            },

            message: {
                required: true,
                maxlength: 2000
            }
        },

        messages: {

            author: {
                required: "Поле обязательно для заполнения"
            },

            email: {
                required: "Поле обязательно для заполнения",
                email: "Некорректный email адресс"
            },

            message: {
                required: "Поле обязательно для заполнения",
                maxlength: "Сообщение не долно быть больше 2000 символов"
            }

        }

    })

});