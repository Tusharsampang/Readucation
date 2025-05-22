<%@page import="in.co.book.store.controller.UserRegistrationCtl"%>
<%@page import="in.co.book.store.util.DataUtility"%>
<%@page import="in.co.book.store.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f7f7f7;">
<%@ include file="Header.jsp" %>

<section style="background-color: #007bff; color: white; padding: 30px 0; text-align: center;">
    <h1>Register And Download</h1>
</section>

<div style="margin: 20px auto; width: 90%; max-width: 800px;">
    <div style="margin-bottom: 10px;">
        <p>
            <a href="<%=OBSView.INDEX_CTL%>" style="text-decoration: none; color: #007bff;">Home</a> /
            <a href="<%=OBSView.USER_REGISTRATION_CTL%>" style="text-decoration: none; color: #007bff;">Register And Download</a>
        </p>
    </div>

    <div style="background-color: white; border: 1px solid #ddd; border-radius: 5px;">
        <div style="background-color: #007bff; color: white; padding: 15px; font-size: 18px; border-top-left-radius: 5px; border-top-right-radius: 5px;">
            Register And Download
        </div>

        <div style="padding: 20px;">
            <p style="color: red;"><%=ServletUtility.getErrorMessage(request)%></p>
            <p style="color: green;"><%=ServletUtility.getSuccessMessage(request)%></p>

            <form action="<%=OBSView.USER_REGISTRATION_CTL%>" method="post">

                <jsp:useBean id="bean" class="in.co.book.store.bean.UserBean" scope="request" />

                <input type="hidden" name="id" value="<%=bean.getId()%>">
                <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
                <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
                <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
                <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">

                <div style="margin-bottom: 15px;">
                    <label>First Name</label><br>
                    <input type="text" name="firstName" placeholder="Enter First Name..." 
                        value="<%=DataUtility.getStringData(bean.getFirstName())%>" 
                        style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
                    <span style="color:red;"><%=ServletUtility.getErrorMessage("firstName", request)%></span>
                </div>

                <div style="margin-bottom: 15px;">
                    <label>Last Name</label><br>
                    <input type="text" name="lastName" placeholder="Enter Last Name..." 
                        value="<%=DataUtility.getStringData(bean.getLastName())%>" 
                        style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
                    <span style="color:red;"><%=ServletUtility.getErrorMessage("lastName", request)%></span>
                </div>

                <div style="margin-bottom: 15px;">
                    <label>Login ID</label><br>
                    <input type="text" name="login" placeholder="Enter Login ID..." 
                        value="<%=DataUtility.getStringData(bean.getLogin())%>" 
                        style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
                    <span style="color:red;"><%=ServletUtility.getErrorMessage("login", request)%></span>
                </div>

                <div style="margin-bottom: 15px;">
                    <label>Password</label><br>
                    <input type="password" name="password" placeholder="Enter Password..." 
                        value="<%=DataUtility.getStringData(bean.getPassword())%>" 
                        style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
                    <span style="color:red;"><%=ServletUtility.getErrorMessage("password", request)%></span>
                </div>

                <div style="margin-bottom: 15px;">
                    <label>Email Address</label><br>
                    <input type="text" name="email" placeholder="Enter Email Address..." 
                        value="<%=DataUtility.getStringData(bean.getLogin())%>" 
                        style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
                    <span style="color:red;"><%=ServletUtility.getErrorMessage("email", request)%></span>
                </div>

                <div style="margin-bottom: 15px;">
                    <label>Mobile No.</label><br>
                    <input type="text" name="mobile" placeholder="Enter 10 Digit Mobile No." 
                        value="<%=DataUtility.getStringData(bean.getMobileNo())%>" 
                        style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
                    <span style="color:red;"><%=ServletUtility.getErrorMessage("mobile", request)%></span>
                </div>

                <div style="margin-bottom: 15px;">
                    <label>Card Number</label><br>
                    <input type="text" name="cardNumber" placeholder="Enter Card Number"
                        style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
                </div>

                <div style="margin-bottom: 15px;">
                    <label>Expiration</label><br>
                    <select style="padding: 6px; width: 48%;">
                        <option>MM</option>
                        <option>01 - January</option>
                        <option>02 - February</option>
                        <option>03 - March</option>
                        <option>04 - April</option>
                        <option>05 - May</option>
                        <option>06 - June</option>
                        <option>07 - July</option>
                        <option>08 - August</option>
                        <option>09 - September</option>
                        <option>10 - October</option>
                        <option>11 - November</option>
                        <option>12 - December</option>
                    </select>
                    <select style="padding: 6px; width: 48%;">
                        <option>YY</option>
                        <option>2024</option>
                        <option>2025</option>
                        <option>2026</option>
                        <option>2027</option>
                        <option>2028</option>
                    </select>
                </div>

                <div style="margin-bottom: 15px;">
                    <label>CVV</label><br>
                    <input type="text" placeholder="CVV" style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
                </div>

                <div style="text-align: center; margin-top: 20px;">
                    <input type="submit" name="operation" value="<%=UserRegistrationCtl.OP_SIGN_UP%>" 
                        style="background-color: #007bff; color: white; border: none; padding: 10px 20px; margin-right: 10px; border-radius: 4px; cursor: pointer;">
                    <input type="submit" name="operation" value="<%=UserRegistrationCtl.OP_RESET%>" 
                        style="background-color: #6c757d; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer;">
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="Footer.jsp" %>
</body>
</html>
