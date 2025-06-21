package admin;

import DAO.FooterDAO;
import entity.Footer;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "FooterSettingsListServlet", urlPatterns = {"/admin/footer-settings"})
public class FooterSettingListServlet extends HttpServlet {

    private static final int DEFAULT_PAGE_SIZE = 10; // Số lượng bản ghi trên mỗi trang

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FooterDAO dao = new FooterDAO();

        // Lấy các tham số tìm kiếm và sắp xếp
        String searchValue = request.getParameter("search");
        String statusFilter = request.getParameter("status");
        String sortColumn = request.getParameter("sort");
        String sortOrder = request.getParameter("order");

        // Lấy tham số phân trang
        int page = 1;
        try {
            String pageParam = request.getParameter("page");
            if (pageParam != null && !pageParam.isEmpty()) {
                page = Integer.parseInt(pageParam);
                if (page < 1) {
                    page = 1;
                }
            }
        } catch (NumberFormatException e) {
            page = 1;
        }

        // Default sorting
        if (sortColumn == null || sortColumn.trim().isEmpty()) {
            sortColumn = "id";
        }
        if (sortOrder == null || sortOrder.trim().isEmpty()) {
            sortOrder = "ASC";
        }

        // Đếm tổng số bản ghi để tính toán phân trang
        int totalRecords = dao.countTotalFooters(searchValue, statusFilter);
        int totalPages = (int) Math.ceil((double) totalRecords / DEFAULT_PAGE_SIZE);

        // Lấy danh sách footer đã phân trang
        List<Footer> footers = dao.getPaginatedFooters(searchValue, statusFilter, sortColumn, sortOrder, page, DEFAULT_PAGE_SIZE);

        // Đặt các thuộc tính vào request
        request.setAttribute("footers", footers);
        request.setAttribute("searchValue", searchValue);
        request.setAttribute("statusFilter", statusFilter);
        request.setAttribute("sortColumn", sortColumn);
        request.setAttribute("sortOrder", sortOrder);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageSize", DEFAULT_PAGE_SIZE);

        request.getRequestDispatcher("/admin/footersettinglist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));

        if ("deleteFooter".equals(action)) {
            FooterDAO dao = new FooterDAO();
            dao.deleteFooter(id);

            // Redirect với các tham số tìm kiếm
            redirectWithParams(request, response);
        }
    }

    // Tách logic redirect để tái sử dụng
    private void redirectWithParams(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        // Giữ lại các tham số tìm kiếm, sắp xếp và phân trang khi chuyển hướng
        String searchValue = request.getParameter("search");
        String statusFilter = request.getParameter("status");
        String sortColumn = request.getParameter("sort");
        String sortOrder = request.getParameter("order");
        String page = request.getParameter("page");

        StringBuilder redirectUrl = new StringBuilder(request.getContextPath() + "/admin/footer-settings?");
        if (searchValue != null && !searchValue.isEmpty()) {
            redirectUrl.append("search=").append(searchValue).append("&");
        }
        if (statusFilter != null && !statusFilter.isEmpty()) {
            redirectUrl.append("status=").append(statusFilter).append("&");
        }
        if (sortColumn != null && !sortColumn.isEmpty()) {
            redirectUrl.append("sort=").append(sortColumn).append("&");
        }
        if (sortOrder != null && !sortOrder.isEmpty()) {
            redirectUrl.append("order=").append(sortOrder).append("&");
        }
        if (page != null && !page.isEmpty()) {
            redirectUrl.append("page=").append(page);
        }

        response.sendRedirect(redirectUrl.toString());
    }
}