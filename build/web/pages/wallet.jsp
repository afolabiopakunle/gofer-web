<%-- 
    Document   : wallet
    Created on : 10-Feb-2020, 20:53:52
    Author     : JOSWAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="../Scripts/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../Scripts/css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link href="../Scripts/css/profile.css" rel="stylesheet" type="text/css"/>
        <link href="../Scripts/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="../Scripts/css/wallet.css" rel="stylesheet" type="text/css"/>
        <title>Gofer</title>
    </head>

    <body>

        <div class="container-fluid errand">
            <%@include file="../WEB-INF/jspf/fragments/general/header.jspf" %>
            <jsp:include page="../WEB-INF/jspf/static_pages/user/wallet.jsp"></jsp:include>                 
        </div>

        <script src="../Scripts/js/jquery-3.4.1.js" type="text/javascript"></script>
        <script src="../Scripts/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Scripts/js/script.js" type="text/javascript"></script>
        <script src="../Scripts/js/AppScript.js" type="text/javascript"></script>
    </body>

</html>