<%--
  Created by IntelliJ IDEA.
  User: bert
  Date: 8/8/17
  Time: 10:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <title>Soundcheck - Music Theme</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}">

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

    <!-- Styles CSS -->
    <link rel="stylesheet" href="${contextPath}/resources/soundcheck/css/normalize.css">
    <link rel="stylesheet" href="${contextPath}/resources/soundcheck/css/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/soundcheck/css/sonorama.css">
    <link rel="stylesheet" href="${contextPath}/resources/soundcheck/css/responsive.css">
    <link rel="stylesheet" href="${contextPath}/resources/soundcheck/css/isotope.css">
    <link rel="stylesheet" href="${contextPath}/resources/soundcheck/js/fancybox/jquery.fancybox.css">

    <!--  Color Picker & Styles -->
    <link href="../../resources/soundcheck/css/color-picker.css" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/resources/soundcheck/css/color/light.css">
    <link rel="stylesheet" href="${contextPath}/resources/soundcheck/css/color/green.css">
    <link rel="stylesheet" href="${contextPath}/resources/soundcheck/css/color/yellow.css">
    <link rel="stylesheet" href="${contextPath}/resources/soundcheck/css/color/turquoise.css">
    <link rel="stylesheet" href="${contextPath}/resources/soundcheck/css/color/red.css">
    <link rel="stylesheet" href="${contextPath}/resources/soundcheck/css/color/orange.css">
    <link rel="stylesheet" href="${contextPath}/resources/soundcheck/css/color/purple.css">
    <link rel="stylesheet" href="${contextPath}/resources/soundcheck/css/color/blue.css">
    <link rel="stylesheet" href="${contextPath}/resources/soundcheck/css/color/black.css">

    <!-- Scripts JS -->
    <script src="${contextPath}/resources/soundcheck/js/vendor/modernizr-2.6.2.min.js"></script>


    <!-- links for datepicker -->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/datepicker/jquery.datetimepicker.css"/>
    <script src="${contextPath}/resources/datepicker/jquery.js"></script>

    <style type="text/css">
        .form{height: 50px;}
        .form. test{
            width: 100%;
            background: none;
            color: #fff;
            border: 2px solid #6e6e6e;
            outline: none;
        }
    </style>


    <link href="${contextPath}/resources/newdatepicker/datepicker.min.css" rel="stylesheet" type="text/css">
    <script src="${contextPath}/resources/newdatepicker/datepicker.min.js"></script>

</head>
<body>
<!--[if lt IE 7]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

<div id="mask">
    <div class="loader">
        <img src="${contextPath}/resources/soundcheck/img/icons/loading.gif" alt='loading'>
    </div>
</div>

<div class="color-picker">
    <div class="picker-btn"></div>
    <div class="pickerTitle">Style Switcher</div>
    <div class="pwrapper">
        <div class="pickersubTitle">Layout Selector</div>
        <div class="light-version"><img title="" alt='img' src="${contextPath}/resources/soundcheck/img/icons/light.jpg"></div>
        <div class="dark-version"><img title="" alt='img' src="${contextPath}/resources/soundcheck/img/icons/dark.jpg"></div>
        <div class="pickersubTitle"> Color scheme </div>
        <div class="picker-blue"></div>
        <div class="picker-black"></div>
        <div class="picker-green"></div>
        <div class="picker-yellow"></div>
        <div class="picker-red"></div>
        <div class="picker-purple"></div>
        <div class="picker-turquoise"></div>
        <div class="picker-orange"></div>
        <div class="clear nopick"></div>
    </div>
</div>

<div class="full-wrapper header">
    <div class="main-logo">
        <a class="symbol" href="#"><div class="navbar-brand"><ul><li></li><li></li><li></li></ul></div>soundcheck<span>.</span></a>
    </div>

    <nav class="main-menu">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <ul>
            <li class="current"><a href="#anchor0">Soundcheck</a></li>
            <li><a href="#anchor01">Новости</a></li>
            <li><a href="#anchor02">Время</a></li>
            <li><a href="#anchor03">Работать</a></li>
            <li><a href="#anchor04">Галерея</a></li>
            <li><a href="#anchor05">Контакты</a></li>
            <li><a href="${pageContext.request.contextPath}/personal-page">${pageContext.request.userPrincipal.name}</a></li>
            <li><a onclick="document.forms['logoutForm'].submit()" href="#" style="color: #b5111a">Выйти</a></li>
        </ul>
    </nav>

    <nav id="nav2" role="navigation">
        <a class="jump-menu" title="Show navigation">Show navigation</a>
        <ul>
            <li><a href="#anchor0">Soundcheck</a></li>
            <li><a href="#anchor01">Новости</a></li>
            <li><a href="#anchor02">Время</a></li>
            <li><a href="#anchor03">Работать</a></li>
            <li><a href="#anchor04">Галерея</a></li>
            <li><a href="#anchor05">Контакты</a></li>
            <li><a href="${pageContext.request.contextPath}/personal-page">${pageContext.request.userPrincipal.name}</a></li>
            <li><a onclick="document.forms['logoutForm'].submit()" href="#" style="color: #b5111a">Выйти</a></li>
        </ul>
    </nav>
