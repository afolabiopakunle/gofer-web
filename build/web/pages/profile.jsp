<%-- 
    Document   : login
    Created on : 10-Feb-2020, 19:03:08
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="../Scripts/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../Scripts/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="../Scripts/css/profile.css" rel="stylesheet" type="text/css"/>
        <link href="../Scripts/css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link href="../Scripts/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="../Scripts/css/all.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Muli:300,400,400i,500i&display=swap" rel="stylesheet">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
              integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>GOFER</title>
    </head>

    <body>
        <main class="container-fluid errand p-0">
            <%@include file="../WEB-INF/jspf/fragments/general/header.jspf" %>
            <jsp:include page="../WEB-INF/jspf/static_pages/user/profile.jsp"></jsp:include>                                              
        </main>     
              
        <script src="../Scripts/js/jquery-3.4.1.js" type="text/javascript"></script>
        <script src="../Scripts/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Scripts/js/script.js" type="text/javascript"></script>
        <script src="../Scripts/js/AppScript.js" type="text/javascript"></script>
        <script>
            $("#verify").click(function () {
                $("#myModal3").modal({ backdrop: "static" });
            });
            $("#edit").click(function () {
                $("#myModal4").modal({ backdrop: "static" });
            });
        </script>
    </body>

</html>
