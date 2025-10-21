package Service0;

import static JDBC.common.close;
import static JDBC.common.commit;
import static JDBC.common.rollback;


import java.sql.Connection;
import java.util.List;

import JDBC.common;
import equipment0.monstercollection;
import Dao0.monsterDao;

public class monsterService {
	private monsterDao MD = new monsterDao();
	
	public int instertMonster( monstercollection M ) {
		Connection conn = common.go();
		int result = MD.insertMonster(M,conn);
		 
		 if(result>0) {
			 commit(conn);
		 }else {
			 rollback(conn);
		 }
		     close(conn);

		return result;
		
	}


	public List<monstercollection> slectMoster() {
		Connection conn = common.go();
		List<monstercollection> list4 = MD.slectMoster(conn);
		
		
		     close(conn);

		return list4;
	}
	

	public monstercollection selectMoster( String MonsterName ) {
		
		Connection conn = common.go();
       monstercollection result = MD.selectMoster(MonsterName,conn);
		 
  
  	     
	   return result;
		
	}
	
     public int deleteMoster( monstercollection M ) {
		
		Connection conn = common.go();
     
		int result = MD.deleteMoster(M,conn);
		 
		if(result>0) {
			 commit(conn);
		 }else {
			 rollback(conn);
		 }
		     close(conn);
		     
	   return result;
		
	}
}
