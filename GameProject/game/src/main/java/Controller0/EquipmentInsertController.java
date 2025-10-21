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
@WebServlet("/insertSword.ep")
public class EquipmentInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public EquipmentInsertController() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  
        // 1. 한글 깨짐 방지
        request.setCharacterEncoding("UTF-8");

        // 2. JSP에서 넘어온 파라미터 꺼내오기
        String equipName = request.getParameter("equipName");
        String equipType = request.getParameter("equipType");
        String equipinitial = request.getParameter("equipinitial");
        String equipUse = request.getParameter("equipUse");

        

        // 4. DB 저장 로직 (예: DAO 호출) 
        // int result = new EquipmentService().insertEquip(equipName, equipType, equipPower, equipUse);

        int result = new Service().insert(equipName, equipType, equipinitial, equipUse); // 임시로 성공 가정
       
        // 5. 처리 결과에 따라 페이지 이동
        if(result > 0) {
            // 저장 성공 → 목록 페이지로 이동
            request.getSession().setAttribute("alertMsg", "장비 등록이 완료되었습니다!");
            response.sendRedirect(request.getContextPath());
        
        } else {
            // 저장 실패 → 에러 페이지
            request.setAttribute("errorMsg", "장비 등록에 실패했습니다.");
            request.getRequestDispatcher("views/common/error.jsp").forward(request, response);
        }
    }
		
			
		
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
