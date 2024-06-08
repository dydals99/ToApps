<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Post View</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">${post.title}</h2>
    <div class="row">
        <!-- Content -->
        <div class="col-md-6">
            <h3>Content</h3>
            <p>${post.content}</p>
            <p class="text-muted">작성자 : ${post.authorId}</p>
        </div>
        <!-- Comments -->
        <div class="col-md-6">
            <h3>Comments</h3>
            <div class="list-group mb-4">
                <c:forEach var="comment" items="${comments}">
                    <div class="list-group-item">
                        <p>${comment.content}</p>
                        <p class="text-muted">작성자 : ${comment.authorId}</p>
                        <c:if test="${post.authorId == userId}">
                        	<a href="/comment/delete/${comment.id}?postId=${post.id}" class="btn btn-danger btn-sm">Delete</a>
                    	</c:if>
                    </div>
                </c:forEach>
            </div>

            <form action="/comment/create" method="post" class="mb-4">
                <input type="hidden" name="postId" value="${post.id}">
                <div class="form-group">
                    <textarea name="content" class="form-control" rows="3"></textarea>
                </div>
                <button type="submit" class="btn btn-success">Add Comment</button>
            </form>
        </div>
    </div>

    <h3>Files</h3>
    <div class="row">
        <c:forEach var="file" items="${files}" varStatus="status">
            <div class="col-md-6 mb-3">
                <a href="#" data-toggle="modal" data-target="#fileModal${status.index}">
                    <img src="/file/download/${file.id}" class="img-fluid" alt="file" />
                </a>
            </div>
            <c:if test="${status.index % 2 == 1}"></c:if>
            <!-- Modal -->
            <div class="modal fade" id="fileModal${status.index}" tabindex="-1" role="dialog"
                aria-labelledby="fileModalLabel${status.index}" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="fileModalLabel${status.index}">파일 보기</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <img src="/file/download/${file.id}" class="img-fluid" alt="file" />
                            <div class="mt-3">
                                <a href="/file/download/${file.id}" class="btn btn-primary" download>
                                    <i class="fas fa-download"></i> Download
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <c:if test="${post.authorId eq userId}">
        <form id="uploadForm" action="/file/upload" method="post" enctype="multipart/form-data" class="mb-4">
            <input type="hidden" name="filePostId" value="${post.id}">
            <div class="form-group">
                <input id="fileInput" type="file" name="file" class="form-control-file">
            </div>
            <button type="button" onclick="uploadFile()" class="btn btn-primary">Upload File</button>
        	
        </form>
    </c:if>
	<a href="/post/list" class="btn btn-secondary">Back to List</a>
    <c:if test="${post.authorId == userId}">
        <a href="/post/edit/${post.id}" class="btn btn-warning">Edit</a>
        <a href="/post/delete/${post.id}" class="btn btn-danger">Delete</a>
    </c:if>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
	function uploadFile() {
		var fileInput = document.getElementById('fileInput');
		if (fileInput.files.length === 0) {
			alert('파일을 선택하세요!');
			return;
		}
		document.getElementById('uploadForm').submit();
	}
</script>
</body>
</html>
