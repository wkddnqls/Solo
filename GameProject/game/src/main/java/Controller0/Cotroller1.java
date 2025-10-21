package Controller0;



import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;



import JDBC.common;
import Service0.Service;
import View0.viewMenu;
import equipment0.armorcollection;
import equipment0.equipmentcollection;
import equipment0.monstercollection;
import equipment0.shieldcollection;
import equipment0.swordcollection;

public class Cotroller1 {
	private Service ss = new Service();
	
	public void selectAll() {
	    
		equipmentcollection result = ss.selectAll();

	    if (result.getSwords().isEmpty() && result.getShields().isEmpty()) {
	        System.out.println("조회 실패했습니다");
	    } else {
	        viewMenu.displayList(result.getSwords(), "소드 조회완료");
	        viewMenu.displayList(result.getShields(), "방패 조회완료");
	        viewMenu.displayList(result.getArmor(), "방어구  조회완료");
	    }
	}

	public void insert(Object item) {
	    int result = 0;

	    if (item instanceof swordcollection) {
	        result = ss.insert((swordcollection) item);
	        
	        if(result>0) {
				   System.out.println("성공적으로 소드가 추가되었습니다 ");
			   }else {
				   System.out.println(" 추가실패 ");
			   }
	    } else if (item instanceof shieldcollection) {
	      
	    	result = ss.insert((shieldcollection) item);
	        
	        
	        if(result>0) {
				   System.out.println("성공적으로 방패가 추가되었습니다 ");
			   }else {
				   System.out.println(" 추가실패 ");
			   }
	    }  else if (item instanceof armorcollection)
		      
		    	result = ss.insert((armorcollection) item);
		        
		        
		        if(result>0) {
					   System.out.println("성공적으로 방어구가 추가되었습니다 ");
				   }else {
					   System.out.println(" 추가실패 ");
				   }
	
	
	
	
	
	
	}
	

	
	
	public int delete(Object item) {
	    int result = 0;

	    if(item instanceof swordcollection) {
	    	
	    	result = ss.insert((swordcollection) item);
		        
		        if(result>0) {
					   System.out.println("성공적으로 소드가 삭제되었습니다 ");
				   }else {
					   System.out.println(" 삭제실패 ");
				   }
		        
	    } else if(item instanceof shieldcollection) {

	    	result = ss.insert((shieldcollection) item);
	        
	        
	        if(result>0) {
				   System.out.println("성공적으로 방패가 삭제되었습니다 ");
			   }else {
				   System.out.println(" 삭제실패 ");
			   }
	        
	    } else if(item instanceof armorcollection) {
	    	
	    	result = ss.delete((armorcollection) item);
	        
	        
	        if(result>0) {
				   System.out.println("성공적으로 방어구가 삭제되었습니다 ");
			   }else {
				   System.out.println(" 삭제실패 ");
			   }
	    }

	    return result;
	}


	public void selectkeyword(Object item) {
	    equipmentcollection result = ss.selectkeyword(item); // Service에서 Object 기반으로 처리

	    if (result.getSwords().isEmpty() && result.getShields().isEmpty() && result.getArmor().isEmpty()) {
	        System.out.println("조회 실패했습니다");
	    } else {
	        if (!result.getSwords().isEmpty()) {
	            viewMenu.displayList(result.getSwords(), "소드 조회완료");
	        }
	        if (!result.getShields().isEmpty()) {
	            viewMenu.displayList(result.getShields(), "방패 조회완료");
	        }
	        if (!result.getArmor().isEmpty()) {
	            viewMenu.displayList(result.getArmor(), "방어구 조회완료");
	        }
	    }
	}
	    
	    
	    
	public void update(Object item, String use) {
	    int result = 0;

	    if (item instanceof swordcollection) {
	        swordcollection s = new swordcollection();
	        s.setSwordName(((swordcollection) item).getSwordName());
	        s.setSwordUse(use);
	        result = ss.update(s);

	    } else if (item instanceof shieldcollection) {
	        shieldcollection s = new shieldcollection();
	        s.setShieldName(((shieldcollection) item).getShieldName());
	        s.setShieldUse(use);
	        result = ss.update(s);
	    }  else if (item instanceof armorcollection) {
	    	armorcollection s = new armorcollection();
	        s.setArmorName(((armorcollection) item).getArmorName());
	        s.setArmorUse(use);
	        result = ss.update(s);
	    }
	    if (result > 0) {
	        System.out.println("성공적으로 업데이트되었습니다");
	    } else {
	        System.out.println("업데이트 실패했습니다");
	    }
	}	
//////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////

 









}