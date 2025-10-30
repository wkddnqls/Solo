package HumanController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import JDBC.PageInfo;

import Service0.humanService;

import equipment0.humancollection;


/**
 * Servlet implementation class HumanlistController
 */
@WebServlet("/humanList.ep")
public class Human_list_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Human_list_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		humanService service = new humanService(); 

	    // 장비별 페이지 가져오기
	    int humanPage = request.getParameter("humanPage") != null ? Integer.parseInt(request.getParameter("humanPage")) : 1;
	  

	    // 총 게시글 수
	    int listHumanCount = service.selectAllHumanCount();
	

	    // PageInfo 생성
	    PageInfo humanPi = new PageInfo(humanPage, listHumanCount, 3, 5);
	  

	    // 각 장비별 리스트 가져오기
	    ArrayList<humancollection> humanList = service.HumanselectAll(humanPi);
	 
	    // request에 저장
	    request.setAttribute("humanList", humanList);
	    request.setAttribute("Humanpi", humanPi);
	    request.getRequestDispatcher("/human/human_list.jsp").forward(request, response);
}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
