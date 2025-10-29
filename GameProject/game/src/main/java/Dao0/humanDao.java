package Dao0;




import org.apache.ibatis.session.SqlSession;

import equipment0.humancollection;


public class humanDao {
	
	public int insertHuman(SqlSession sqlSession, humancollection human) {
	    return sqlSession.insert("HumanMapper.insertHuman", human);
	}
	
	
	
	
}
	
	
	
	
	

