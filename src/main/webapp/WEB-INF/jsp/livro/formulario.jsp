<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" 
              rel="stylesheet" type="text/css" />
        <title>E-books | Novo Livro</title>
        <link rel="icon" href="http://icons.iconarchive.com/icons/paomedia/small-n-flat/24/book-icon.png">

    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="<c:url value="/auth/login"/>">E-Books</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="<c:url value="/auth/login"/>">Home</a></li>
                    <li><a href="novo-livro">Novo livro</a></li>
                    <li><a href="listar-livro">Listar livros</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="<c:url value="/auth/logout"/>"><span class="glyphicon glyphicon-log-out"></span> Sair</a></li>
                </ul>

            </div>
        </nav>
        <div class="container">
            <div id="content" class="col-lg-6 col-lg-offset-3">
                <h2>Cadastrar Livro</h2>
                <form action="salvar-livro" method="post">
                    <div style="visibility:hidden">
                        <label for="id">ID</label> <input type="text"
                                                          name="id" value="<c:out value="${livro.id}" />"
                                                          readonly="readonly" placeholder="ID" />
                    </div>
                    
                    <div>
                        <label form="titulo">Título:</label> <input class="form-control" type="text"
                                                                 name="titulo" value="<c:out value="${livro.titulo}" />"
                                                                 placeholder="Título" />
                    </div>
                    
                    <div>    
                        <label form="email">Autor:</label> <input class="form-control" type="text"
                                                                 name="autor" value="<c:out value="${livro.autor}" />"
                                                                 placeholder="Autor" />
                    </div>                    
                    
                    <div>    
                        <label form="editora">Editora</label> <input class="form-control" type="text" name="editora"
                                                                    value="<c:out value="${livro.editora}" />" placeholder="Editora" />
                    </div>
                    
                    <div>    
                        <label form="ano">Ano:</label> <input class="form-control" type="number"
                                                                 name="ano" value="<c:out value="${livro.ano}" />"
                                                                 placeholder="Ano" />
                    </div>
                    <div style="float:right"><br> 
                        <input class="btn btn-success" type="submit" value="Salvar" />
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>