<%@page import="in.co.book.store.controller.BookListCtl"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.book.store.bean.BookBean"%>
<%@page import="in.co.book.store.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book List</title>
</head>
<body style="margin:0; font-family: Arial, sans-serif; background-color: #f5f5f5;">

<%@ include file="Header.jsp" %>

<section style="background-color: #007bff; color: white; padding: 30px 0; text-align: center;">
    <div>
        <h1 style="margin: 0;">Book</h1>
    </div>
</section>

<form action="<%=OBSView.BOOK_LIST_CTL%>" method="post">
<div style="padding: 20px;">
    <div>
        <nav>
            <ol style="list-style: none; padding: 0; display: flex; gap: 10px;">
                <li><a href="<%=OBSView.WELCOME_CTL%>" style="text-decoration: none; color: #007bff;">Home</a></li>
                <li> / </li>
                <li><a href="<%=OBSView.BOOK_LIST_CTL%>" style="text-decoration: none; color: #007bff;">Book</a></li>
            </ol>
        </nav>
    </div>
</div>

<div style="padding: 20px;">
    <div style="display: flex; flex-wrap: wrap; gap: 20px; justify-content: center;">
    <%
        int pageNo = ServletUtility.getPageNo(request);
        int pageSize = ServletUtility.getPageSize(request);
        int size = (int) request.getAttribute("size");
        int index = ((pageNo - 1) * pageSize) + 1;
        BookBean bean = null;
        List list = ServletUtility.getList(request);
        Iterator<BookBean> it = list.iterator();

        while (it.hasNext()) {
            bean = it.next();
    %>
        <div style="width: 300px; background-color: white; border-radius: 8px; overflow: hidden; box-shadow: 0 2px 5px rgba(0,0,0,0.1);">
            <a href="<%=OBSView.BOOK_CTL%>">
                <img src="<%=OBSView.APP_CONTEXT%>/images/<%=bean.getImageName()%>" alt="Book Image" style="width: 100%; height: 200px; object-fit: cover;">
            </a>
            <div style="padding: 15px;">
                <h4 style="margin: 0 0 10px 0;">
                    <a href="<%=OBSView.BOOK_CTL%>" style="text-decoration: none; color: #333;"><%=bean.getName()%></a>
                </h4>
                <p style="color: #007bff; font-weight: bold;">
                    <% if (bean.getSaleType().equalsIgnoreCase("Paid")) { %>
                        $<%=bean.getPrice()%>
                    <% } else { %>
                        Free
                    <% } %>
                </p>
                <div style="display: flex; justify-content: space-between; margin-top: 15px;">
                    <a href="<%=OBSView.BOOK_LIST_CTL%>?bookId=<%=bean.getId()%>" 
   onclick="return confirm('Are you sure you want to delete this book?');"
   style="background-color: #dc3545; color: white; padding: 8px; text-align: center; border-radius: 4px; text-decoration: none; flex: 1; margin-right: 5px;">Delete</a>
                    <a href="<%=OBSView.BOOK_CTL%>?id=<%=bean.getId()%>" style="background-color: #28a745; color: white; padding: 8px; text-align: center; border-radius: 4px; text-decoration: none; flex: 1; margin-right: 5px;">Edit</a>
                    <a target="_blank" href="<%=OBSView.APP_CONTEXT%>/pdfs/<%=bean.getPdfName()%>" style="background-color: #dc3545; color: white; padding: 8px; text-align: center; border-radius: 4px; text-decoration: none; flex: 1;">View</a>
                </div>
            </div>
        </div>
    <% } %>
    </div>

    <div style="margin-top: 30px; text-align: center;">
        <input type="submit" name="operation" value="<%=BookListCtl.OP_PREVIOUS%>"
               style="padding: 10px 20px; margin-right: 10px; background-color: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer;"
               <%= (pageNo == 1) ? "disabled" : "" %>>

        <input type="submit" name="operation" value="<%=BookListCtl.OP_NEXT%>"
               style="padding: 10px 20px; margin-right: 10px; background-color: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer;"
               <%= ((list.size() < pageSize) || size == pageNo * pageSize) ? "disabled" : "" %>>

        <a href="<%=OBSView.BOOK_CTL%>" style="display: inline-block; padding: 10px 20px; background-color: #28a745; color: white; border-radius: 5px; text-decoration: none;">Add New Book</a>
    </div>
</div>
</form>

<%@ include file="Footer.jsp" %>
</body>
</html>
