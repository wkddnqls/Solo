package Service0;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import JDBC.PageInfo;
import JDBC.Template;

import JDBC.common;

import enforce.program0.enforce00;
import equipment0.armorcollection;
import equipment0.equipmentcollection;
import equipment0.monstercollection;
import equipment0.shieldcollection;
import equipment0.swordcollection;

import static JDBC.common.*;


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
	

	public equipmentcollection selectkeyword(Object item) {
	    Connection conn = common.go();
	    equipmentcollection result = new equipmentcollection();

	    if (item instanceof swordcollection) {
	        List<swordcollection> swords = sd.selectkeywordsword((swordcollection) item, conn);
	        result.setSwords(swords);
	    } else if (item instanceof shieldcollection) {
	        List<shieldcollection> shields = SED.selectkeywordshield((shieldcollection) item, conn);
	        result.setShields(shields);
	    } else if (item instanceof armorcollection) {
	        List<armorcollection> armors = AM.selectkeywordarmor((armorcollection) item, conn);
	        result.setArmor(armors);
	    }

	    close(conn);
	    return result;
	}

	public int update(Object item) {
	    Connection conn = common.go();
	    int result = 0;

	   
	        if (item instanceof swordcollection) {
	            swordcollection s = (swordcollection) item;
	            result = sd.updatesword(s, conn);
	        } else if (item instanceof shieldcollection) {
	            shieldcollection s = (shieldcollection) item;
	            result = SED.updateshield(s, conn);
	        } else if (item instanceof armorcollection) {
	        	armorcollection s = (armorcollection) item;
                result = AM.updatearmor(s, conn); }
	        
	        if (result > 0) {
	            commit(conn);
	        } else {
	            rollback(conn);
	        }

	        if (result > 0) {
		        commit(conn);
		    } else {
		        rollback(conn);
		    }
		    close(conn);

	    return result;
	}



public void enforceSword00(String swordName) {
    Connection conn = common.go();

    
    swordcollection sword = sd.selectSword(swordName, conn);
   
    if(sword == null) {
        System.out.println("해당 소드를 찾을 수 없습니다.");
    }
    
    System.out.println("소드 이름: " + sword.getSwordName());
    System.out.println("현재 강화 수치: " + sword.getSwordNum());
    
    if(sword.getSwordNum() == 0) {
        ex.enforce0(swordName,1);
    } else if(sword.getSwordNum() == 1) {
        ex.enforce1(swordName,1);
    } else if(sword.getSwordNum() == 2) {
        ex.enforce2(swordName,1);
    } else if(sword.getSwordNum() == 3) {
        ex.enforce3(swordName,1);
    } else if(sword.getSwordNum() == 4) {
        ex.enforce4(swordName,1);
    } else if(sword.getSwordNum() == 5) {
        ex.enforce5(swordName,1);
    } else {
        System.out.println("강화 가능한 범위를 벗어났습니다.");
    }
    
    
    close(conn);
        return;
    }








public void enforceshield(String shieldName) {
Connection conn = common.go();


shieldcollection shield = SED.selectshield(shieldName, conn);

if(shield == null) {
    System.out.println("해당 소드를 찾을 수 없습니다.");
}

System.out.println("실드 이름: " + shield.getShieldName());
System.out.println("현재 강화 수치: " + shield.getShieldNum());

if(shield.getShieldNum() == 0) {
    ex.enforce0(shieldName,2);
} else if(shield.getShieldNum() == 1) {
    ex.enforce1(shieldName,2);
} else if(shield.getShieldNum() == 2) {
    ex.enforce2(shieldName,2);
} else if(shield.getShieldNum() == 3) {
    ex.enforce3(shieldName,2);
} else if(shield.getShieldNum() == 4) {
    ex.enforce4(shieldName,2);
} else if(shield.getShieldNum() == 5) {
    ex.enforce5(shieldName,2);
} else {
    System.out.println("강화 가능한 범위를 벗어났습니다.");
}


close(conn);
    return;
}

public void enforcearmor(String armorName) {
    Connection conn = common.go();

    
    armorcollection armor = AM.selectamor(armorName, conn);
   
    if(armor == null) {
        System.out.println("해당 소드를 찾을 수 없습니다.");
    }
    
    System.out.println("방어구 이름: " + armor.getArmorName());
    System.out.println("현재 강화 수치: " + armor.getArmorNum());
    
    if(armor.getArmorNum() == 0) {
        ex.enforce0(armorName,3);
    } else if(armor.getArmorNum() == 1) {
        ex.enforce1(armorName,3);
    } else if(armor.getArmorNum() == 2) {
        ex.enforce2(armorName,3);
    } else if(armor.getArmorNum() == 3) {
        ex.enforce3(armorName,3);
    } else if(armor.getArmorNum() == 4) {
        ex.enforce4(armorName,3);
    } else if(armor.getArmorNum() == 5) {
        ex.enforce5(armorName,3);
    } else {
        System.out.println("강화 가능한 범위를 벗어났습니다.");
    }
    
    
    close(conn);
        return;
    }














}
