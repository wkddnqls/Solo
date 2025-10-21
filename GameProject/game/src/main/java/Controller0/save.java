package Controller0;

import static JDBC.common.close;
import static JDBC.common.commit;
import static JDBC.common.rollback;

import java.sql.Connection;

import JDBC.common;
import equipment0.shieldcollection;
import equipment0.swordcollection;

public class save {
	/*
	public void selectkeywordshield(String shieldName) {
		
		
		ArrayList<shieldcollection> list2 = ss.selectkeywordshield(shieldName);
		
		

		 if(list2.isEmpty()) {
			   System.out.println(" 방패 조회 실패했습니다 ");
		   }else {
			   viewMenu.displayList(list2, "조회완료");
		   }
	}*/

}
/*
public int updatesword(swordcollection s) {
	
	 Connection conn = common.go();
	
	 
	 
	 int result = sd.updatesword(s,conn);
	 
	 if(result>0) {
		 commit(conn);
	 }else {
		 rollback(conn);
	 }
	     close(conn);
	     
	  
	 return result;
	 
}
/*
 * 

public void updatesword(String swordName ,String swordUse ) {
	
	
	 swordcollection s = new swordcollection();
		
		s.setSwordName(swordName);
		s.setSwordUse(swordUse);
	
	int result = ss.updatesword(s);
	
		 if(result>0) {
		  	   System.out.println("성공적으로  업데이트되었습니다 ");
		     }else {
		  	   System.out.println(" 소드 업데이트실패습니다 ");
		     }
}

public void updateshield(String shieldName ,String shieldUse ) {
	
	
	shieldcollection s = new shieldcollection();
		
		s.setShieldName(shieldName);
		s.setShieldUse(shieldUse);
	
	int result = ss.updateshield(s);
	
		 if(result>0) {
		  	   System.out.println("성공적으로  업데이트되었습니다 ");
		     }else {
		  	   System.out.println(" 소드 업데이트실패습니다 ");
		     }
}
 */
/*
public int updateshield(shieldcollection s) {
	
	 Connection conn = common.go();
	
	 
	 
	 int result = SED.updateshield(s,conn);
	 
	 if(result>0) {
		 commit(conn);
	 }else {
		 rollback(conn);
	 }
	     close(conn);
	     
	  
	 return result;
	 
}*/
/*
public ArrayList<shieldcollection> selectkeywordshield(String shieldName) {
	Connection conn = common.go();
	
	 ArrayList<shieldcollection> list2 = SED.selectkeywordshield(shieldName,conn);
	 
	
	 
	    
	     close(conn);
	     return list2;
	 
}*/