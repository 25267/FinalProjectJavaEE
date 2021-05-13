<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title> Notes App </title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--%>
    <link href="https://fonts.googleapis.com/css?family=Arvo&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="css/design.css" rel='stylesheet' type='text/css'/>

    <style>

        nav.primary-navigation {
            margin: 0 auto;
            display: block;
            padding: 1px 0 200px 0;
            text-align: center;
            font-size: 16px;
        }
        nav.primary-navigation ul li {
            list-style: none;
            margin: 0 auto;
            border-left: 2px solid #3ca0e7;
            display: inline-block;
            padding: 0 30px;
            position: relative;
            text-decoration: none;
            text-align: center;
            font-family: arvo;
        }
        nav.primary-navigation li a {
            color: black;
        }
        nav.primary-navigation li a:hover {
            color: #3ca0e7;
        }
        nav.primary-navigation li:hover {
            cursor: pointer;
        }
        nav.primary-navigation ul li ul {
            visibility: hidden;
            opacity: 0;
            position: absolute;
            padding-left: 0;
            left: 0;
            display: none;
            background: white;
        }
        nav.primary-navigation ul li:hover > ul,
        nav.primary-navigation ul li ul:hover {
            visibility: visible;
            opacity: 1;
            display: block;
            min-width: 250px;
            text-align: left;
            padding-top: 20px;
            box-shadow: 0px 3px 5px -1px #ccc;
        }
        nav.primary-navigation ul li ul li {
            clear: both;
            width: 100%;
            text-align: left;
            margin-bottom: 20px;
            border-style: none;
        }
        nav.primary-navigation ul li ul li a:hover {
            padding-left: 10px;
            border-left: 2px solid #3ca0e7;
            transition: all 0.3s ease;
        }

        a {
            text-decoration: none;
        }
        a:hover {
            color: #3CA0E7;
        }

        ul li ul li a {
            transition: all 0.5s ease;
        }

        #post-it-container {
            position: relative;
            margin: 5px;
            width: 10em;
            height: 10em;
            z-index: 1;
            float:left;
        }
        #post-it-container {
            perspective: 1000;
        }
        #post-it-card {
            width: 100%;
            height: 100%;
            transform-style: preserve-3d;
            transition: all 500ms linear;
        }
        #post-it-container:hover #post-it-card {
            transform: rotateY(180deg);
            -moz-box-shadow: 2px 2px 9px rgba(194,194,194,.9);
            -webkit-box-shadow: 2px 2px 9px rgba(194,194,194,.9);
            box-shadow: 2px 2px 9px rgba(194,194,194,.9);
            cursor:pointer;
        }
        .face {
            position: absolute;
            width: 100%;
            height: 100%;
            backface-visibility: hidden;
        }
        .face.back {
            display: block;
            transform: rotateY(180deg);
            box-sizing: border-box;
            padding: 5px;
            color: black;
            text-align: center;
            background-color: #d;
            font-size:1em;
        }

        div.strategy {
            margin:0;
            float: left;
            color: #151515;
            background: #ffc;
            display: block;
            height: 7.5em;
            width: 7.5em;
            padding: 1em;
            text-align: center;
            font-family: "Gloria Hallelujah","Lato","Helvetica Neue", Arial, sans-serif;
            font-size: 0.9rem;
            -moz-box-shadow: 2px 2px 9px rgba(194,194,194,.5);
            -webkit-box-shadow: 2px 2px 9px rgba(194,194,194,.5);
            box-shadow: 2px 2px 9px rgba(194,194,194,.5);
        }

        #post-its {width:2500px;}

        #post-its div#post-it-container:nth-child(1) {
            -o-transform:rotate(-5deg);
            -webkit-transform:rotate(-5deg);
            -moz-transform:rotate(-5deg);
            position:relative;
            top:-1px;
        }
        #post-its div#post-it-container:nth-child(even) {
            -o-transform:rotate(4deg);
            -webkit-transform:rotate(4deg);
            -moz-transform:rotate(4deg);
            position:relative;
            top:5px;
        }
        #post-its div#post-it-container:nth-child(4n) {
            -o-transform:rotate(-3deg);
            -webkit-transform:rotate(-3deg);
            -moz-transform:rotate(-3deg);
            position:relative;
            top:-5px;
        }
        #post-its div#post-it-container:nth-child(7n) {
            -o-transform:rotate(5deg);
            -webkit-transform:rotate(5deg);
            -moz-transform:rotate(5deg);
            position:relative;
            top:-10px;
        }

    </style>
</head>

<body>
<nav role="navigation" class="primary-navigation">
    <ul>
        <li><a href="dashboard.jsp">Home</a></li>
        <li><a href="#">Work &dtrif;</a>
            <ul class="dropdown">
                <li><a class="" href="myResponse.jsp">View All Notes</a></li>
                <li><a class="active" href="updateNote.jsp">Edit Note</a></li>
                <li><a class="" href="addNote.jsp">Add Note</a></li>
                <li><a class="" href="deleteNote.jsp">Delete Note</a></li>
                <li><a class="" href="status.jsp">Update Status</a></li>
            </ul>
        </li>
        <li><a href="LogoutServlet">Logout</a></li>

    </ul>
</nav>



<div class="container">
<div id="post-its">


    <c:forEach var="note" items="${Notes}">
    <div id="post-it-container">
        <div id="post-it-card" class="shadow">
            <div class="front face">
                <div class="strategy"><c:out value="${note.id}"/> <br><br> <c:out value="${note.title}"/></div>
            </div>
            <div class="back face center">
                <p><c:out value="${note.date}"/> <br> <br> <c:out value="${note.status}"/><p>
            </div>
        </div>
    </div>
    </c:forEach>


</div>
</div>
</body>
</html>