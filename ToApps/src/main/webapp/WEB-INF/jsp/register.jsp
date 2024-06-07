<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
</head>
<body>
    <h2>회원가입</h2>
    <form:form method="post" action="/register" modelAttribute="user">
        <table>
            <tr>
                <td>아이디:</td>
                <td><form:input path="id" /></td>
            </tr>
            <tr>
                <td>비밀번호:</td>
                <td><form:password path="password" /></td>
            </tr>
            <tr>
                <td>이름:</td>
                <td><form:input path="name" /></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="회원가입" /></td>
            </tr>
        </table>
    </form:form>
</body>
</html>