</div>

<div id="anchor0"></div>
<section id="slides-1"> <!-- Slider -->
    <div class="overlay"></div>
    <div class="slides-container">
        <img src="../../resources/soundcheck/img/slider/slider-01.jpg" alt='img'>
        <img src="../../resources/soundcheck/img/slider/slider-02.jpg" alt='img'>
        <img src="../../resources/soundcheck/img/slider/slider-03.jpg" alt='img'>
    </div>
    <nav class="slides-navigation">
        <a href="#" class="next"></a>
        <a href="#" class="prev"></a>
    </nav>
</section> <!-- end Slider -->

<div class="main-title">
    <div class="title-container">
        <div class="welcome logo">
            <div class="top-spacer one"></div>
            <div class="top-spacer two"></div>
            <img src="../../resources/soundcheck/img/slider/sonorama.png" alt='img' />
            <div class="spacer-box"></div>
            <ul>
                <li class="t-current"><span>Soundcheck - </span> это репетиционная база с возможностью студийной записи <span>для любых стилей и направлений</span> как профессиональных музыкантов, так и любителей музыки.</li>
                <li class="">В Soundcheck вы можете репетировать группой, <span>качественно записать репетицию, </span> записать вокал, Вашу рекламу, playback и многое другое</li>
            </ul>
        </div>
    </div>
</div>

<div class="full-wrapper">
    <div class="player-container"> <!-- Audio Player -->
        <div class="audio-player">
            <audio preload="none" src="${contextPath}/resources/soundcheck/audio/mp3/Daft_Punk_Giorgio_by_Moroder_Stellar_Dreams_Remix.mp3"></audio>
            <ol class="home-playlist">
                <li class="playing"><a href="#" data-track="Daft Punk - Giorgio Moroder Stellar Dreams Remix" data-src="${contextPath}/resources/soundcheck/audio/mp3/Daft_Punk_Giorgio_by_Moroder_Stellar_Dreams_Remix.mp3">dead wrong intro</a></li>
                <li><a href="#" data-track="Nightcrawler - Genesis (Feat Dana Jean Phoenix)" data-src="${contextPath}/resources/soundcheck/audio/mp3/nightcrawler_genesis_feat-dana-jean-phoenix.mp3">juicy-r</a></li>
                <li><a href="#" data-track="Yosef The Soul - Run Away" data-src="${contextPath}/resources/soundcheck/audio/mp3/yosef_the_soul-run_away.mp3">juicy-r</a></li>
            </ol>
        </div>
    </div> <!-- end Audio Player -->
</div>

