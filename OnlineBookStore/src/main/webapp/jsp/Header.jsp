<%@page import="in.co.book.store.controller.LoginCtl"%>
<%@page import="in.co.book.store.controller.OBSView"%>
<%@page import="in.co.book.store.bean.UserBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Readucation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #f4f4f4;
        }

        nav {
            background-color: #2c3e50;
            color: white;
            padding: 10px 0;
            box-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }

        .navbar-container {
            width: 90%;
            margin: auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .nav-logo img {
            height: 50px;
            width: 150px;
        }

        .nav-links {
            display: flex;
            gap: 15px;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 8px 14px;
            border-radius: 4px;
            transition: background 0.3s;
        }

        .nav-links a:hover {
            background-color: #1abc9c;
        }

        .login-btn {
            background-color: #27ae60;
            color: white;
            padding: 7px 12px;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            font-weight: bold;
        }

        .login-btn:hover {
            background-color: #2ecc71;
        }

        .welcome {
            padding: 10px;
            text-align: center;
            font-size: 1.1em;
            color: #333;
        }
    </style>
</head>
<body>

<%
    UserBean userBean = (UserBean) session.getAttribute("user");
    boolean userLoggedIn = userBean != null;
    String welcomeMsg = "Hi, ";
    if (userLoggedIn) {
        String role = (String) session.getAttribute("role");
        welcomeMsg += userBean.getFirstName() + " (" + role + ")";
    } else {
        welcomeMsg += "Guest";
    }
%>

<div class="welcome"><%= welcomeMsg %></div>

<nav>
    <div class="navbar-container">
        <div class="nav-logo">
            <h1 style="text-bold; ">Readucation</h1>
        </div>
        <div class="nav-links">
            <% if (userLoggedIn) {
                if (userBean.getRoleId() == 1) { %>
                    <a href="<%=OBSView.WELCOME_CTL%>">Home</a>
                    <a href="<%=OBSView.BOOK_CTL%>">Add Book</a>
                    <a href="<%=OBSView.BOOK_LIST_CTL%>">Book</a>
                    <a href="/OnlineBookStore/jsp/ContactView.jsp">Contact Us</a>
                <% } else if (userBean.getRoleId() == 2) { %>
                    <a href="<%=OBSView.WELCOME_CTL%>">Home</a>
                    <a href="<%=OBSView.BOOKED_LIST_CTL%>">Booked Book List</a>
                    <a href="/OnlineBookStore/jsp/ContactView.jsp">Contact Us</a>
                <% } %>
            <% } else { %>
                <a href="<%=OBSView.WELCOME_CTL%>">Home</a>
                <a href="/OnlineBookStore/jsp/ContactView.jsp">Contact Us</a>
                <a href="/OnlineBookStore/jsp/AboutUsView.jsp">About Us</a>
                <a href="<%=OBSView.INDEX_CTL%>">Books</a>
            <% } %>
        </div>

        <div>
            <% if (userLoggedIn) { %>
                <a class="login-btn" href="<%=OBSView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOG_OUT%>">Logout</a>
            <% } else { %>
                <a class="login-btn" href="<%=OBSView.LOGIN_CTL%>">Login</a>
            <% } %>
        </div>
    </div>
</nav>

</body>
</html>
