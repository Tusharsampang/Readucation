<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ebook: Login</title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #fef12;">
<%@include file="all_component/navbar.jsp" %>

<div class="container">
    <div class="row mt-2">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center">Login</h3>

                    <form>
                        <div class="form-group">
                            <label for="email">Email address</label>
                            <input type="email" class="form-control" id="email" aria-describedby="emailHelp" required>
                        </div>

                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" required>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Login</button><br>
                            <a href="register.jsp">Create Account</a>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>