<div id="anchor01"></div>
<div class="main-wrapper">
    <section class="section"><!-- Last News -->
        <h1>Новости</h1>
        <div class="spacer"></div>
        <div class="last-news-wrapper">
            <div class="last-news-container">
                <div class="news-nav">
                    <div class="last-news-next"></div>
                    <div class="last-news-prev"></div>
                </div>
                <div class="news-box">
                    <ul>
                        <li class="start"></li>
                        <li id="news-01.html" class="last-news"> <!-- Type One Thumb on Top -->
                            <div class="news-thumb">
                                <img src="../../resources/soundcheck/img/news/thumb-news-05.jpg" alt='img' />
                            </div>
                            <div class="news-info">
                                <h1>New Remix</h1>
                                <p>Amazing photo called neon blue available on my gallery</p>
                                <div class="news-date">2013.08.10</div>
                            </div>
                        </li><!-- end Type One -->
                        <li id="news-02.html" class="last-news"> <!-- Type Two Thumb on Bottom -->
                            <div class="news-info">
                                <h1>New Photo</h1>
                                <p>Amazing photo called neon blue available on my gallery</p>
                                <div class="news-date">2013.08.10</div>
                            </div>
                            <div class="news-thumb">
                                <img src="../../resources/soundcheck/img/news/thumb-news-03.jpg" alt='img' />
                            </div>
                        </li><!-- end Type Two -->
                        <li id="news-03.html" class="last-news"> <!-- Type One Thumb on Top -->
                            <div class="news-thumb">
                                <img src="../../resources/soundcheck/img/news/thumb-news-06.jpg" alt='img' />
                            </div>
                            <div class="news-info">
                                <h1>New Remix</h1>
                                <p>Amazing photo called neon blue available on my gallery</p>
                                <div class="news-date">2013.08.10</div>
                            </div>
                        </li><!-- end Type One -->
                        <li id="news-04.html" class="last-news"> <!-- Type Two Thumb on Bottom -->
                            <div class="news-info">
                                <h1>New Photo</h1>
                                <p>Amazing photo called neon blue available on my gallery</p>
                                <div class="news-date">2013.08.10</div>
                            </div>
                            <div class="news-thumb">
                                <img src="../../resources/soundcheck/img/news/thumb-news-07.jpg" alt='img' />
                            </div>
                        </li><!-- end Type Two -->

                        <li id="news-05.html" class="last-news"> <!-- Type One Thumb on Top -->
                            <div class="news-thumb">
                                <img src="../../resources/soundcheck/img/news/thumb-news-01.jpg" alt='img' />
                            </div>
                            <div class="news-info">
                                <h1>New Remix</h1>
                                <p>Amazing photo called neon blue available on my gallery</p>
                                <div class="news-date">2013.08.10</div>
                            </div>
                        </li><!-- end Type One -->
                        <li id="news-06.html" class="last-news"> <!-- Type Two Thumb on Bottom -->
                            <div class="news-info">
                                <h1>New Photo</h1>
                                <p>Amazing photo called neon blue available on my gallery</p>
                                <div class="news-date">2013.08.10</div>
                            </div>
                            <div class="news-thumb">
                                <img src="../../resources/soundcheck/img/news/thumb-news-02.jpg" alt='img' />
                            </div>
                        </li><!-- end Type Two -->
                        <li id="news-07.html" class="last-news"> <!-- Type One Thumb on Top -->
                            <div class="news-thumb">
                                <img src="../../resources/soundcheck/img/news/thumb-news-03.jpg" alt='img' />
                            </div>
                            <div class="news-info">
                                <h1>New Remix</h1>
                                <p>Amazing photo called neon blue available on my gallery</p>
                                <div class="news-date">2013.08.10</div>
                            </div>
                        </li><!-- end Type One -->
                        <li id="news-08.html" class="last-news"> <!-- Type Two Thumb on Bottom -->
                            <div class="news-info">
                                <h1>New Photo</h1>
                                <p>Amazing photo called neon blue available on my gallery</p>
                                <div class="news-date">2013.08.10</div>
                            </div>
                            <div class="news-thumb">
                                <img src="../../resources/soundcheck/img/news/thumb-news-04.jpg" alt='img' />
                            </div>
                        </li><!-- end Type Two -->
                        <li class="end"></li>
                    </ul>
                </div>
            </div>
        </div>

    </section><!-- end Last News -->

    <div class="clear"></div>
    <div id="news-show"></div>
    <section class="news-window">
        <div class="news-content"></div><!-- AJAX Dinamic Content -->
    </section>

</div><!-- end Main Wrapper -->

<div id="anchor02"></div>
<div id="albert">
<section id="dates" class="full-wrapper parallax-wrapper dates"> <!-- Tour Dates -->
    <div class="parallax" data-velocity="-.3" data-fit="0">
        <div class="front-content dates">
            <h1>Время</h1>
            <div class="spacer"></div>
