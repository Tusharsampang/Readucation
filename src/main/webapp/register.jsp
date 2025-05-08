<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>EBook: Register</title>
  <%@ include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #fef12;">

<%@ include file="all_component/navbar.jsp" %>

<div class="container p-2">
  <div class="row">
    <div class="col-md-4 offset-md-4">
      <div class="card">
        <div class="card-body">
          <h4 class="text-center">Registration Page</h4>

          <form action='/readuaction/register' method="post">

          
            <div class="form-group">
              <label for="fullName">Enter Full Name</label>
              <input type="text" class="form-control" id="fullName" aria-describedby="nameHelp" required="required" name="fname">
            </div>

            <div class="form-group">
              <label for="exampleInputEmail">Email address</label>
              <input type="email" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" required="required" name="email">
            </div>

            <div class="form-group">
              <label for="exampleInputNumber">Phone No</label>
              <input type="number" class="form-control" id="exampleInputNumber" aria-describedby="phoneHelp" required="required" name="phoneno">
            </div>

            <div class="form-group">
              <label for="exampleInputPassword1">Password</label>
              <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
            </div>

            <div class="form-check">
              <input type="checkbox" class="form-check-input" name="check" id="exampleCheck1">
              <label class="form-check-label" for="exampleCheck1">Check me out</label>
            </div>

            <button type="submit" class="btn btn-primary mt-2">Submit</button>
          </form>

        </div>
      </div>
    </div>
  </div>
</div>



</body>
</html>