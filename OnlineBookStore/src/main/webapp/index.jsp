<%@page import="in.co.book.store.controller.IndexCtl"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.book.store.bean.BookBean"%>
<%@page import="in.co.book.store.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Readucation</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    .jumbotron {
        background-color: #f8f9fa;
        padding: 30px 20px;
        text-align: center;
    }

    .container {
        padding: 20px;
        max-width: 1200px;
        margin: auto;
    }

    .row {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
    }

    .card {
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        margin: 10px;
        padding: 10px;
        width: 30%;
        min-width: 250px;
        box-sizing: border-box;
        background-color: #fff;
        transition: transform 0.3s;
    }

    .card:hover {
        transform: scale(1.03);
    }

    .card img {
        width: 100%;
        height: 250px;
        object-fit: cover;
        border-radius: 5px;
    }

    .card-body {
        padding: 10px;
        text-align: center;
    }

    .card-title {
        font-size: 1.2rem;
        margin-bottom: 10px;
        color: #333;
    }

    .bloc_left_price {
        color: green;
        font-weight: bold;
        margin: 10px 0;
    }

    .btn {
        background-color: #dc3545;
        color: white;
        padding: 10px 15px;
        text-decoration: none;
        border: none;
        border-radius: 5px;
        display: inline-block;
        cursor: pointer;
    }

    .btn:disabled {
        background-color: #ccc;
    }

    .pagination {
        display: flex;
        justify-content: center;
        list-style: none;
        padding: 0;
    }

    .pagination .page-item {
        margin: 0 5px;
    }

    .pagination .page-link {
        padding: 10px 15px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .pagination .page-link:disabled {
        background-color: #ccc;
        cursor: default;
    }

    @media (max-width: 768px) {
        .card {
            width: 45%;
        }
    }

    @media (max-width: 480px) {
        .card {
            width: 90%;
        }
    }
</style>
</head>
<body>
<%@ include file="jsp/Header.jsp" %>



<form action="<%=OBSView.INDEX_CTL%>" method="post">
<div class="container">
    <div class="row">
        <%
            int pageNo = ServletUtility.getPageNo(request);
            int pageSize = ServletUtility.getPageSize(request);
            int size=(int)request.getAttribute("size");
            int index = ((pageNo - 1) * pageSize) + 1;
            BookBean bean=null;
            List list = ServletUtility.getList(request);
            Iterator<BookBean> it = list.iterator();

            while (it.hasNext()) {
                bean = it.next();
        %>
        <div class="card">
            <img src="<%=OBSView.APP_CONTEXT%>/images/<%=bean.getImageName()%>" alt="Book image">
            <div class="card-body">
                <h4 class="card-title"><%=bean.getName()%></h4>
                <% if(bean.getSaleType().equalsIgnoreCase("Paid")) { %>
                    <p class="bloc_left_price">$<%=bean.getPrice()%></p>
                <% } else { %>
                    <p class="bloc_left_price">Free</p>
                <% } %>
                <% if(bean.getSaleType().equalsIgnoreCase("Paid")) { %>
                    <a href="<%=OBSView.USER_REGISTRATION_CTL%>?biNa=<%=bean.getName()%>" class="btn">Download</a>
                <% } else { %>
                    <a target="_blank" href="<%=OBSView.APP_CONTEXT%>/pdfs/<%=bean.getPdfName()%>" class="btn">Download</a>
                <% } %>
            </div>
        </div>
        <% } %>
    </div>

    <div class="row" style="margin-top: 20px;">
        <ul class="pagination">
            <li class="page-item">
                <input type="submit" name="operation" class="page-link"
                    value="<%=IndexCtl.OP_PREVIOUS%>" <%= (pageNo == 1) ? "disabled" : "" %>>
            </li>
            <li class="page-item">
                <input type="submit" name="operation" class="page-link"
                    value="<%=IndexCtl.OP_NEXT%>"
                    <%=((list.size() < pageSize) || size==pageNo*pageSize) ? "disabled" : ""%>>
            </li>
        </ul>
    </div>
</div>
</form>

<%@ include file="jsp/Footer.jsp" %>
</body>
</html>