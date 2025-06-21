

import DAO.CategoryDAO;
import entity.Category;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;

@WebFilter(filterName = "HeaderCategoryFilter", urlPatterns = {"/*"})
public class HeaderCategoryFilter implements Filter {
    
    private CategoryDAO categoryDAO;
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        categoryDAO = new CategoryDAO();
    }
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        try {
            // Lấy tất cả categories
            List<Category> allCategories = categoryDAO.getAll();
            
            // Nhóm categories theo level
            Map<Integer, List<Category>> categoriesByLevel = allCategories.stream()
                    .collect(Collectors.groupingBy(Category::getLevel));
            
            // Nhóm categories level 2 theo parent ID
            Map<Integer, List<Category>> level2ByParent = allCategories.stream()
                    .filter(c -> c.getLevel() == 2)
                    .collect(Collectors.groupingBy(c -> c.getParentId() != null ? c.getParentId() : 0));
            
            // Nhóm categories level 3 theo parent ID
            Map<Integer, List<Category>> level3ByParent = allCategories.stream()
                    .filter(c -> c.getLevel() == 3)
                    .collect(Collectors.groupingBy(c -> c.getParentId() != null ? c.getParentId() : 0));
            
            // Set attributes cho request
            request.setAttribute("level1Categories", categoriesByLevel.get(1));
            request.setAttribute("level2ByParent", level2ByParent);
            request.setAttribute("level3ByParent", level3ByParent);
            
        } catch (Exception e) {
            System.out.println("Error in HeaderCategoryFilter: " + e.getMessage());
            e.printStackTrace();
        }
        
        // Tiếp tục chain
        chain.doFilter(request, response);
    }
    
    @Override
    public void destroy() {
        // Cleanup code if needed
    }
}