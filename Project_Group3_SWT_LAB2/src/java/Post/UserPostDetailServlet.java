package Post;

import DAO.PostDAO;
import entity.Post;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "UserPostDetailServlet", urlPatterns = {"/post"})
public class UserPostDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String idParam = request.getParameter("id");
            if (idParam == null || idParam.isEmpty()) {
                request.setAttribute("error", "Thiếu ID bài viết.");
                request.getRequestDispatcher("/postd.jsp").forward(request, response);
                return;
            }

            int postId = Integer.parseInt(idParam);
            PostDAO postDAO = new PostDAO();
            Post post = postDAO.getPostById(postId);

            if (post == null) {
                request.setAttribute("error", "Bài viết không tồn tại.");
                request.getRequestDispatcher("/postd.jsp").forward(request, response);
                return;
            }

            if (!"published".equals(post.getStatus())) {
                request.setAttribute("error", "Bài viết chưa được xuất bản.");
                request.getRequestDispatcher("/postd.jsp").forward(request, response);
                return;
            }

            List<Post> latestPosts = postDAO.getLatestPublishedPosts(5);
            latestPosts.removeIf(p -> p.getId() == postId);

            request.setAttribute("post", post);
            request.setAttribute("latestPosts", latestPosts);
            request.getRequestDispatcher("/postd.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "ID bài viết không hợp lệ.");
            request.getRequestDispatcher("/postd.jsp").forward(request, response);
        }
    }
}