<%--                <p><a href="${contextPath}/list" style="color: orangered">Подробнее</a></p>--%>
            <div class="dates-wrapper">
                <ul>
                    <c:if test="${!empty listBand}">
                        <c:forEach items="${listBand}" var="listBands" varStatus="test">
                            <li>
                                <c:forEach items="${listBands}" var="band">
                                    <div class="date-box">
                                        <div class="info date">
                                            <div class="day" id="band-day">${band.day}</div>
                                            <div class="month" id="band-month">${band.month}</div>
                                            <div class="year" id="band-year">${band.year}</div>
                                        </div>
                                        <div class="info">
                                            <div class="city" id="band-name">${band.nameBand}</div>
                                            <div class="place" id="band-comment"><div class="ico"></div>${band.comment}</div>
                                            <div class="time" id="band-time"><div class="ico"></div>c ${band.startTime} - до ${band.endTime}</div>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                </c:forEach>
                            </li>
                        </c:forEach>
                    </c:if>
                </ul>
            </div>
            <div class="controller">
                <ul class="dots">
                </ul>
            </div>
            <div class="dates-nav">
                <div class="next"></div>
                <div class="prev"></div>
            </div>
        </div>
        <div class="square-bg"></div>
        <div class="overlay"></div>
    </div>
</section>
</div>
<div class="clear"></div>

<section id="about-us" class="full-wrapper parallax-wrapper about-us">
    <div class="parallax" data-velocity="-.3" data-fit="0">
        <h1>Инфо</h1>
        <div class="spacer"></div>
        <div class="sec-content"><p>Чтобы воспользоваться сервисом "Время" для начала ознакомьтесь <a style="color: #398439" href="/list">со списком текущих работ Soundcheck.</a>
            Выбирите подходящюю для Вас дату и род деятельности("Запись, Репетиция") и нажмите "Отправить заявку"</p></div>

    </div>
</section>

<div class="clear"></div>
<section class="full-wrapper parallax-wrapper registration-band"> <!-- Contact -->
    <div class="parallax" data-velocity="-.3" data-fit="0">
        <div id="anchor03"></div>
        <div class="front-content contact">
            <h1>Работать</h1>
            <div class="add-spacer-bottom">
                <div class="spacer"></div>
            </div>

            <form class="peThemeContactForm form" id="add-time">
                <div id="personal" class="bay form-horizontal">
                    <div class="control-group">
                        <div class="container">
                            <div class="controls name">
                                <h2>Имя группы</h2>
                                <input id="name" name="nameBand"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls email">
                                <h2>Желаемая дата</h2>
                                    <input id="date-band" class="datepicker-here"  data-date-format="yyyy-mm-dd" name="dateBand"/>
                                <div class="form-group">
                                    <div id="date-error" class="has-error"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="control-group">
                        <div class="container">
                            <div class="controls name">
                                <h2>Время(c)</h2>
                                    <input id="startTime" name="startTime" class="input-group clockpicker"/>
                                <div class="form-group">
                                    <div id="start-time" class="has-error"></div>
                                </div>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls email">
                                <h2>Время(до)</h2>
                                    <input id="endTime" name="endTime"/>
                                <div class="form-group">
                                    <div id="end-time" class="has-error"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="control-group">
                        <div class="controls view">
                            <h2>Вид деятельности</h2>
                            <select path="comment" id="view" type="text">
                                <option type="text" value="Репетиция" style="color: green">Репетиция</option>
                                <option type="text" value="Запись" style="color: green">Запись</option>
                                <option type="text" value="Другое" style="color: green">Другое</option>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls send-btn">
                            <button class="contour-btn red buttoncontact" id="add-band">Отправить заявку</button>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="form-group">
                                <strong>
                                <div id="success" class="has-error"></div>
                                </strong>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

        </div>
        <div class="square-bg"></div>
        <div class="overlay"></div>
    </div>
</section><!-- end Contact -->
<div class="clear"></div>

