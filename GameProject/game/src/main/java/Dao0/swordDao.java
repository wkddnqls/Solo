package Dao0;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import JDBC.PageInfo;

import equipment0.armorcollection;
import equipment0.swordcollection;



public class swordDao {
	
	 public int selectAllSwordCount(SqlSession sqlSession) {
		 return sqlSession.selectOne("SwordMapper.selectAllSwordCount");
	 }
	
	
	
	
	public ArrayList<swordcollection> selectswordAll(SqlSession sqlSession,PageInfo pi) {
	
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit() ;
		 
		 RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	

		
		ArrayList<swordcollection> list = 
	      (ArrayList)sqlSession.selectList("SwordMapper.selectSwordAll",null ,rowBounds);
		 
		 return list;
	
	}

	
	
	public int insertSword(SqlSession sqlSession, swordcollection sword) {
	    return sqlSession.insert("SwordMapper.insertSword", sword);
	}
	
	

	  
	public int deleteSwordByName(SqlSession sqlSession, String swordName) {
	        return sqlSession.delete("SwordMapper.deleteSwordByName", swordName);
	    }
	
	
	
	public int enhanceSword(SqlSession sqlSession, String swordName) {
        // 파라미터 맵 생성
        HashMap<String, Object> param = new HashMap<>();
        param.put("swordName", swordName);

        // 강화 수치 +1
        return sqlSession.update("SwordMapper.enhanceSword", param);
    }
    
   
	
	
	
	
}
