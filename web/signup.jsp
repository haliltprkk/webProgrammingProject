<%--
  Created by IntelliJ IDEA.
  User: haliltprkk
  Date: 1.05.2020
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>BookStore</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="css/login.css" rel="stylesheet">
</head>

<body>

<header id="header">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-center"> D&R <small>Kayıt Ekranı</small></h1>
            </div>
        </div>
    </div>
</header>

<div class="container login">
    <div class="forms">
        <form method="post" action="/register">
            <div class="form-group required">
                <label class="control-label">İsim & Soyisim</label>
                <input type="text" class="form-control" placeholder="xxxx xxxx" name="name" required>
            </div>
            <div class="form-group required">
                <label class="control-label">Email Adresi</label>
                <input type="text" class="form-control" placeholder="xxx@gmail.com" name="email" required>
            </div>
            <div class="form-group required">
                <label class="control-label">Şifre</label>
                <input type="password" class="form-control" placeholder="********" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Kayıt Ol</button>
        </form>
    </div>
</div>

<footer id="footer">
    <p>Copyright İbrahim Halil TOPRAK, &copy; 2020</p>
</footer>
</body>

</html>

