package HumanController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Service0.humanService;

/**
 * Servlet implementation class human_
 */
@WebServlet("/equipped.ep")
public class Human_equipped_equipment_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Human_equipped_equipment_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		humanService service = new humanService(); 
		
		    String itemName = request.getParameter("Name");
	        String humanName = request.getParameter("humanName");
	        String type = request.getParameter("type");
	        int currentNum = Integer.parseInt(request.getParameter("currentNum"));

	        // ✅ 2. 서비스 호출 (장착 처리)
	       
	        int result = service.Equipment_equipped(humanName, itemName, currentNum, type);

	        
	        if(result > 0) {
	            // 저장 성공 → 목록 페이지로 이동
	        	request.getSession().setAttribute("alertMsg", "장비 장착이 완료되었습니다!");
	            response.sendRedirect(request.getContextPath() + "/chooseHuman.ep");
	        
	        } else {
	            // 저장 실패 → 에러 페이지
	            request.setAttribute("errorMsg", "유저 등록에 실패했습니다.");
	            request.getRequestDispatcher("views/common/error.jsp").forward(request, response);
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
