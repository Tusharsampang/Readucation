<%@page import="in.co.book.store.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.book.store.controller.BookCtl"%>
<%@page import="in.co.book.store.util.DataUtility"%>
<%@page import="in.co.book.store.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 0;
    }
    .jumbotron {
        background-color: #007bff;
        color: white;
        padding: 2rem;
        text-align: center;
    }
    .container {
        width: 90%;
        max-width: 800px;
        margin: 2rem auto;
        background-color: white;
        padding: 2rem;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    .breadcrumb {
        list-style: none;
        padding: 0;
        margin: 0 0 1rem 0;
        display: flex;
        flex-wrap: wrap;
    }
    .breadcrumb li {
        margin-right: 5px;
    }
    .breadcrumb a {
        text-decoration: none;
        color: #007bff;
    }
    .breadcrumb .active a {
        color: #6c757d;
        pointer-events: none;
    }
    .card {
        border: 1px solid #ddd;
        border-radius: 5px;
        overflow: hidden;
    }
    .card-header {
        background-color: #007bff;
        color: white;
        padding: 1rem;
        font-size: 1.2rem;
    }
    .card-body {
        padding: 1rem;
    }
    .form-group {
        margin-bottom: 1rem;
    }
    label {
        display: block;
        font-weight: bold;
        margin-bottom: .5rem;
    }
    input[type="text"],
    input[type="file"],
    select,
    textarea {
        width: 100%;
        padding: .5rem;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    textarea {
        resize: vertical;
    }
    .btn {
        padding: .6rem 1.2rem;
        margin: 0.5rem 0.3rem 0 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        color: white;
        background-color: #007bff;
    }
    .btn:hover {
        background-color: #0056b3;
    }
    font[color="red"] {
        display: block;
        margin-top: 0.3rem;
        font-size: 0.9rem;
        color: red;
    }
    font[color="green"] {
        display: block;
        margin-top: 0.3rem;
        font-size: 0.9rem;
        color: green;
    }
    .mx-auto {
        text-align: center;
        margin-top: 2rem;
    }
</style>
</head>
<body>
<%@ include file="Header.jsp" %>



<div class="container">
    <ul class="breadcrumb">
        <li><a href="<%=OBSView.WELCOME_CTL%>">Home</a> &gt;</li>
        <li><a href="<%=OBSView.BOOK_LIST_CTL%>">Book</a> &gt;</li>
        <li class="active"><a href="<%=OBSView.BOOK_CTL%>">Add Product</a></li>
    </ul>

    <form action="<%=OBSView.BOOK_CTL%>" method="post" enctype="multipart/form-data">
        <jsp:useBean id="bean" class="in.co.book.store.bean.BookBean" scope="request"/>
        <div class="card">
            <div class="card-header">
                <%=bean.getId() > 0 ? "Update Product" : "Add Product"%>
            </div>

            <div class="card-body">
                <font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
                <font color="green"><%=ServletUtility.getSuccessMessage(request)%></font>

                <input type="hidden" name="id" value="<%=bean.getId()%>">
                <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
                <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
                <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
                <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">

                <div class="form-group">
                    <label>Name</label>
                    <input type="text" name="name" placeholder="Enter Book Name..." value="<%=DataUtility.getStringData(bean.getName())%>">
                    <font color="red"><%=ServletUtility.getErrorMessage("name", request)%></font>
                </div>

                <%
                    HashMap map = new HashMap();
                    map.put("Free", "Free");
                    map.put("Paid", "Paid");
                %>
                <div class="form-group">
                    <label>SaleType</label>
                    <%=HTMLUtility.getList1("saleType", String.valueOf(bean.getSaleType()), map)%>
                    <font color="red"><%=ServletUtility.getErrorMessage("saleType", request)%></font>
                </div>

                <div class="form-group">
                    <label>Price</label>
                    <input type="text" id="input_price" name="price" placeholder="Enter Book Price..."
                        <%
                            if(bean.getSaleType() != null && bean.getSaleType().equalsIgnoreCase("Free")){
                        %> disabled="true" <% } %>
                        value="<%=(bean.getPrice() > 0) ? bean.getPrice() : ""%>">
                    <font color="red"><%=ServletUtility.getErrorMessage("price", request)%></font>
                </div>

                <div class="form-group">
                    <label>Image</label>
                    <input type="file" name="photo" placeholder="Upload Image Here...">
                    <font color="red"><%=ServletUtility.getErrorMessage("photo", request)%></font>
                </div>

                <div class="form-group">
                    <label>Pdf Name</label>
                    <input type="file" name="pdfName" placeholder="Upload PDF Here...">
                    <font color="red"><%=ServletUtility.getErrorMessage("pdfName", request)%></font>
                </div>

                <div class="form-group">
                    <label>Description</label>
                    <textarea rows="5" name="description" placeholder="Enter Book Description Here..."><%=DataUtility.getStringData(bean.getDescription())%></textarea>
                    <font color="red"><%=ServletUtility.getErrorMessage("description", request)%></font>
                </div>

                <div class="mx-auto">
                    <input type="submit" name="operation" class="btn" value="<%=BookCtl.OP_SAVE%>">
                    <% if(bean.getId() > 0){ %>
                        <input type="submit" name="operation" class="btn" value="<%=BookCtl.OP_CANCEL%>">
                    <% } else { %>
                        <input type="submit" name="operation" class="btn" value="<%=BookCtl.OP_RESET%>">
                    <% } %>
                </div>
            </div>
        </div>
    </form>
</div>

<%@ include file="Footer.jsp" %>
</body>
</html>
