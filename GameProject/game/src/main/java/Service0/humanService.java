package Service0;


import org.apache.ibatis.session.SqlSession;

import equipment0.humancollection;

import Dao0.humanDao;

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

}

