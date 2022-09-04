<%--
  Created by IntelliJ IDEA.
  User: andre
  Date: 04/09/2022
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>CarForum - Enter your account</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/login.css">
    <meta name="theme-color" content="#7952b3">

    <style>
        @media (min-width: 768px) {
        }
    </style>

    <link href="css/login.css" rel="stylesheet">
</head>

<body class="text-center">
<main class="form-signin">
    <form method="post" action="login">
        <img class="mb-4" src="logos/logo.png" >
        <h1 class="h3 mb-3 fw-normal">Login</h1>

        <div class="form-floating">
            <input type="text" name="email" class="form-control" id="floatingInput" placeholder="Email" value="cars@cars.com">
            <label for="floatingInput">Email</label>
        </div>
        <div class="form-floating">
            <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password" value="******">
            <label for="floatingPassword">Password</label>
        </div>

        <button class="w-100 btn btn-lg btn-warning" type="submit">Login</button>
        <br><br><br>
        <a class="w-200 btn btn-lg btn-warning" href="userregister.jsp">Don't have an account? Create one here</a>
        <p class="mt-5 mb-3 text-muted"> The most beautiful car is the one that we still have to do. </p>
    </form>
</main>
</body>
</html>
