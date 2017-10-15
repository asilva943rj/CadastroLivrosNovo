<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" 
              rel="stylesheet" type="text/css" />
        <title>E-books</title>
        <link rel="icon" href="http://icons.iconarchive.com/icons/paomedia/small-n-flat/24/book-icon.png">

    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="<c:url value="/"/>">E-Books</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="<c:url value="/"/>">Home</a></li>
                    <li><a href="<c:url value="/livro/novo-livro"/>">Novo livro</a></li>
                    <li><a href="<c:url value="/livro/listar-livro"/>">Listar livros</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="<c:url value="/auth/logout"/>"><span class="glyphicon glyphicon-log-out"></span> Sair</a></li>
                </ul>

            </div>
        </nav>
        <div class="container">
            <p>Bem-vindo, <c:out value="${usuario.nome}"/></p> 
        </div>
    </body>
</html>