<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${post.title} - Chi tiết bài đăng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body>
    <!-- Include the header -->
    <jsp:include page="header.jsp" />

    <div class="container py-4">
        <!-- Hộp tìm kiếm bài đăng -->
        <div class="search-box bg-white p-3 rounded shadow-sm mb-4">
            <form method="get" action="${pageContext.request.contextPath}/posts" class="row g-3">
                <div class="col-md-10">
                    <div class="input-group">
                        <span class="input-group-text bg-white"><i class="fas fa-search text-muted"></i></span>
                        <input type="text" name="search" class="form-control" placeholder="Tìm kiếm bài viết..." value="${param.search}">
                    </div>
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-primary w-100"><i class="fas fa-search me-2"></i>Tìm kiếm</button>
                </div>
            </form>
        </div>

                    
        <!-- Hiển thị bài viết -->
        <div class="col-lg-12">
            <c:choose>
                <c:when test="${not empty error}">
                    <div class="alert alert-danger">${error}</div>
                </c:when>
                <c:when test="${not empty post}">
                    <article class="bg-white p-4 rounded shadow-sm">
                        <h1 class="mb-3">
                            ${post.title}
                            <c:if test="${post.isIsFeatured()}">
                                <span class="badge bg-warning ms-2"><i class="fas fa-star me-1"></i>Nổi bật</span>
                            </c:if>
                        </h1>
                        <div class="text-muted mb-3">
                            <i class="fas fa-user me-2"></i><strong>Tác giả:</strong> ${post.user.fullName} &nbsp; | &nbsp;
                                <c:choose>
                                    <c:when test="${post.updatedAt != null}">
                                    <i class="fas fa-edit me-2"></i><strong>Cập nhật:</strong> ${post.updatedAt}
                                    </c:when>
                                    <c:otherwise>
                                    <i class="fas fa-calendar me-2"></i><strong>Ngày đăng:</strong> ${post.createdAt}
                                    </c:otherwise>
                                </c:choose>
                        </div>
                        <hr>                      
                        <div class="text-center">
                            <img src="${post.getThumbnail()}" alt="${post.title}" class="img-fluid rounded mb-4">
                        </div>
                        <div class="content">${post.content}</div>
                    </article>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-warning">Không có dữ liệu để hiển thị.</div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!-- Include the footer -->
    <jsp:include page="footer.jsp" />

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
