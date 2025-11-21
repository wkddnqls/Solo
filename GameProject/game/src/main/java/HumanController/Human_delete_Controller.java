package HumanController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Service0.humanService;

/**
 * Servlet implementation class Human_delete_Controller
 */
@WebServlet("/humanDelete.ep")
public class Human_delete_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Human_delete_Controller() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		humanService service = new humanService();
		String humanName = request.getParameter("humanName");
		
	
        int result = service.deleteHuman(humanName);
		
        if(result > 0) {
            // 삭제 성공 → 목록 페이지로 이동
        	request.getSession().setAttribute("alertMsg", "유저가 삭제되었습니다!");
        	response.sendRedirect(request.getContextPath() + "/chooseHuman.ep");
        } else {
            // 삭제 실패 → 에러 페이지
            request.setAttribute("errorMsg", "삭제 실패 또는 해당 이름의 장비가 없습니다.");
            request.getRequestDispatcher("/views/common/errorPage.jsp")
                   .forward(request, response);
        }
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
