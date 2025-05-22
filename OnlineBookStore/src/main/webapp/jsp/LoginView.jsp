<%@page import="in.co.book.store.util.DataUtility"%>
<%@page import="in.co.book.store.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4;">

<%@ include file="Header.jsp" %>

<!-- Jumbotron Section -->
<section style="text-align: center; background-color: #007bff; color: white; padding: 40px 20px;">
    <h1 style="margin: 0;">Admin Login</h1>
</section>

<!-- Breadcrumb -->
<div style="padding: 15px 30px;">
    <div style="margin-bottom: 10px;">
        <nav>
            <ol style="list-style: none; padding: 0; display: flex; font-size: 14px;">
                <li><a href="<%=OBSView.WELCOME_CTL%>" style="text-decoration: none; color: #007bff;">Home</a></li>
                <li style="margin: 0 5px;">/</li>
                <li><a href="<%=OBSView.LOGIN_CTL%>" style="text-decoration: none; color: #6c757d;">Login</a></li>
            </ol>
        </nav>
    </div>
</div>

<!-- Login Card -->
<div style="max-width: 500px; margin: 0 auto; background-color: white; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); padding: 25px;">
    <div style="background-color: #007bff; padding: 15px; border-radius: 8px 8px 0 0; color: white; font-weight: bold;">
        Login
    </div>

    <div style="padding: 15px;">
        <font color="red"><%=ServletUtility.getErrorMessage(request)%></font><br>
        <font color="green"><%=ServletUtility.getSuccessMessage(request)%></font>

        <form action="<%=OBSView.LOGIN_CTL%>" method="post">

            <jsp:useBean id="bean" class="in.co.book.store.bean.UserBean" scope="request" />
            <% String uri = (String) request.getAttribute("uri"); %>
            <input type="hidden" name="uri" value="<%=uri%>">
            <input type="hidden" name="id" value="<%=bean.getId()%>">
            <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
            <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
            <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
            <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">

            <!-- Login Field -->
            <div style="margin-bottom: 15px;">
                <label for="email" style="display: block; margin-bottom: 5px;">Login Id</label>
                <input type="text" name="login" placeholder="Enter Login Id..." 
                       value="<%=DataUtility.getStringData(bean.getLogin())%>" 
                       style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px;">
                <font color="red"><%=ServletUtility.getErrorMessage("login", request)%></font>
            </div>

            <!-- Password Field -->
            <div style="margin-bottom: 15px;">
                <label for="password" style="display: block; margin-bottom: 5px;">Password</label>
                <input type="password" name="password" placeholder="Enter Password Here.." 
                       value="<%=DataUtility.getStringData(bean.getPassword())%>" 
                       style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px;">
                <font color="red"><%=ServletUtility.getErrorMessage("password", request)%></font>
            </div>

            <!-- Submit Button -->
            <div style="text-align: right;">
                <input type="submit" name="operation" value="<%=LoginCtl.OP_SIGN_IN%>" 
                       style="background-color: #007bff; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer;">
            </div>
        </form>
    </div>
</div>

<br><br>

<%@ include file="Footer.jsp" %>
</body>
</html>
