<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Post List</title>
</head>
<body>
<h2>Post List</h2>
<c:set var="currentUserId" value="${sessionScope.currentUserId}" />

<c:forEach var="post" items="${posts}">
    <div>
        <h3>${post.title}</h3>
        <p>${post.content}</p>
        <p>작성자: ${post.authorId}</p>
        <c:if test="${post.authorId == currentUserId}">
            <a href="/post/edit/${post.id}">Edit</a>
            <a href="/post/delete/${post.id}">Delete</a>
        </c:if>
        <a href="/post/view/${post.id}">상세보기</a>
    </div>
</c:forEach>
<a href="/post/create">Create New Post</a> 
</body>
</html>
