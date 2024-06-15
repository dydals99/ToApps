<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Register</h2>
        <form:form method="post" action="/register" modelAttribute="user" class="w-50 mx-auto">
            <div class="form-group">
                <label for="id">ID:</label>
                <form:input path="id" id="id" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <form:password path="password" id="password" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="name">Name:</label>
                <form:input path="name" id="name" class="form-control"/>
            </div>
            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary">Register</button>
            </div>
        </form:form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
