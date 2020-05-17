<%@ page import="usermanagement.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="usermanagement.dao.UserDAO" %>
<%@ page import="usermanagement.dao.ProductDAO" %>
<%@ page import="usermanagement.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="tr">
<head>
    <title>BookStore</title>
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <link href="css/user-form.css" rel="stylesheet">
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: #197bff">
        <div>
            <a href="" class="navbar-brand"> Siparişlerim </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="/navigator" class="nav-link">Ana Sayfa</a></li>
        </ul>
    </nav>
</header>
<br>
<%!List<Product> products;%>
<%!
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }
%>
<%
    User user = (User) session.getAttribute("sessionUser");
    products = productDAO.selectAllOrders(user.getId());
    for (Product p :
            products) {
    }
%>


<div class="row">
    <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

    <div class="container">
        <h3 class="text-center"></h3>
        <hr>
        <div class="container text-left">

            <%--            <a href="<%=request.getContextPath()%>/new-books" class="btn btn-success">Yeni Ürün Ekle</a>--%>
        </div>
        <br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Başlık</th>
                <th>Resim</th>
                <th>Fiyat</th>
                <th>Durum</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="product" items="<%=products%>">
                <tr>
                    <td><c:out value="${product.title}"/></td>
                    <td><img src="${product.image}" style="width: 100px; height: 100px"/></td>
                    <td><c:out value="${product.price}"/></td>
                    <td>Onay Bekleniyor</td>
                </tr>
            </c:forEach>
            <!-- } -->
            </tbody>

        </table>

        </p>
    </div>
</div>
</body>
</html>