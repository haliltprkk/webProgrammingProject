<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="tr" >
<head>
    <title>BookStore</title>
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
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
            <li><a href="<%=request.getContextPath()%>/list-books"
                   class="nav-link">Ürünler</a></li>
        </ul>
    </nav>
</header>
<br>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <c:if test="${user != null}">
            <form action="/update-books" method="post">
                </c:if>
                <c:if test="${user == null}">
                <form action="/insert-books" method="post">
                    </c:if>

                    <caption>
                        <h2>
                            <c:if test="${user != null}">
                                Düzenle
                            </c:if>
                            <c:if test="${user == null}">
                               Yeni Sipariş Ekle
                            </c:if>
                        </h2>
                    </caption>

                    <c:if test="${user != null}">
                        <input type="hidden" name="id" value="<c:out value='${user.id}' />" />
                    </c:if>

                    <fieldset class="form-group">
                        <label>Title</label> <input type="text"
                                                        value="<c:out value='${user.title}' />" class="form-control"
                                                        name="title" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Resim</label> <input type="text"
                                                         value="<c:out value='${user.image}' />" class="form-control"
                                                         name="image">
                    </fieldset>
                        <fieldset class="form-group">
                            <label>Açıklama</label> <input type="text"
                                                        value="<c:out value='${user.description}' />" class="form-control"
                                                        name="description">
                        </fieldset>
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Fiyat</label> <input type="text"
                                                           value="<c:out value='${user.price}' />" class="form-control"
                                                           name="price">
                        </fieldset>

                    <button type="submit" class="btn btn-success">Kaydet</button>
                </form>
        </div>
    </div>
</div>
</body>
</html>