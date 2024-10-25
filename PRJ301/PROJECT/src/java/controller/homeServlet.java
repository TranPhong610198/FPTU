/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Product;
import model.User;

/**
 *
 * @author tphon
 */
@WebServlet(name = "homeServlet", urlPatterns = {"/home"})
public class homeServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet homeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet homeServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //CHỨC NĂNG TỰ ĐĂNG NHẬP
        // Kiểm tra cookie khi người dùng quay lại
        Cookie[] cookies = request.getCookies();
        String username = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("username".equals(cookie.getName())) {
                    username = cookie.getValue();
                    break;
                }
            }
        }
        // Nếu có cookie username, tự động đăng nhập
        if (username != null) {
            UserDAO userDao = new UserDAO();
            User user = userDao.getUserByName(username);  // Lấy thông tin user từ username
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("account", user);  // Đặt user vào session
            }
        }
        //_____________________________________________________________________________
        String action = request.getParameter("action");
        if ("view".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("id"));
            ProductDAO pd = new ProductDAO();
            Product product = pd.getProductByID(productId);

            List<String> subImages = pd.getSubImagesByProductId(productId);
            List<Product> samelist = pd.getSameProducts(product.getCategoryId());
            request.setAttribute("product", product);
            request.setAttribute("subImages", subImages);
            request.setAttribute("samelist", samelist);
            request.getRequestDispatcher("getDetail.jsp").forward(request, response);

        } else {

            // Xử lý logic khác cho trang home
            ProductDAO pd = new ProductDAO();
            List<Product> list = pd.getAllProducts();
            Product temp = list.get(0);
            request.setAttribute("data", list);
            request.setAttribute("product", temp);
            request.getRequestDispatcher("home.jsp").forward(request, response);
//            request.getRequestDispatcher("header.jsp").forward(request, response);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
