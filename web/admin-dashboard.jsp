<%--
  Created by IntelliJ IDEA.
  User: haliltprkk
  Date: 15.05.2020
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Yönetici Paneli</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>

<div class="buttons">
    <button class="btn btn-primary btn-lg btn-block"><a href="/admin">Kullanıcılar</a></button>
    <button class="btn btn-primary btn-lg btn-block"> <a href="/admin-books">Ürünler</a></button>
    <button class="btn btn-primary btn-lg btn-block">  <a href="/admin-order">Siparişler</a></button>
    <form class="btn btn-primary btn-lg btn-block" method="post" action="/navigator">
        <input type="hidden" name="logout" value="<%="logout"%>" />
        <input style="background: white; border: none;" type='submit'value="Çıkış" />
    </form>
</div>
</body>
</html>
