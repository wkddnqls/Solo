package Controller0;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Service0.Service;

/**
 * Servlet implementation class EquipmentEnforceController
 */
@WebServlet("/enforce.ep")
public class EquipmentEnforceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EquipmentEnforceController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Service service = new Service();
        
        String swordName = request.getParameter("swordName");
        String type = request.getParameter("type"); // sword/shield/armor

        boolean success = false;

        if("sword".equals(type)) {
            success = service.enforceSword(swordName);
        }

        // 강화 결과 JSP로 전달
        request.setAttribute("swordName", swordName);
        request.setAttribute("success", success);

        request.getRequestDispatcher("/equipment/equip_enforce_result.jsp").forward(request, response);
    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
