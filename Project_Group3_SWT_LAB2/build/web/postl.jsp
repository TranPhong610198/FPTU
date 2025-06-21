<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Blog Posts</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
            }
            
            .post-card {
                height: 100%;
                transition: transform 0.3s;
                border: none;
                box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            }
            
            .post-card:hover {
                transform: translateY(-5px);
            }
            
            .post-image {
                height: 200px;
                object-fit: cover;
            }
            
            .post-meta {
                font-size: 0.9rem;
                color: #6c757d;
            }
            
            .post-summary {
                font-size: 0.95rem;
                color: #495057;
                display: -webkit-box;
                -webkit-line-clamp: 3;
                -webkit-box-orient: vertical;
                overflow: hidden;
            }
            
            .latest-post-card {
                transition: background-color 0.3s;
            }
            
            .latest-post-card:hover {
                background-color: #f8f9fa;
            }
            
            .latest-post-image {
                width: 80px;
                height: 80px;
                object-fit: cover;
            }
            
            .search-box {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(10px);
                border-radius: 10px;
                padding: 20px;
                margin-bottom: 30px;
                box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            }
            
            .pagination .page-link {
                color: #0d6efd;
                border: none;
                margin: 0 3px;
                border-radius: 5px;
            }
            
            .pagination .page-item.active .page-link {
                background-color: #0d6efd;
                color: white;
            }
        </style>
    </head>
    <body>
        <!-- Include the header -->
        <jsp:include page="/header.jsp" />
        
        <div class="container py-5">
            <!-- Search Section -->
            <div class="search-box mb-4">
                <form method="get" action="${pageContext.request.contextPath}/posts" class="row g-3 align-items-center">
                    <div class="col-md-10">
                        <div class="input-group">
                            <span class="input-group-text bg-white">
                                <i class="fas fa-search text-muted"></i>
                            </span>
                            <input type="text" name="search" class="form-control" 
                                   placeholder="Nhập tiêu đề..." value="${search}">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <button type="submit" class="btn btn-primary w-100">Tìm kiếm</button>
                    </div>
                </form>
            </div>

            <div class="row">
                <!-- Main Content -->
                <div class="col-lg-8">
                    <h2 class="mb-4">Các bài đăng</h2>
                    
                    <div class="row g-4">
                        <c:choose>
                            <c:when test="${not empty posts}">
                                <c:forEach var="post" items="${posts}">
                                    <div class="col-md-6">
                                        <div class="card post-card h-100">
                                            <a href="${pageContext.request.contextPath}/post?id=${post.getId()}" 
                                               class="text-decoration-none">
                                                <img src="${post.getThumbnail()}" 
                                                     class="card-img-top post-image" alt="${post.getTitle()}">
                                                <div class="card-body">
                                                    <h5 class="card-title text-dark">
                                                        ${post.getTitle()}
                                                        <c:if test="${post.isIsFeatured()}">
                                                            <span class="badge bg-warning ms-2"><i class="fas fa-star me-1"></i>Nổi bật</span>
                                                        </c:if>
                                                    </h5>
                                                    <p class="post-summary">${post.getSummary()}</p>
                                                    <div class="post-meta mt-3">
                                                        <i class="fas fa-user-edit me-2"></i>${post.getUser().getFullName()}
                                                        <br>
                                                        <i class="far fa-clock me-2"></i>
                                                        <c:choose>
                                                            <c:when test="${post.getUpdatedAt() != null}">
                                                                Cập nhật: ${post.getUpdatedAt()}
                                                            </c:when>
                                                            <c:otherwise>
                                                                Ngày đăng: ${post.getCreatedAt()}
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="col-12 text-center py-5">
                                    <i class="fas fa-search fa-3x mb-3 text-muted"></i>
                                    <p class="text-muted">Không tìm thấy bài đăng nào. Hãy thử các tiêu đề tìm kiếm khác.</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- Pagination -->
                    <nav class="mt-5">
                        <ul class="pagination justify-content-center">
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="${pageContext.request.contextPath}/posts?page=${currentPage-1}&search=${search}">
                                        <i class="fas fa-chevron-left"></i>
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <li class="page-item ${i == currentPage ? 'active' : ''}">
                                    <a class="page-link" href="${pageContext.request.contextPath}/posts?page=${i}&search=${search}">${i}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${currentPage < totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="${pageContext.request.contextPath}/posts?page=${currentPage+1}&search=${search}">
                                        <i class="fas fa-chevron-right"></i>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>

                <!-- Sidebar -->
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-header bg-white">
                            <h5 class="mb-0"><i class="fas fa-newspaper me-2"></i>Bài đăng mới nhất</h5>
                        </div>
                        <div class="card-body p-0">
                            <c:forEach var="post" items="${latestPosts}">
                                <a href="${pageContext.request.contextPath}/post?id=${post.getId()}" 
                                   class="text-decoration-none">
                                    <div class="latest-post-card p-3 border-bottom">
                                        <div class="d-flex">
                                            <img src="${post.getThumbnail()}" 
                                                 class="latest-post-image rounded" alt="${post.getTitle()}">
                                            <div class="ms-3">
                                                <h6 class="text-dark mb-1">
                                                    ${post.getTitle()}
                                                    <c:if test="${post.isIsFeatured()}">
                                                        <i class="fas fa-star text-warning ms-1" title="Nổi bật"></i>
                                                    </c:if>
                                                </h6>
                                                <small class="text-muted">
                                                    <c:choose>
                                                        <c:when test="${post.getUpdatedAt() != null}">
                                                            <i class="far fa-edit me-1"></i>${post.getUpdatedAt()}
                                                        </c:when>
                                                        <c:otherwise>
                                                            <i class="far fa-calendar me-1"></i>${post.getCreatedAt()}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </small>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Include the footer -->
        <jsp:include page="/footer.jsp" />

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>