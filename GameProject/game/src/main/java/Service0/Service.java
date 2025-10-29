package Service0;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import JDBC.PageInfo;
import JDBC.Template;



import enforce.program0.enforce00;
import equipment0.armorcollection;
import equipment0.equipmentcollection;
import equipment0.monstercollection;
import equipment0.shieldcollection;
import equipment0.swordcollection;




import Dao0.armorDao;
import Dao0.monsterDao;
import Dao0.shieldDao;
import Dao0.swordDao;



public class Service {
	 private swordDao sd = new swordDao();
	 private shieldDao SED = new shieldDao();
	 private armorDao AM = new armorDao();
    private monsterDao MD = new monsterDao();
	private enforce00 ex = new enforce00();
   
	
	public int selectAllSwordCount(){
		SqlSession sqlSession = Template.getSqlSession();
		
		int listCount = sd.selectAllSwordCount(sqlSession);
		
		
		sqlSession.close();
		
		return listCount;
	}
	
	public int selectAllShieldCount(){
		SqlSession sqlSession = Template.getSqlSession();
		
		int listCount = SED.selectAllShieldCount(sqlSession);
		
		
		sqlSession.close();
		
		return listCount;
	}
	
	public int selectAllArmorCount(){
		SqlSession sqlSession = Template.getSqlSession();
		
		int listCount = AM.selectAllArmorCount(sqlSession);
		
		
		sqlSession.close();
		
		return listCount;
	}
	
	
	public ArrayList<swordcollection> SwordselectAll(PageInfo pi) {
		SqlSession sqlSession = Template.getSqlSession();

	    ArrayList<swordcollection> swords = sd.selectswordAll(sqlSession,pi);
	  //  List<shieldcollection> shields = SED.selectshieldAll(sqlSession);
	   //List<armorcollection> armor = AM.selectarmorAll(sqlSession);
	   
	   sqlSession.close();
	   return swords;
	   //  return new equipmentcollection(swords, shields , armor);
	}
	
	
	public ArrayList<shieldcollection> ShieldselectAll(PageInfo pi) {
		SqlSession sqlSession = Template.getSqlSession();

	    ArrayList<shieldcollection> shields = SED.selectshieldAll(sqlSession,pi);
	  //  List<shieldcollection> shields = SED.selectshieldAll(sqlSession);
	   //List<armorcollection> armor = AM.selectarmorAll(sqlSession);
	   
	   sqlSession.close();
	   return shields;
	   //  return new equipmentcollection(swords, shields , armor);
	}
	
	
	
	public ArrayList<armorcollection> ArmorselectAll(PageInfo pi) {
		SqlSession sqlSession = Template.getSqlSession();

	    ArrayList<armorcollection> armors = AM.selectarmorAll(sqlSession,pi);
	  //  List<shieldcollection> shields = SED.selectshieldAll(sqlSession);
	   //List<armorcollection> armor = AM.selectarmorAll(sqlSession);
	   
	   sqlSession.close();
	   return armors;
	   //  return new equipmentcollection(swords, shields , armor);
	}


	    // 강화 로직 (50% 확률)
	  /*  public boolean enforceSword(String swordName) {
	    	SqlSession sqlSession = Template.getSqlSession();
	        try {
	           
	        	int randomNumber = (int)(Math.random() * 2) + 1;
	          
	            int userInput = 1; // JSP에서 버튼 클릭 시 1로 처리 (웹에서는 단순 시도)
	          
	            if(randomNumber == userInput) {
	                int result = sd.enhanceSword(sqlSession, swordName);
	                
	                if(result > 0) {
	                	sqlSession.commit();
	                    return true;
	                } else {
	                	sqlSession.rollback();
	                    return false;
	                }
	            } else {
	                return false;
	            }
	        } finally {
	            sqlSession.close();
	        }
	    } */

	    public boolean enforceItem(String name, String type, int userChoice) {
	    	SqlSession sqlSession = Template.getSqlSession();
	        boolean success = false;

	        // 난수 생성 (1 또는 2)
	        int randomNumber = (int)(Math.random() * 2) + 1;
	        System.out.println("난수: " + randomNumber + ", 유저 입력: " + userChoice);

	        if (userChoice == randomNumber) { // 강화 성공
	            int result = 0;

	            switch (type) {
	                case "sword" : result = sd.enhanceSword(sqlSession, name); break;
	                case "shield": result = SED.enhanceShield(sqlSession, name); break;
	                case "armor": result = AM.enhanceArmor(sqlSession, name); break;
	            }

	            if (result > 0) {
	                sqlSession.commit();
	                success = true;
	            } else {
	                sqlSession.rollback();
	            }

	        } else {
	            System.out.println("강화 실패 😢");
	        }

	        sqlSession.close();
	        return success;
	    }
	
	

	    
	    
	    
	public int insert(String equipName, String equipType, String equipInitial, String equipUse) {
		SqlSession sqlSession = Template.getSqlSession();
        int result = 0;

        try {
            switch (equipType) {
                case "sword":
                    swordcollection sword = new swordcollection(equipName, equipInitial, equipUse);
                    result = sd.insertSword(sqlSession, sword);
                    break;

                case "shield":
                    shieldcollection shield = new shieldcollection(equipName, equipInitial, equipUse);
                    result = SED.insertShield(sqlSession, shield);
                    break;

                case "armor":
                    armorcollection armor = new armorcollection(equipName, equipInitial, equipUse);
                    result = AM.insertArmor(sqlSession, armor);
                    break;
            }

            if (result > 0) {
                sqlSession.commit();
            } else {
                sqlSession.rollback();
            }
        } finally {
            sqlSession.close();
        }

        return result;
    }





	public int deleteEquipmentByName(String equipName, String equipType) {
	    SqlSession sqlSession = Template.getSqlSession();
	    int result = 0;

	    try {
	        switch (equipType.toLowerCase()) {
	            case "sword":
	                result = sd.deleteSwordByName(sqlSession, equipName);
	                break;

	            case "shield":
	                result = SED.deleteShieldByName(sqlSession, equipName);
	                break;

	            case "armor":
	                result = AM.deleteArmorByName(sqlSession, equipName);
	                break;

	            default:
	                result = 0; // 잘못된 equipType 처리
	        }

	        if (result > 0) {
	            sqlSession.commit();
	        } else {
	            sqlSession.rollback();
	        }
	    } finally {
	        sqlSession.close();
	    }

	    return result;
	}
	


}
