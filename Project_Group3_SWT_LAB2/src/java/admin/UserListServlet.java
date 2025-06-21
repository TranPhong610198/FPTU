package admin;

import DAO.UserDAO;
import entity.User;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/userlists")
public class UserListServlet extends HttpServlet {
    private UserDAO userDAO;
    private static final int RECORDS_PER_PAGE = 10;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy parameters từ request
            String gender = request.getParameter("gender");
            String role = request.getParameter("role");
            String status = request.getParameter("status");
            String searchTerm = request.getParameter("search");
            String sortField = request.getParameter("sortField");
            String sortDir = request.getParameter("sortDir");
            
            // Xử lý phân trang
            int page = 1;
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
            
            // Xây dựng câu query SQL cho cả filtered và export data
            StringBuilder sql = new StringBuilder("SELECT * FROM users WHERE 1=1");
            List<Object> params = new ArrayList<>();
            
            // Thêm điều kiện lọc
            if (gender != null && !gender.isEmpty()) {
                sql.append(" AND gender = ?");
                params.add(gender);
            }
            if (role != null && !role.isEmpty()) {
                sql.append(" AND role = ?");
                params.add(role);
            }
            if (status != null && !status.isEmpty()) {
                sql.append(" AND status = ?");
                params.add(status);
            }
            
            // Thêm điều kiện tìm kiếm
            if (searchTerm != null && !searchTerm.isEmpty()) {
                sql.append(" AND (full_name LIKE ? OR email LIKE ? OR mobile LIKE ?)");
                String searchPattern = "%" + searchTerm + "%";
                params.add(searchPattern);
                params.add(searchPattern);
                params.add(searchPattern);
            }
            
            // Thêm sắp xếp
            if (sortField != null && !sortField.isEmpty()) {
                sql.append(" ORDER BY ").append(sortField);
                if ("desc".equals(sortDir)) {
                    sql.append(" DESC");
                } else {
                    sql.append(" ASC");
                }
            } else {
                sql.append(" ORDER BY id ASC");
            }

            // Lưu câu SQL gốc và params cho export (không có OFFSET và FETCH)
            StringBuilder exportSql = new StringBuilder(sql);
            List<Object> exportParams = new ArrayList<>(params);

            // Thêm phân trang cho SQL hiển thị
            int offset = (page - 1) * RECORDS_PER_PAGE;
            sql.append(" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
            params.add(offset);
            params.add(RECORDS_PER_PAGE);

            // Thực hiện truy vấn cho trang hiện tại
            List<User> users = userDAO.getUsersByFilter(sql.toString(), params);
            int totalRecords = userDAO.getTotalFilteredRecords(sql.toString(), params);
            int totalPages = (int) Math.ceil(totalRecords * 1.0 / RECORDS_PER_PAGE);

            // Lấy tất cả dữ liệu đã lọc (không phân trang) cho export
            List<User> allFilteredUsers = userDAO.getUsersByFilter(exportSql.toString(), exportParams);

            // Lưu danh sách đã lọc vào session
            HttpSession session = request.getSession();
            session.setAttribute("filteredUsers", allFilteredUsers);

            // Set attributes cho JSP
            request.setAttribute("users", users);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("gender", gender);
            request.setAttribute("role", role);
            request.setAttribute("status", status);
            request.setAttribute("search", searchTerm);
            request.setAttribute("sortField", sortField);
            request.setAttribute("sortDir", sortDir);

            // Forward đến trang JSP
            request.getRequestDispatcher("/admin/userlists.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error/404.jsp");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}