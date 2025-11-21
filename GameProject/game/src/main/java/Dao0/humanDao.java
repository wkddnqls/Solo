package Dao0;




import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import JDBC.PageInfo;
import equipment0.humancollection;



public class humanDao {
	
	public int insertHuman(SqlSession sqlSession, humancollection human) {
	    return sqlSession.insert("HumanMapper.insertHuman", human);
	}
	
	 public int selectAllHumanCount(SqlSession sqlSession) {
		 return sqlSession.selectOne("HumanMapper.selectAllHumanCount");
	 }
	
	
	
	
	public ArrayList<humancollection> selecthumanAll(SqlSession sqlSession,PageInfo pi) {
	
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit() ;
		 
		 RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	

		
		ArrayList<humancollection> list = 
	      (ArrayList)sqlSession.selectList("HumanMapper.selectHumanAll",null ,rowBounds);
		 
		 return list;
	
	}
	
	 public int updatehuman(SqlSession sqlSession, String humanName, String itemName, int currentNum, String type) {
		 Map<String, Object> param = new HashMap<>();
		    param.put("humanName", humanName);
		    param.put("currentNum", currentNum);
		    param.put("type", type);

		    int result = 0;

		    if ("sword".equalsIgnoreCase(type)) {
		        param.put("swordName", itemName);  // Mapper 키에 맞게
		        result = sqlSession.update("HumanMapper.updatesword", param);
		    } else if ("armor".equalsIgnoreCase(type)) {
		        param.put("armorName", itemName);  // Mapper 키에 맞게
		        result = sqlSession.update("HumanMapper.updatearmor", param);
		    } else if ("shield".equalsIgnoreCase(type)) {
		        param.put("shieldName", itemName); // Mapper 키에 맞게
		        result = sqlSession.update("HumanMapper.updateshield", param);
		    } else {
		        System.out.println("⚠️ Unknown equipment type: " + type);
		    }

		    return result;
		}
	
	 public int deleteHuman(String humanName , SqlSession sqlSession) {
	        return sqlSession.delete("HumanMapper.deleteHuman", humanName);
	    }
	 
	 
	 
}
	
	
	

