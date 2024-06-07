<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Post View</title>
</head>
<body>
<h2>${post.title}</h2>
<p>${post.content}</p>
<p>작성자 : ${post.authorId}</p>

<h3>Files</h3>
<c:forEach var="file" items="${files}">
    <div>
        <img src="/file/download/${file.id}" alt="file" style="max-width: 50%; height: auto;"/>
    </div>
</c:forEach>
<c:if test="${post.authorId == currentUserId}">
<form action="/file/upload" method="post" enctype="multipart/form-data">
    <input type="hidden" name="filePostId" value="${post.id}">
    <input type="file" name="file">
    <button type="submit">Upload File</button>
</form>
 </c:if>
<h3>Comments</h3>
<c:forEach var="comment" items="${comments}">
    <div>
        <p>${comment.content}</p>
        <p>Author: ${comment.authorId}</p>
        <a href="/comment/delete/${comment.id}?postId=${post.id}">Delete</a>
    </div>
</c:forEach>

<form action="/comment/create" method="post">
    <input type="hidden" name="postId" value="${post.id}">
    <textarea name="content"></textarea>
    <button type="submit">Add Comment</button>
</form>

<c:if test="${post.authorId == currentUserId}">
     <a href="/post/edit/${post.id}">Edit</a>
     <a href="/post/delete/${post.id}">Delete</a>
 </c:if>
<a href="/post/list">Back to List</a>
</body>
</html>

