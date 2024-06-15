<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Post List</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">GPT Web Project</h2>
    <div class="list-group">
        <c:forEach var="post" items="${posts}">
            <div class="list-group-item mb-3">
                <h3 class="mb-1">${post.title}</h3>
                <p>${post.content}</p>
                <p class="text-muted">작성자: ${post.authorId}</p>
                <div class="d-flex justify-content-between">
                    <a href="/post/view/${post.id}" class="btn btn-info btn-sm">상세보기</a>
                    <div>
                        <c:if test="${post.authorId eq userId}">
                            <a href="/post/edit/${post.id}" class="btn btn-warning btn-sm">Edit</a>
                            <a href="/post/delete/${post.id}" class="btn btn-danger btn-sm">Delete</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="text-center mt-4">
        <a href="/post/create" class="btn btn-primary">Create New Post</a>
        <a href="/logout" class="btn btn-secondary">LogOut</a>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
