package Controller0;

import static JDBC.common.close;
import static JDBC.common.commit;
import static JDBC.common.rollback;

import java.sql.Connection;
import java.util.List;

import JDBC.common;
import Service0.humanService;
import View0.viewMenu;
import equipment0.armorcollection;
import equipment0.humancollection;
import equipment0.monstercollection;
import equipment0.shieldcollection;
import equipment0.swordcollection;
import Dao0.armorDao;
import Dao0.humanDao;
import Dao0.shieldDao;
import Dao0.swordDao;

    public class humanController {
    	humanService HS = new humanService();
	public void insertHuman(String monsterName,int monsterNum , int monsterPower , int monsterDefensive ) {
		 
		humancollection M = new humancollection(monsterName,monsterNum , monsterPower , monsterDefensive);
		
		
		  int result = HS.instertHuman(M);
		  
		  if(result>0) {
			   System.out.println("성공적으로 유저가 추가되었습니다 ");
		   }else {
			   System.out.println(" 추가실패 ");
		   }
	}
	
	public List<humancollection> selectHuman() {
		 
		 List<humancollection> list5 = HS.selectHuman();
	 
	 if(list5.isEmpty()) {
		 System.out.println(" 실패 ");
	  }else {
		  viewMenu.displayList(list5 , "유저 조회완료");
	  }
	 return list5;
	}
	
	public void swordupdate(String swordName,String humanName) {
		   humanDao HD = new humanDao();
		   swordDao sd =new swordDao();
			
		   Connection conn = common.go();
			
		   swordcollection S = sd.selectSword(swordName, conn);
			 S.setSwordName(swordName);		
		   humancollection M = new humancollection(humanName);
		    M.setHumanName(humanName);
		
		 int result = HS.swordupdate(M,S,conn);
	
		 if(result>0) {
			   System.out.println("성공적으로 강화수치랑 강화장비가추가되었습니다 ");
		   }else {
			   System.out.println(" 추가실패 ");
		   }
	 }
	
    
    public void shieldupdate(String shieldName,String humanName) {
		   humanDao HD = new humanDao();
		 shieldDao SED = new shieldDao();
			
		   Connection conn = common.go();
			
		   shieldcollection S = SED.selectshield(shieldName, conn);
			 S.setShieldName(shieldName);		
		   humancollection M = new humancollection(humanName);
		    M.setHumanName(humanName);
		
		 int result = HS.shieldupdate(M,S,conn);
	
		 if(result>0) {
			   System.out.println("성공적으로 강화수치랑 강화장비가추가되었습니다 ");
		   }else {
			   System.out.println(" 추가실패 ");
		   }
	 }
	
    public void armorupdate(String armorName,String humanName) {
		   humanDao HD = new humanDao();
		 armorDao AM = new armorDao();
			
		   Connection conn = common.go();
			
		   armorcollection S = AM.selectamor(armorName, conn);
			 S.setArmorName(armorName);		
		   humancollection M = new humancollection(humanName);
		    M.setHumanName(humanName);
		
		 int result = HS.armorupdate(M,S,conn);
	
		 if(result>0) {
			   System.out.println("성공적으로 강화수치랑 강화장비가추가되었습니다 ");
		   }else {
			   System.out.println(" 추가실패 ");
		   }
	 }
    
    
    
    
    public void selectHuman(String HumanName) {
   	 
   	 
   	 
    	humancollection result = HS.selectHuman(HumanName);
   	 
   	 if(result == null) {
   		    System.out.println("해당 유저가 존재하지 않습니다.");
   		    return;
   		} else {
   		    System.out.println("몬스터 이름 : " + result.getHumanName());
   		    System.out.print(" 체력 : " + result.getHumanNum());
   		    System.out.print(" / 공격력 : " + result.getHumanPower());
   		    System.out.println(" / 방어력 : " + result.getHumanDefensive());
   		 System.out.println(" 착용장비 : " + result.getHumanSpecslist());
   		}
   	 
   	 
    }
    public void deleteHuman(String deleteHumanName) {
    	
    	
    	humancollection H = new humancollection(deleteHumanName);
   	 
   	 H.setHumanName(deleteHumanName);
   	 
   	 int result = HS.deleteHuman(H);
   	
   	 if(result>0) {
   		   System.out.println("성공적으로 몬스터가 삭제되었습니다 ");
   	   }else {
   		   System.out.println(" 삭제실패 ");
   	   }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
	}
