package admin;

import entity.User;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@WebServlet(name = "ExportToPDF", urlPatterns = {"/admin/exporttopdf"})
public class ExportToPDF extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            @SuppressWarnings("unchecked")
            List<User> userList = (List<User>) session.getAttribute("filteredUsers");

            if (userList == null || userList.isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "No data available for export");
                return;
            }

            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=UserList.pdf");

            try (OutputStream out = response.getOutputStream()) {
                Document document = new Document(PageSize.A4.rotate());
                PdfWriter.getInstance(document, out);
                document.open();

                // Sử dụng font Unicode để tránh lỗi tiếng Việt
                BaseFont unicodeFont = BaseFont.createFont("C:/Windows/Fonts/times.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
                Font titleFont = new Font(unicodeFont, 18, Font.BOLD);
                Font headerFont = new Font(unicodeFont, 12, Font.BOLD);
                Font cellFont = new Font(unicodeFont, 12, Font.NORMAL);

                // Tiêu đề
                Paragraph title = new Paragraph("Danh sách người dùng\n\n", titleFont);
                title.setAlignment(Element.ALIGN_CENTER);
                document.add(title);

                // Tạo bảng với số cột
                String[] headers = {
                    "ID", "Username", "Email", "Full Name", "Gender",
                    "Mobile", "Role", "Status", "Created At", "Updated At"
                };

                PdfPTable table = new PdfPTable(headers.length);
                table.setWidthPercentage(100);
                table.setSpacingBefore(10f);
                table.setSpacingAfter(10f);

                // Header của bảng
                for (String header : headers) {
                    PdfPCell cell = new PdfPCell(new Phrase(header, headerFont));
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
                    table.addCell(cell);
                }

                // Thêm dữ liệu từ danh sách đã lọc
                for (User user : userList) {
                    table.addCell(new PdfPCell(new Phrase(String.valueOf(user.getId()), cellFont)));
                    table.addCell(new PdfPCell(new Phrase(user.getUsername(), cellFont)));
                    table.addCell(new PdfPCell(new Phrase(user.getEmail(), cellFont)));
                    table.addCell(new PdfPCell(new Phrase(user.getFullName(), cellFont)));
                    table.addCell(new PdfPCell(new Phrase(user.getGender(), cellFont)));
                    table.addCell(new PdfPCell(new Phrase(user.getMobile(), cellFont)));
                    table.addCell(new PdfPCell(new Phrase(user.getRole(), cellFont)));
                    table.addCell(new PdfPCell(new Phrase(user.getStatus(), cellFont)));
                    table.addCell(new PdfPCell(new Phrase(user.getCreatedAt(), cellFont)));
                    table.addCell(new PdfPCell(new Phrase(user.getUpdatedAt(), cellFont)));
                }

                document.add(table);
                document.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error exporting data to PDF: " + e.getMessage());
        }
    }
}
