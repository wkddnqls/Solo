package HumanController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import JDBC.PageInfo;
import Service0.Service;
import equipment0.armorcollection;
import equipment0.shieldcollection;
import equipment0.swordcollection;


@WebServlet("/chooseEquipment.ep")
public class human_choose_equipment_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

  
    public human_choose_equipment_Controller() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Service service = new Service(); 

		  String humanName = request.getParameter("humanName");
		  double humanNum = Double.parseDouble(request.getParameter("humanNum"));
		  double humanPower = Double.parseDouble(request.getParameter("humanPower"));
		  double humanDefensive = Double.parseDouble(request.getParameter("humanDefensive"));
	      String humanSpecslist = request.getParameter("humanSpecslist");
		
		
		
	    // 장비별 페이지 가져오기
	    int swordPage = request.getParameter("swordPage") != null ? Integer.parseInt(request.getParameter("swordPage")) : 1;
	    int shieldPage = request.getParameter("shieldPage") != null ? Integer.parseInt(request.getParameter("shieldPage")) : 1;
	    int armorPage = request.getParameter("armorPage") != null ? Integer.parseInt(request.getParameter("armorPage")) : 1;

	    // 총 게시글 수
	    int listSwordCount = service.selectAllSwordCount();
	    int listShieldCount = service.selectAllShieldCount();
	    int listArmorCount = service.selectAllArmorCount();

	    // PageInfo 생성
	    PageInfo swordPi = new PageInfo(swordPage, listSwordCount, 3, 5);
	    PageInfo shieldPi = new PageInfo(shieldPage, listShieldCount, 3, 5);
	    PageInfo armorPi = new PageInfo(armorPage, listArmorCount, 3, 5);

	    // 각 장비별 리스트 가져오기
	    ArrayList<swordcollection> swordList = service.SwordselectAll(swordPi);
	    ArrayList<shieldcollection> shieldList = service.ShieldselectAll(shieldPi);
	    ArrayList<armorcollection> armorList = service.ArmorselectAll(armorPi);

	    // request에 저장
	    
	    request.setAttribute("humanName", humanName);
        request.setAttribute("humanNum", humanNum);
        request.setAttribute("humanPower", humanPower);
        request.setAttribute("humanDefensive", humanDefensive);
        request.setAttribute("humanSpecslist", humanSpecslist);
        
        
	    request.setAttribute("swordList", swordList);
	    request.setAttribute("shieldList", shieldList);
	    request.setAttribute("armorList", armorList);

	    request.setAttribute("Swordpi", swordPi);
	    request.setAttribute("Shieldpi", shieldPi);
	    request.setAttribute("Armorpi", armorPi);

	    request.getRequestDispatcher("/human/human_equipment_choose_equipment.jsp").forward(request, response);

	
	
	
	}

	
	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
