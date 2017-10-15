<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" 
              rel="stylesheet" type="text/css" />
        <title>E-books | Lista</title>
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
        <h2>Lista de Livros  <a class="btn btn-primary btn-xs" href="<c:url value="/livro/novo-livro"/>">Novo Livro</a></h2>
        <br>
        <div id="content" class="col-lg-8">
            <table class="table table_list">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Título</th>
                        <th>Autor</th>                        
                        <th>Editora</th>
                        <th>Ano</th>
                        <th colspan="2">Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${livros}" var="livro">
                        <tr>
                            <td><c:out value="${livro.id}" /></td>
                            <td><c:out value="${livro.titulo}" /></td>
                            <td><c:out value="${livro.autor}" /></td>                            
                            <td><c:out value="${livro.editora}" /></td>
                            <td><c:out value="${livro.ano}" /></td>
                            <td><a href="<c:url value="/livro/editar-livro?id="/><c:out value="${livro.id }"/>">Editar</a></td>
                            <td><a href="<c:url value="/livro/excluir-livro?id="/><c:out value="${livro.id}"/>">Excluir</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>