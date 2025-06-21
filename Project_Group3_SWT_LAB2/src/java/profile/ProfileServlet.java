/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package profile;

import java.io.IOException;
import java.io.PrintWriter;
import DAO.UserDAO;
import entity.User;
import entity.UserAddress;
import java.io.File;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.util.UUID;

/**
 *
 * @author thanh
 */
@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
public class ProfileServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads/avatars";
    private static final Logger LOGGER = Logger.getLogger(ProfileServlet.class.getName());

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
            out.println("<title>Servlet ProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        UserDAO userDAO = new UserDAO();
        request.setAttribute("user", userDAO.getUserById(user.getId()));
        request.setAttribute("addresses", userDAO.getUserAddresses(user.getId()));
        request.getRequestDispatcher("profile.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect("profile");
            return;
        }

        UserDAO userDAO = new UserDAO();

        if (action.equals("update_profile")) {
            user.setFullName(request.getParameter("fullName"));
            user.setGender(request.getParameter("gender"));
            user.setMobile(request.getParameter("mobile"));
            if (userDAO.updateProfile(user)) {
                session.setAttribute("acc", user);
            }
        } else if (action.equals("update_avatar")) {
            Part filePart = request.getPart("avatar");

            if (filePart != null && filePart.getSize() > 0) {
                String fileName = extractFileExtension(filePart); // Lấy đuôi file
                String newFileName = UUID.randomUUID().toString() + fileName; // Tạo tên mới

                String uploadPath = getServletContext().getRealPath("/") + File.separator + UPLOAD_DIR;
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                // Xóa ảnh cũ nếu có
                if (user.getAvatar() != null && !user.getAvatar().isEmpty()) {
                    File oldFile = new File(getServletContext().getRealPath("/") + File.separator + user.getAvatar());
                    if (oldFile.exists()) {
                        oldFile.delete();
                    }
                }

                // Lưu ảnh mới vào thư mục
                String filePath = uploadPath + File.separator + newFileName;
                try {
                    filePart.write(filePath);

                    // Lưu đường dẫn vào database
                    String dbPath = UPLOAD_DIR + "/" + newFileName;
                    if (userDAO.updateAvatar(user.getId(), dbPath)) {
                        user.setAvatar(dbPath);
                        session.setAttribute("acc", user);
                    }
                } catch (IOException e) {
                    LOGGER.log(Level.SEVERE, "Error uploading avatar", e);
                }
            }
//thêm address
        } else if (action.equals("add")) {
            UserAddress newAddress = new UserAddress();
            newAddress.setUserId(user.getId());
            newAddress.setRecipientName(request.getParameter("recipient_name"));
            newAddress.setPhone(request.getParameter("phone"));
            newAddress.setAddress(request.getParameter("address"));
            newAddress.setDefault(request.getParameter("is_default") != null);
            userDAO.addUserAddress(newAddress);
            // xóa address
        } else if (action.equals("delete")) {
            int addressId = Integer.parseInt(request.getParameter("address_id"));
            userDAO.deleteUserAddress(addressId, user.getId());
        }
        // set mặc định hay không
        if (action.equals("set_default")) {
            int addressId = Integer.parseInt(request.getParameter("address_id"));
            userDAO.setDefaultAddress(addressId, user.getId());
        } else if (action.equals("unset_default")) {
            int addressId = Integer.parseInt(request.getParameter("address_id"));
            userDAO.unsetDefaultAddress(user.getId(), addressId);
        }

        response.sendRedirect("profile");
    }
    
    private String extractFileExtension(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String s : contentDisp.split(";")) {
            if (s.trim().startsWith("filename")) {
                String fileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                return fileName.substring(fileName.lastIndexOf("."));
            }
        }
        return ".jpg"; // Nếu không tìm thấy, mặc định là .jpg
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
