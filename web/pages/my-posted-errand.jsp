<%-- 
    Document   : my-posted-errand
    Created on : Apr 1, 2020, 7:44:19 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../Scripts/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../Scripts/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="../Scripts/css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link href="../Scripts/css/my-posted-errand.css" rel="stylesheet" type="text/css"/>
        <link href="../Scripts/css/all.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>GOFER</title>
    </head>

    <body>
        <main class="container-fluid errand p-0">
            <%@include file="../WEB-INF/jspf/fragments/general/header.jspf" %>
            <jsp:include page="../WEB-INF/jspf/static_pages/user/post-errand.jsp"></jsp:include>          
        </main>
        <script src="../Scripts/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Scripts/js/jquery-3.4.1.js" type="text/javascript"></script>
        <script src="../Scripts/js/script.js" type="text/javascript"></script>
        <script src="../Scripts/js/AppScript.js" type="text/javascript"></script>
        <script>
            $("#negotiate-btn, #negotiate-btn2, #negotiate-btn3").click(function () {
                $("#myModal3").modal({ backdrop: "static" });
            });

            $("#abort").click(function () {
                $("#cancel").modal({ backdrop: "static" });
            });
        </script>

    </body>
</html>
