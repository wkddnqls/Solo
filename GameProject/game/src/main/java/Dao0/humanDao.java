package Dao0;




import java.util.ArrayList;

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
	
	
}
	
	
	
	
	

