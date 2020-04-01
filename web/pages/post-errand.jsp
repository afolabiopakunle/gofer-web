<%-- 
    Document   : post-errand
    Created on : 10-Feb-2020, 21:20:37
    Author     : JOSWAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../Scripts/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../Scripts/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="../Scripts/css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link href="../Scripts/css/posted-errand.css" rel="stylesheet" type="text/css"/>
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
            $("#post-errand-btn").click(function (e) {
                e.preventDefault();
                $("#myModal3").modal({ backdrop: "static" });
            });
        </script>

    </body>

</html>
