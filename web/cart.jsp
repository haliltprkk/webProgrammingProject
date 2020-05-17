<%@ page import="usermanagement.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
            <a href="" class="navbar-brand"> Sepetim </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="/navigator" class="nav-link">Ana Sayfa</a></li>
        </ul>
    </nav>
</header>
<br>
<%!List<Product> products;%>
<%!int total;%>
<%
    total = 0;
    products = (List<Product>) session.getAttribute("cartProducts");
    for (Product p :
            products) {
        total += p.getPrice();
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
                <th>İşlemler</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="product" items="<%=products%>">
                <tr>
                    <td><c:out value="${product.title}"/></td>
                    <td><img src="${product.image}" style="width: 100px; height: 100px"/></td>
                    <td><c:out value="${product.price}"/></td>
                    <td><a href="/navigator?removeProduct=<c:out value='${product.id}' />">Sil</a></td>
                </tr>
            </c:forEach>
            <!-- } -->
            </tbody>

        </table>
        <p style="padding: 10px; font-size: 20px;font-weight: bold">Total :<%=total%>
            <form>
        <p>Lütfen ödeme yöntemi seçin:</p>
        <div>
            <input type="radio" id="contactChoice1"
                   name="contact" value="email">
            <label for="contactChoice1">Kapıda Ödeme</label>

            <input type="radio" id="contactChoice2"
                   name="contact" value="phone">
            <label for="contactChoice2">Taksitle</label>

            <input type="radio" id="contactChoice3"
                   name="contact" value="mail">
            <label for="contactChoice3">Tek çekim</label>
        </div>
        </form>
        <button style="margin-top: 20px;" class="btn btn-primary btn-lg btn-block "><a style="color: white;" href="/navigator?buy=buy">Satın
            Al</a></button>
    </div>
</div>
</body>
</html>