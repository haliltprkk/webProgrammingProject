<%@ page import="usermanagement.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.IOException" %><%--
  Created by IntelliJ IDEA.
  User: haliltprkk
  Date: 1.05.2020
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <meta charset="utf-8">
    <title>D&R</title>
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>


<!-- Bootstrap Nav -->
<nav class="navbar navbar-light navbar-expand-lg sticky-top navbar-inverse " style="background-color: #ffffff;">
    <a class="navbar-brand" href="#">
        <img src="https://www.dr.com.tr/Themes/DR/Content/assets/images/general/head-logo.png" width="auto" height="45"
             alt="">
    </a>
    <!-- <a class="navbar-brand" href="#">Tutumlu Anne</a> -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup"
            aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            <a class="nav-item nav-link size-20px" href="orders.jsp">Siparişlerim</a>
            <a class="nav-item nav-link size-20px" href="cart.jsp">Sepetim</a>
            <form class="nav-item nav-link size-20px" method="post" action="/navigator">
                <input type="hidden" name="logout" value="<%="logout"%>"/>
                <input style="background: white; border: none;" type='submit' value="Çıkış yap"/>
            </form>
        </div>
    </div>
</nav>
<div class="hr"></div>
<div class="body">

    <div class="py-md-3">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 py-3">
                    <h2>Ürünler</h2>
                </div>

                <c:forEach var="product" items="${listProduct}">

                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-4 col-6 list-item">
                        <div class="card">
                            <img src="${product.image}"
                                 alt="book im">
                            <div class="card-body">
                                <h5 class="card-title"><c:out value="${product.title}"/></h5>
                                <p class="card-text">${product.description}</p>
                                <p class="card-price">
                                    <span class="new-price">${product.price} TL</span>
                                </p>
                            </div>
                        </div>
                        <form class="nav-item nav-link size-20px" method="post" action="/navigator">
                            <input type="hidden" name="addToCart" value="${product.id}"/>
                            <input style="background: dodgerblue; color: white; padding: 5px; border: none;"
                                   type='submit' value="Sepete Ekle" onsubmit="showAlert('İşlem başarılı')"/>
                        </form>
                    </div>
                </c:forEach>

            </div>
        </div>
    </div>
</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script>
    function showAlert(text) {
        alert(text);
    }
</script>
</body>
</html>