<div id="anchor04"></div>
<section class="full-wrapper portfolio"> <!-- Gallery Portfolio -->
    <h1>Галерея</h1>
    <div class="spacer"></div>

    <div id="portfolio">

        <div class="section portfoliocontent">
            <section id="i-portfolio" class="clear">

                <div class="ch-grid element">
                    <img class="ch-item" src="../../resources/soundcheck/img/gallery/thumb-01.jpg" alt='img' />
                    <a class="fancybox img-lightbox" rel="" href="../../resources/soundcheck/img/gallery/thumb-01.jpg"> <!-- Set your gallery Group Name in rel="" field, ex: rel="group-one" -->
                        <div>
                            <span class="p-category photo"></span>
                        </div>
                    </a>
                </div>

                <div class="ch-grid element">
                    <img class="ch-item" src="../../resources/soundcheck/img/gallery/thumb-02.jpg" alt='img' />
                    <a href="https://www.youtube.com/watch?v=WImWuxHbQCw" rel="" class="fancybox-media">
                        <div>
                            <span class="p-category video"></span>
                        </div>
                    </a>
                </div>

                <div class="ch-grid element">
                    <img class="ch-item" src="../../resources/soundcheck/img/gallery/thumb-03.jpg" alt='img' />
                    <a class="fancybox img-lightbox" rel="" href="../../resources/soundcheck/img/gallery/thumb-03.jpg">
                        <div>
                            <span class="p-category photo"></span>
                        </div>
                    </a>
                </div>

                <div class="ch-grid element">
                    <img class="ch-item" src="../../resources/soundcheck/img/gallery/thumb-04.jpg" alt='img' />
                    <a href="http://vimeo.com/29577474" class="fancybox-media" rel="">
                        <div>
                            <span class="p-category video"></span>
                        </div>
                    </a>
                </div>

                <div class="ch-grid element">
                    <img class="ch-item" src="../../resources/soundcheck/img/gallery/thumb-05.jpg" alt='img' />
                    <a class="fancybox img-lightbox" rel="" href="../../resources/soundcheck/img/gallery/thumb-05.jpg">
                        <div>
                            <span class="p-category photo"></span>
                        </div>
                    </a>
                </div>

                <div class="ch-grid element">
                    <img class="ch-item" src="../../resources/soundcheck/img/gallery/thumb-06.jpg" alt='img' />
                    <a class="fancybox img-lightbox" rel="" href="../../resources/soundcheck/img/gallery/thumb-06.jpg">
                        <div>
                            <span class="p-category photo"></span>
                        </div>
                    </a>
                </div>

                <div class="ch-grid element">
                    <img class="ch-item" src="../../resources/soundcheck/img/gallery/thumb-07.jpg" alt='img' />
                    <a href="https://www.youtube.com/watch?v=WImWuxHbQCw" rel="" class="fancybox-media">
                        <div>
                            <span class="p-category video"></span>
                        </div>
                    </a>
                </div>

                <div class="ch-grid element">
                    <img class="ch-item" src="../../resources/soundcheck/img/gallery/thumb-08.jpg" alt='img' />
                    <a href="http://vimeo.com/29577474" class="fancybox-media" rel="">
                        <div>
                            <span class="p-category video"></span>
                        </div>
                    </a>
                </div>

                <div class="ch-grid element">
                    <img class="ch-item" src="../../resources/soundcheck/img/gallery/thumb-09.jpg" alt='img' />
                    <a class="fancybox img-lightbox" rel="" href="../../resources/soundcheck/img/gallery/thumb-09.jpg">
                        <div>
                            <span class="p-category photo"></span>
                        </div>
                    </a>
                </div>

                <div class="ch-grid element">
                    <img class="ch-item" src="../../resources/soundcheck/img/gallery/thumb-10.jpg" alt='img' />
                    <a class="fancybox img-lightbox" rel="" href="../../resources/soundcheck/img/gallery/thumb-10.jpg">
                        <div>
                            <span class="p-category photo"></span>
                        </div>
                    </a>
                </div>

                <div class="ch-grid element">
                    <img class="ch-item" src="../../resources/soundcheck/img/gallery/thumb-11.jpg" alt='img' />
                    <a class="fancybox img-lightbox" rel="" href="../../resources/soundcheck/img/gallery/thumb-11.jpg">
                        <div>
                            <span class="p-category photo"></span>
                        </div>
                    </a>
                </div>

                <div class="ch-grid element">
                    <img class="ch-item" src="../../resources/soundcheck/img/gallery/thumb-12.jpg" alt='img' />
                    <a class="fancybox img-lightbox" rel="" href="../../resources/soundcheck/img/gallery/thumb-12.jpg">
                        <div>
                            <span class="p-category photo"></span>
                        </div>
                    </a>
                </div>

            </section>
        </div>
    </div>

</section><!-- end Gallery Portfolio -->
<div class="clear"></div>

<section id="about-us" class="full-wrapper parallax-wrapper about-us">
    <div class="parallax" data-velocity="-.3" data-fit="0">
        <h1>Biography</h1>
        <div class="spacer"></div>
        <div class="sec-content"><p>As an artist or band, you’re going to be repeatedly forced to explain yourself. And if you are incapable of communicating  in words   who you are, what you sound like and why someone should care, you’re not going to go very far. In short, you’re going to need to write a bio.</p></div>

    </div>
