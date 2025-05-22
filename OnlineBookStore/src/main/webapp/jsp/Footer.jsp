<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Footer</title>
<style>
    footer {
        background-color: #333;
        color: #f0f0f0;
        padding: 20px 0;
        font-family: Arial, sans-serif;
        font-size: 14px;
    }

    .footer-container {
        width: 90%;
        max-width: 1000px;
        margin: 0 auto;
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
    }

    .footer-text {
        color: #ccc;
    }

    .footer-text:hover {
        color: #ffffff;
    }
</style>
</head>
<body>
<footer>
    <div class="footer-container">
        <p class="footer-text">
            <%=Calendar.getInstance().get(Calendar.YEAR)%> &copy; All Rights Reserved, Readucation
        </p>
    </div>
</footer>
</body>
</html>
