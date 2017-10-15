<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" 
              rel="stylesheet" type="text/css" />
        <title>E-books | Login</title>
        <link rel="icon" href="http://icons.iconarchive.com/icons/paomedia/small-n-flat/24/book-icon.png">

        <style>

            body {
                width:100px;
                height:100px;
                background: -webkit-linear-gradient(90deg, #16222A 10%, #3A6073 90%); /* Chrome 10+, Saf5.1+ */
                background:    -moz-linear-gradient(90deg, #16222A 10%, #3A6073 90%); /* FF3.6+ */
                background:     -ms-linear-gradient(90deg, #16222A 10%, #3A6073 90%); /* IE10 */
                background:      -o-linear-gradient(90deg, #16222A 10%, #3A6073 90%); /* Opera 11.10+ */
                background:         linear-gradient(90deg, #16222A 10%, #3A6073 90%); /* W3C */
                font-family: 'Raleway', sans-serif;
            }

            p {
                color:#CCC;
            }

            .spacing {
                padding-top:7px;
                padding-bottom:7px;
            }
            .middlePage {
                width: 680px;
                height: 500px;
                position: absolute;
                top:0;
                bottom: 0;
                left: 0;
                right: 0;
                margin: auto;
            }

            .logo {
                color:#CCC;
            }    
        </style>
    </head>
    <body>
        <div class="middlePage">
            <c:if test="${error != null}">
                <div class="alert alert-danger" role="alert">
                    <p>${error}</p>
                </div>
            </c:if>
            <div class="page-header">
                <h1 class="logo">E-Books <small>Cadastro de livros</small></h1>
            </div>

            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">Login</h3>
                </div>
                <div class="panel-body">

                    <div class="row">

                        <div class="col-md-12" style="border-left:1px solid #ccc;height:160px">
                            <form class="form-horizontal" action="<c:url value="/auth/login"/>" method="post">
                                <fieldset>

                                    <input id="textinput" name="email" type="text" placeholder="Usuário" class="form-control input-md">
                                    <div class="spacing"><input type="checkbox" name="checkboxes" id="checkboxes-0" value="1"><small> Lembrar-me</small></div>
                                    <input id="textinput" name="senha" type="password" placeholder="Senha" class="form-control input-md">
                                    <div class="spacing"><a href="#"><small> Esqueceu a senha?</small></a><br/></div>
                                    <button id="singlebutton" name="singlebutton" class="btn btn-info btn-sm pull-right">Entrar</button>


                                </fieldset>
                            </form>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </body>
</html>