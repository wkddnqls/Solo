package Service0;


import static JDBC.common.close;
import static JDBC.common.commit;
import static JDBC.common.rollback;

import java.sql.Connection;
import java.util.List;

import JDBC.common;
import equipment0.armorcollection;
import equipment0.humancollection;
import equipment0.monstercollection;
import equipment0.shieldcollection;
import equipment0.swordcollection;
import Dao0.humanDao;
import Dao0.monsterDao;

public class humanService {
	private humanDao HD = new humanDao();
	
	public int instertHuman( humancollection M ) {
		Connection conn = common.go();
		int result = HD.insertHuman(M,conn);
		 
		 if(result>0) {
			 commit(conn);
		 }else {
			 rollback(conn);
		 }
		     close(conn);

		return result;
		
	}


	public List<humancollection> selectHuman() {
		Connection conn = common.go();
		List<humancollection> list5 = HD.selectHuman(conn);
		
		
		     close(conn);

		return list5;
	}
	
	public int swordupdate(humancollection M, swordcollection S ,Connection conn) {
		
			int result = HD.swordupdate(M,S,conn);
			
			 if(result>0) {
				 commit(conn);
			 }else {
				 rollback(conn);
			 }
			     close(conn);

			return result;
	}
	
	public int shieldupdate(humancollection M, shieldcollection S ,Connection conn) {
		
		int result = HD.shieldupdate(M,S,conn);
		
		 if(result>0) {
			 commit(conn);
		 }else {
			 rollback(conn);
		 }
		     close(conn);

		return result;
}
public int armorupdate(humancollection M, armorcollection S ,Connection conn) {
		
		int result = HD.armorupdate(M,S,conn);
		
		 if(result>0) {
			 commit(conn);
		 }else {
			 rollback(conn);
		 }
		     close(conn);

		return result;
}


public humancollection selectHuman( String HumanName ) {
	
	Connection conn = common.go();
	humancollection result = HD.selectHuman(HumanName,conn);
	 
   return result;
	
}

public int deleteHuman( humancollection H ) {
	
	Connection conn = common.go();
 
	int result = HD.deleteHuman(H,conn);
	 
	if(result>0) {
		 commit(conn);
	 }else {
		 rollback(conn);
	 }
	     close(conn);
	     
   return result;
	
}
}

