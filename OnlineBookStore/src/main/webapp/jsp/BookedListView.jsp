<%@page import="in.co.book.store.controller.BookedListCtl"%>
<%@page import="in.co.book.store.bean.BookBean"%>
<%@page import="in.co.book.store.model.BookModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.book.store.bean.BookedBean"%>
<%@page import="in.co.book.store.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BookedListView</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f9fc;
        margin: 0;
        padding: 0;
    }

    .jumbotron {
        background-color: #007bff;
        color: white;
        padding: 40px 20px;
        text-align: center;
    }

    .container {
        width: 90%;
        margin: auto;
        padding: 20px 0;
    }

    .breadcrumb {
        list-style: none;
        padding: 10px 0;
        margin: 10px 0;
        display: flex;
        font-size: 14px;
    }

    .breadcrumb li {
        margin-right: 8px;
    }

    .breadcrumb a {
        color: #007bff;
        text-decoration: none;
    }

    .breadcrumb a:hover {
        text-decoration: underline;
    }

    .row {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
    }

    .card {
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        padding: 15px;
        width: calc(33.333% - 20px);
        box-sizing: border-box;
    }

    .card img {
        max-width: 100%;
        height: auto;
        border-radius: 6px;
    }

    .card h4 {
        margin: 10px 0 5px;
        font-size: 18px;
        color: #333;
    }

    .bloc_left_price {
        color: green;
        font-weight: bold;
        margin-bottom: 10px;
    }

    .btn {
        display: block;
        width: 100%;
        padding: 10px 0;
        background-color: #dc3545;
        color: white;
        text-align: center;
        border: none;
        border-radius: 5px;
        text-decoration: none;
        font-weight: bold;
        cursor: pointer;
        margin-top: 10px;
    }

    .btn:hover {
        background-color: #c82333;
    }

    .pagination {
        display: flex;
        justify-content: center;
        list-style: none;
        padding: 20px 0;
        gap: 10px;
    }

    .page-item input[type="submit"] {
        padding: 8px 16px;
        border: 1px solid #ccc;
        background-color: #fff;
        cursor: pointer;
        border-radius: 4px;
    }

    .page-item input[type="submit"]:hover {
        background-color: #f0f0f0;
    }

    .page-item input[disabled] {
        background-color: #e9ecef;
        cursor: not-allowed;
        color: #999;
    }

    @media (max-width: 768px) {
        .card {
            width: 100%;
        }
    }
</style>
</head>
<body>
<%@ include file="Header.jsp" %>

<section class="jumbotron">
    <div class="container">
        <h1 class="jumbotron-heading">Booked</h1>
    </div>
</section>

<form action="<%=OBSView.BOOKED_LIST_CTL%>" method="post">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="<%=OBSView.WELCOME_CTL%>">Home</a></li>
            <li><a href="<%=OBSView.BOOKED_LIST_CTL%>">Booked List</a></li>
        </ul>

        <div class="row">
            <%
                int pageNo = ServletUtility.getPageNo(request);
                int pageSize = ServletUtility.getPageSize(request);
                int size = (int) request.getAttribute("size");
                int index = ((pageNo - 1) * pageSize) + 1;
                BookedBean bean = null;
                List list = ServletUtility.getList(request);
                Iterator<BookedBean> it = list.iterator();

                while (it.hasNext()) {
                    bean = it.next();
                    BookModel bModel = new BookModel();
                    BookBean bBean = bModel.findByPK(bean.getBookId());
            %>
            <div class="card">
                <img src="<%=OBSView.APP_CONTEXT%>/images/<%=bean.getImage()%>" alt="Book Image">
                <div>
                    <h4><%=bBean.getName()%></h4>
                    <p class="bloc_left_price">$<%=bBean.getPrice()%></p>
                    <a target="_blank" href="<%=OBSView.APP_CONTEXT%>/pdfs/<%=bean.getPdf()%>" class="btn">Download</a>
                </div>
            </div>
            <% } %>
        </div>

        <ul class="pagination">
            <li class="page-item">
                <input type="submit" name="operation" value="<%=BookedListCtl.OP_PREVIOUS%>" <%= (pageNo == 1) ? "disabled" : "" %>>
            </li>
            <li class="page-item">
                <input type="submit" name="operation" value="<%=BookedListCtl.OP_NEXT%>" <%= ((list.size() < pageSize) || size == pageNo * pageSize) ? "disabled" : "" %>>
            </li>
        </ul>
    </div>
</form>

<%@ include file="Footer.jsp" %>
</body>
</html>
