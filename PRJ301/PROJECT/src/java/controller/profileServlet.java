/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.User;

/**
 *
 * @author tphon
 */
@WebServlet(name = "profileServlet", urlPatterns = {"/profile"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class profileServlet extends HttpServlet {

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
            out.println("<title>Servlet profileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet profileServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
//        processRequest(request, response);
        UserDAO ud = new UserDAO();
        String id_raw = request.getParameter("id");
        int id = -1;
        try {
            id = Integer.parseInt(id_raw);
        } catch (Exception e) {
            System.out.println(e);
        }
        //THỰC HIỆN THAY ĐỔI ẢNH
        String checkupAvt_raw = request.getParameter("checkUpAvt");
        boolean checkupAvt = (checkupAvt_raw != null && !checkupAvt_raw.isEmpty());
        if (checkupAvt) {
            // Kiểm tra xem có file ảnh được tải lên hay không
            Part filePart = request.getPart("image");
            String fileName = filePart.getSubmittedFileName();
            String imageUrl;
            String uploadPath = "D:/CODING/FPTU/PRJ301/PROJECT/web/";
            if (fileName != null && !fileName.isEmpty()) {
                String oldAvtUrl = request.getParameter("oldAvtUrl");
                // Nếu có ảnh mới, xóa ảnh cũ và lưu ảnh mới
                // Xóa ảnh cũ
                File oldImageFile = new File(uploadPath + File.separator + oldAvtUrl);
                if (oldImageFile.exists()) {
                    oldImageFile.delete();
                }
                // Tạo tên mới cho ảnh
                String newFileName = UUID.randomUUID().toString() + fileName;
                imageUrl = "imagesDB/" + newFileName; // URL của ảnh mới
                // Lưu ảnh mới vào thư mục
                filePart.write(uploadPath + File.separator + imageUrl);
                ud.updateAvt(imageUrl, id);
            }
        }
        //__________________________________________________________________________________
        //THỰC HIỆN THAY ĐỔI MK
        String checkupPass_raw = request.getParameter("checkUpPass");
        boolean checkupPass = (checkupPass_raw != null && !checkupPass_raw.isEmpty());
        if (checkupPass) {
            boolean check = true;
            String errCf = "", errPass = "", success = "";
            String username = request.getParameter("username");
            String curPass = request.getParameter("curPass");
            String newPass = request.getParameter("newPass");
            String cfPass = request.getParameter("cfPass");
            User temp = ud.login(username, curPass);
            if (!newPass.equals(cfPass)) {
                errCf = "The confirm password is not matched!!!";
                check = false;
            }
            if (temp == null) {
                errPass = "Wrong password!!!";
                check = false;
            }
            if (check) {
                ud.resetPassword(id, newPass);
                success = "Change password successfull";
            }
            request.setAttribute("errCf", errCf);
            request.setAttribute("errPass", errPass);
            request.setAttribute("success", success);
//            response.sendRedirect("home");
        }
        //__________________________________________________________________________________
        //THỰC HIỆN THAY ĐỔI THÔNG TIN
        String checkupInfo_raw = request.getParameter("checkupInfo");
        boolean checkupInfo = (checkupInfo_raw != null && !checkupInfo_raw.isEmpty());
        if (checkupInfo) {
            boolean check = true;
            String errPhone = "", errName = "", errEmail = "", success = "";
            String email = request.getParameter("email");
            String name = request.getParameter("username");
            String phone = request.getParameter("phone");
            String province = request.getParameter("province");
            String district = request.getParameter("district");
            String ward = request.getParameter("ward");
            String address = ward + "-" + district + "-" + province;
            if (!isValidPhoneNumber(phone)) {
                errPhone = "Phone Error!!!";
                check = false;
            }
            List<User> allUser = ud.getAll();
            for (User temp : allUser) {
                if (temp.getEmail().equals(email) && temp.getId() != id) {
                    errEmail = "The email was existed!!!";
                    check = false;
                }
                if (temp.getUsername().equals(name) && temp.getId() != id) {
                    errName = "The username was existed!!!";
                    check = false;
                }
            }
            if (check) {
                ud.updateUser(email, phone, address, id, name);
                success = "Change information successful!!!";
            }
            request.setAttribute("errPhone", errPhone);
            request.setAttribute("errName", errName);
            request.setAttribute("errEmail", errEmail);
            request.setAttribute("successInfo", success);
//            response.sendRedirect("home");
        }
        //__________________________________________________________________________________
        // CHỨC NĂNG HIỂN THỊ
        User temp = ud.getUserById(id);
        if (temp.getAddress() != null && !temp.getAddress().isEmpty()) {
            String[] address = splitAddress(temp.getAddress());
            request.setAttribute("provinceUser", address[2]);
            request.setAttribute("districtUser", address[1]);
            request.setAttribute("wardUser", address[0]);
        }
        request.setAttribute("user", temp);

        request.getRequestDispatcher("profile.jsp").forward(request, response);
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
    // Phương thức để kiểm tra số điện thoại có đúng định dạng hay không

    public static boolean isValidPhoneNumber(String phoneNumber) {
        // Biểu thức chính quy để kiểm tra số điện thoại
        String phoneRegex = "^(\\d{10}|\\d{3}[- .]\\d{3}[- .]\\d{4})$";

        // Tạo đối tượng Pattern từ regex
        Pattern pattern = Pattern.compile(phoneRegex);

        // Nếu số điện thoại là null, trả về false
        if (phoneNumber == null) {
            return false;
        }

        // So khớp số điện thoại với biểu thức chính quy
        Matcher matcher = pattern.matcher(phoneNumber);
        return matcher.matches();
    }

    public static String[] splitAddress(String address) {
        // Tách chuỗi bằng dấu " - "
        String[] parts = address.split("-");

        // Kiểm tra xem chuỗi có đúng định dạng không
        if (parts.length == 3) {
            String xa = parts[0].trim();    // Xã
            String huyen = parts[1].trim(); // Huyện
            String tinh = parts[2].trim();  // Tỉnh
            return new String[]{xa, huyen, tinh};
        } else {
            // Trường hợp chuỗi không đúng định dạng
            throw new IllegalArgumentException("Chuỗi nhập không đúng định dạng Xã - Huyện - Tỉnh");
        }
    }
}
