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
            <li><a href="<%=request.getContextPath()%>/list-books" class="nav-link">Ürünler</a></li>
        </ul>
    </nav>
</header>
<br>

<div class="row">
    <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

    <div class="container">
        <h3 class="text-center">Ürün Listesi</h3>
        <hr>
        <div class="container text-left">

            <a href="<%=request.getContextPath()%>/new-books" class="btn btn-success">
                Yeni Ürün Ekle</a>
        </div>
        <br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>Başlık</th>
                <th>Resim</th>
                <th>Fiyat</th>
                <th>İşlemler</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="product" items="${listUser}">
                <tr>
                    <td><c:out value="${product.id}"/></td>
                    <td><c:out value="${product.title}"/></td>
                    <td><img src="${product.image}" style="width: 100px; height: 100px"/></td>
                    <td><c:out value="${product.price}"/></td>
                    <td><a href="edit-books?id=<c:out value='${product.id}' />">Düzenle</a>
                        &nbsp;&nbsp;&nbsp;&nbsp; <a href="delete-books?id=<c:out value='${product.id}' />">Sil</a></td>
                </tr>
            </c:forEach>
            <!-- } -->
            </tbody>

        </table>
    </div>
</div>
</body>
</html>