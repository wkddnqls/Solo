package HumanController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


import Service0.humanService;
import equipment0.humancollection;

/**
 * Servlet implementation class HumanCreateCotroller
 */
@WebServlet("/insertHuman.do")
public class Human_Create_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Human_Create_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

        String humanName = request.getParameter("humanName");
        double humanNum = Double.parseDouble(request.getParameter("humanNum"));
        double humanPower = Double.parseDouble(request.getParameter("humanPower"));
        double humanDefensive = Double.parseDouble(request.getParameter("humanDefensive"));


        
        int result = new humanService().insertHuman(humanName, humanNum, humanPower, humanDefensive); // 임시로 성공 가정
        
        // 5. 처리 결과에 따라 페이지 이동
        if(result > 0) {
            // 저장 성공 → 목록 페이지로 이동
            request.getSession().setAttribute("alertMsg", "유저 생성이 완료되었습니다!");
            response.sendRedirect(request.getContextPath());
        
        } else {
            // 저장 실패 → 에러 페이지
            request.setAttribute("errorMsg", "유저 등록에 실패했습니다.");
            request.getRequestDispatcher("views/common/error.jsp").forward(request, response);
        }
        
	}
        
        
        
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
