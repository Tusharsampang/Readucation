<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
<style>
    body {
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f9f9f9;
    }

    .grid-container {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 30px;
        padding: 40px;
        max-width: 1200px;
        margin: auto;
    }

    .card {
        background-color: #fff;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .card:hover {
        transform: scale(1.03);
        box-shadow: 0 6px 20px rgba(0,0,0,0.2);
    }

    .card img {
        width: 100%;
        height: 200px;
        object-fit: cover;
    }

    .card h3 {
        margin: 16px;
        font-size: 18px;
        color: #333;
    }

    .jumbotron {
        background-color: #ffffff;
        padding: 40px 20px;
        text-align: center;
        box-shadow: 0px 2px 4px rgba(0,0,0,0.1);
    }

    .jumbotron-heading {
        font-size: 36px;
        color: #2c3e50;
        margin: 0;
    }

    .main-image {
        width: 100%;
        height: auto;
        display: block;
        max-height: 500px;
        object-fit: cover;
    }

</style>
<body>

<%@ include file="Header.jsp" %>

<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">Welcome Readucation</h1>
        <p class="lead text-muted mb-0"></p>
    </div>
</section>



<div class="grid-container">
    <!-- Card 1 -->
    <div class="card">
        <img src="/OnlineBookStore/images/harrypotter.jpg" alt="Harry Potter">
        <h3>Harry Potter</h3>
    </div>

    <!-- Card 2 -->
    <div class="card">
        <img src="/OnlineBookStore/images/Bill Gates.jpg" alt="Saviour King">
        <h3>Saviour King</h3>
    </div>

    <!-- Card 3 -->
    <div class="card">
        <img src="/OnlineBookStore/images/Bhagwatgita.jpg" alt="Bhagwat Gita">
        <h3>Bhagwat Gita</h3>
    </div>
</div>

<div style="margin-top: 80px;">
    <%@ include file="Footer.jsp" %>
</div>

</body>
</html>
