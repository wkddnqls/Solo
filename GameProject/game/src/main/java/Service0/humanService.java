package Service0;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import equipment0.humancollection;
import equipment0.swordcollection;
import Dao0.humanDao;
import JDBC.PageInfo;
import JDBC.Template;

public class humanService {
	private humanDao HD = new humanDao();
	
	public int insertHuman(String humanName, double humanNum, double humanPower, double humanDefensive) {
		SqlSession sqlSession = Template.getSqlSession();
        int result = 0;

           humancollection human = new humancollection(humanName, humanNum, humanPower,humanDefensive);
           
            result = HD.insertHuman(sqlSession, human);
                    
            

            if (result > 0) {
                sqlSession.commit();
            } else {
                sqlSession.rollback();
            }
       
            sqlSession.close();
        

        return result;
    }

	
	
	

	public int selectAllHumanCount(){
		SqlSession sqlSession = Template.getSqlSession();
		
		int listCount = HD.selectAllHumanCount(sqlSession);
		
		
		sqlSession.close();
		
		return listCount;
	}
	
	public ArrayList<humancollection> HumanselectAll(PageInfo pi) {
		SqlSession sqlSession = Template.getSqlSession();

	    ArrayList<humancollection> humans = HD.selecthumanAll(sqlSession,pi);
	  //  List<shieldcollection> shields = SED.selectshieldAll(sqlSession);
	   //List<armorcollection> armor = AM.selectarmorAll(sqlSession);
	   
	   sqlSession.close();
	   return humans;
	   //  return new equipmentcollection(swords, shields , armor);
	}
}

