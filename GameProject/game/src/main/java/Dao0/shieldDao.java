package Dao0;




import java.util.ArrayList;
import java.util.HashMap;


import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import JDBC.PageInfo;

import equipment0.shieldcollection;



public class shieldDao {
	
	 public int selectAllShieldCount(SqlSession sqlSession) {
		 return sqlSession.selectOne("ShieldMapper.selectAllShieldCount");
	 }
	
	
public ArrayList<shieldcollection> selectshieldAll(SqlSession sqlSession,PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit() ;
		 
		 RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		 
		 
		
		
		
		ArrayList<shieldcollection> list = 
	      (ArrayList)sqlSession.selectList("ShieldMapper.selectShieldAll",null ,rowBounds);
		 
		 return list;
	
	}
	
	
	
public int insertShield(SqlSession sqlSession, shieldcollection shield) {
    return sqlSession.insert("ShieldMapper.insertShield", shield);
} 
	






    public int deleteShieldByName(SqlSession sqlSession, String shieldName) {
        return sqlSession.delete("ShieldMapper.deleteShieldByName", shieldName);
    }

	
	public int enhanceShield(SqlSession sqlSession, String shieldName) {
        // 파라미터 맵 생성
        HashMap<String, Object> param = new HashMap<>();
        param.put("shieldName", shieldName);

        // 강화 수치 +1
        return sqlSession.update("ShieldMapper.enhanceShield", param);
    }
    

}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