</section>
<div class="clear"></div>
<section class="full-wrapper parallax-wrapper contact"> <!-- Contact -->
    <div class="parallax" data-velocity="-.3" data-fit="0">
        <div id="anchor05"></div>
        <div class="front-content contact">
            <h1>Обратная связь</h1>
            <div class="spacer"></div>

            <form method="post" id="contact22" class="peThemeContactForm form" action="${pageContext.request.contextPath}/contact">
                <div id="personal" class="bay form-horizontal">
                    <div class="control-group">
                        <div class="controls name">
                            <h2>Имя</h2>
                            <input type="text" name="author" data-fieldid="0" id="author">
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls email">
                            <h2>Email</h2>
                            <input type="email" name="email" data-fieldid="1" id="email">
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="control-group">
                        <div class="controls message">
                            <h2>Сообщение</h2>
                            <textarea name="message" rows="12" data-fieldid="2" id="comments"></textarea>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls send-btn">
                            <button type="submit" class="contour-btn red buttoncontact">Отправить сообщение</button>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </div>
                    </div>
                </div>

                        <strong>
                            <div id="message-send" class="message-text-success"></div>
                        </strong>
            </form>

        </div>
        <div class="square-bg"></div>
        <div class="overlay"></div>
    </div>
</section><!-- end Contact -->
<div class="clear"></div>

<section class="social-footer">
    <h1>Соц. Сети</h1>
    <div class="spacer"></div>
    <div class="footer-container">
        <div class="social-ico s-facebook"></div>
        <div class="social-ico s-youtube"></div>
        <div class="social-ico s-plus"></div>
        <div class="social-ico s-twitter"></div>
        <div class="social-ico s-soundcloud"></div>
    </div>
    <div class="clear"></div>
</section>

<!-- Scripts JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script src="${contextPath}/resources/soundcheck/js/jquery-1.11.0.min.js"></script>
<script src="${contextPath}/resources/soundcheck/js/superslides-0.6.2/dist/jquery.superslides.js" type="text/javascript" charset="utf-8"></script>
<script src="${contextPath}/resources/soundcheck/js/jquery.isotope.min.js"></script>
<script type="text/javascript" src="/resources/soundcheck/js/player/audio.js"></script> <!-- Audio Player -->
<script type="text/javascript" src="/resources/soundcheck/js/jquery.hoverdir.js"></script>
<script type="text/javascript" src="/resources/soundcheck/js/jquery.nav.js"></script>
<script src="${contextPath}/resources/soundcheck/js/news.js"></script>
<script src="${contextPath}/resources/soundcheck/js/discography.js"></script>
<script src="${contextPath}/resources/soundcheck/js/tweets.js"></script>
<script src="${contextPath}/resources/soundcheck/js/jquery.scrolly.js"></script>
<script src="${contextPath}/resources/soundcheck/js/fancybox/jquery.fancybox.js"></script>
<script src="${contextPath}/resources/soundcheck/js/fancybox/helpers/jquery.fancybox-media.js"></script>
<script src="${contextPath}/resources/soundcheck/js/color-picker.js"></script>
<script src="${contextPath}/resources/soundcheck/js/jquery.validate.js"></script>
<script src="${contextPath}/resources/soundcheck/js/jquery.form.js"></script>
<script src="${contextPath}/resources/soundcheck/js/plugins.js"></script>
<script src="${contextPath}/resources/soundcheck/js/sonorama.js"></script>
<script src="${contextPath}/resources/datepicker/build/jquery.datetimepicker.full.min.js"></script>
<script src="${contextPath}/resources/soundcheck/js/form/ajax.js"></script>
<%--<script>
    $('#endTimes').datetimepicker({
        datepicker:false,
        format:'H:i'
    });
    $('#startTimes').datetimepicker({
        datepicker:false,
        format:'H:i'
    });

    jQuery.datetimepicker.setLocale('de');

    jQuery('#date-picker').datetimepicker({
        i18n:{
            de:{
                months:[
                    'Januar','Februar','März','April',
                    'Mai','Juni','Juli','August',
                    'September','Oktober','November','Dezember'
                ],
                dayOfWeek:[
                    "So.", "Mo", "Di", "Mi",
                    "Do", "Fr", "Sa."
                ]
            }
        },
        timepicker:false,
        format:'d-m-Y'
    });
</script>--%>
<%--<script>
    $("#test").datepicker({
        // Можно выбрать тольо даты, идущие за сегодняшним днем, включая сегодня
        minDate: new Date()
    })
</script>--%>

<script type="text/javascript">
    $('.clockpicker').clockpicker();
</script>

</body>
</html>