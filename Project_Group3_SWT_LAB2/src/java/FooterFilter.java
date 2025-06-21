
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import java.io.IOException;
import DAO.FooterDAO;

@WebFilter(urlPatterns = {"/*"})
public class FooterFilter implements Filter {

    private FooterDAO dao;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        dao = new FooterDAO();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        ServletContext context = request.getServletContext();
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String requestURI = httpRequest.getRequestURI();

        // Làm mới dữ liệu sau các thao tác quản lý footer
        if (requestURI.contains("/admin/footer-settings")
                || httpRequest.getParameter("refreshFooter") != null) {
            context.removeAttribute("companyInfo");
            context.removeAttribute("contactInfo");
            context.removeAttribute("socialLinks");
        }

        // Tải lại dữ liệu nếu chưa có
        if (context.getAttribute("companyInfo") == null) {
            context.setAttribute("companyInfo", dao.getCompanyInfo());
            context.setAttribute("contactInfo", dao.getContactInfo());
            context.setAttribute("socialLinks", dao.getSocialLinks());
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Cleanup if needed
    }
}
