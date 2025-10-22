package Controller0;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Service0.Service;

/**
 * Servlet implementation class EnforceController
 */
@WebServlet("/enforce.do") // 👉 JSP에서 form action="enforce.do" 와 연결
public class EnforceController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public EnforceController() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        int type = Integer.parseInt(request.getParameter("type"));
        int choice = Integer.parseInt(request.getParameter("choice"));

        Service service = new Service();
        boolean success = service.enforceItem(name, type, choice);

        request.setAttribute("swordName", name);
        request.setAttribute("success", success);

        // 결과 JSP로 포워딩
        request.getRequestDispatcher("equipment/equipment_enforceResult.jsp").forward(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

}
