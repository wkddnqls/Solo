package Controller0;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Service0.Service;

/**
 * Servlet implementation class EquipmentDelectController
 */
@WebServlet("/equipDelete.ep")
public class EquipmentDelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EquipmentDelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Service service = new Service();
		String equipName = request.getParameter("equipName");
        String equipType = request.getParameter("equipType");

        
        int result = service.deleteEquipmentByName(equipName, equipType);

        if(result > 0) {
            // 삭제 성공 → 목록 페이지로 이동
        	request.getSession().setAttribute("alertMsg", "장비 삭제가 완료되었습니다!");
            response.sendRedirect(request.getContextPath() + "/equipList.ep");
        } else {
            // 삭제 실패 → 에러 페이지
            request.setAttribute("errorMsg", "삭제 실패 또는 해당 이름의 장비가 없습니다.");
            request.getRequestDispatcher("/views/common/errorPage.jsp")
                   .forward(request, response);
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
