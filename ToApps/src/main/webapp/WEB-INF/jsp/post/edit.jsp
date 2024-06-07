<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Item</title>
</head>
<body>
    <h2>Edit Item</h2>
    <form action="/edit" method="post">
        <input type="hidden" id="id" name="id" value="${item.id}">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="${item.name}"><br><br>
        <label for="description">Description:</label>
        <textarea id="description" name="description">${item.description}</textarea><br><br>
        <button type="submit">Save</button>
    </form>
</body>
</html>
