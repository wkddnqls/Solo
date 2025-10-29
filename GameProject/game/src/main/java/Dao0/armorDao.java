package Dao0;



import java.util.ArrayList;
import java.util.HashMap;


import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import JDBC.PageInfo;

import equipment0.armorcollection;


public class armorDao {
	
	public int selectAllArmorCount(SqlSession sqlSession) {
		 return sqlSession.selectOne("ArmorMapper.selectAllArmorCount");
	 }
	
public ArrayList<armorcollection> selectarmorAll(SqlSession sqlSession,PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit() ;
		 
		 RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		 
		 
		
		
		
		ArrayList<armorcollection> list = 
	      (ArrayList)sqlSession.selectList("ArmorMapper.selectArmorAll",null ,rowBounds);
		 
		 return list;
	
	}
	
public int insertArmor(SqlSession sqlSession, armorcollection armor) {
    return sqlSession.insert("ArmorMapper.insertArmor", armor);
}

    public int deleteArmorByName(SqlSession sqlSession, String armorName) {
        return sqlSession.delete("ArmorMapper.deleteArmorByName", armorName);
    }

	public int enhanceArmor(SqlSession sqlSession, String armorName) {
        // 파라미터 맵 생성
        HashMap<String, Object> param = new HashMap<>();
        param.put("armorName", armorName);

        // 강화 수치 +1
        return sqlSession.update("ArmorMapper.enhanceArmor", param);
    }
    
    


	
	
}

