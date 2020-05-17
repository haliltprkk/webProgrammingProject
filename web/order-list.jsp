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
            <a href="/admin-dashboard.jsp" class="navbar-brand"> D&R Admin Panel </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/list-order" class="nav-link">Siparişler</a></li>
        </ul>
    </nav>
</header>
<br>

<div class="row">
    <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

    <div class="container">
        <h3 class="text-center">Sipariş Listesi</h3>
        <hr>
        <div class="container text-left">

            <a href="<%=request.getContextPath()%>/new-order" class="btn btn-success">
                Yeni Sipariş Ekle</a>
        </div>
        <br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>Başlık</th>
                <th>Fiyat</th>
                <th>İşlemler</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="product" items="${listUser}">
                <tr>
                    <td><c:out value="${product.id}"/></td>
                    <td><c:out value="${product.title}"/></td>
                    <td><c:out value="${product.price}"/></td>
                    <td><a href="edit-order?id=<c:out value='${product.id}' />">Düzenle</a>
                        &nbsp;&nbsp;&nbsp;&nbsp; <a href="delete-order?id=<c:out value='${product.id}' />">Sil</a></td>
                </tr>
            </c:forEach>
            <!-- } -->
            </tbody>

        </table>
    </div>
</div>
</body>
</html>