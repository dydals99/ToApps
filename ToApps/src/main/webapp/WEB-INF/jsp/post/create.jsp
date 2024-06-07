<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Item</title>
</head>
<body>
    <h2>Create Item</h2>
    <form action="/post/create" method="post">
    	<label for="authorId">authorId:</label>
    	<input id="authorId" name="authorId" value="${userId}"/><br><br>
        <label for="title">title:</label>
        <input id="title" name="title"/><br><br>
        <label for="content">content:</label>
        <textarea id="content" name="content"></textarea><br><br>
        <button type="submit">Create</button>
    </form>
</body>

</html>
