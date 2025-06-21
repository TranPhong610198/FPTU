package admin;

import DAO.UserDAO;
import entity.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.OutputStream;
import java.util.List;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;

@WebServlet(name = "ExportToExcel", urlPatterns = {"/admin/exporttoexcel"})
public class ExportToExcel extends HttpServlet {

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

            // Set response headers
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            String fileName = "UserList.xlsx";
            response.setHeader("Content-Disposition", "attachment; filename=" + fileName);

            // Tạo workbook và sheet
            try (Workbook workbook = new XSSFWorkbook(); OutputStream out = response.getOutputStream()) {
                Sheet sheet = workbook.createSheet("User Data");

                // Tạo style cho header
                CellStyle headerStyle = workbook.createCellStyle();
                Font headerFont = workbook.createFont();
                headerFont.setBold(true);
                headerStyle.setFont(headerFont);

                // Tạo header
                String[] headers = {
                    "ID", "Username", "Email", "Full Name", "Gender",
                    "Mobile", "Role", "Status", "Created At", "Updated At"
                };

                Row headerRow = sheet.createRow(0);
                for (int i = 0; i < headers.length; i++) {
                    headerRow.createCell(i).setCellValue(headers[i]);
                    headerRow.getCell(i).setCellStyle(headerStyle);
                }

                // Fill data
                int rowNum = 1;
                for (User user : userList) {
                    Row row = sheet.createRow(rowNum++);
                    
                    row.createCell(0).setCellValue(user.getId());
                    row.createCell(1).setCellValue(user.getUsername());
                    row.createCell(2).setCellValue(user.getEmail());
                    row.createCell(3).setCellValue(user.getFullName());
                    row.createCell(4).setCellValue(user.getGender());
                    row.createCell(5).setCellValue(user.getMobile());
                    row.createCell(6).setCellValue(user.getRole());
                    row.createCell(7).setCellValue(user.getStatus());
                    row.createCell(8).setCellValue(user.getCreatedAt());
                    row.createCell(9).setCellValue(user.getUpdatedAt());
                }

                // Auto-size columns
                for (int i = 0; i < headers.length; i++) {
                    sheet.autoSizeColumn(i);
                }

                // Thêm filter cho các cột
                sheet.setAutoFilter(org.apache.poi.ss.util.CellRangeAddress.valueOf("A1:J1"));

                workbook.write(out);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error exporting data to Excel: " + e.getMessage());
        }
    }
}