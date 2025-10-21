package Dao0;

import static JDBC.common.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import equipment0.armorcollection;
import equipment0.monstercollection;
import equipment0.swordcollection;

public class monsterDao {
    
	public int insertMonster(monstercollection s,Connection conn) {
		
        int result = 0; 
		
		PreparedStatement pstmt = null;

		//실행할 SQL (sql뒤에 ; 없어야함 !!)
	    String sql = "INSERT INTO MONSTER VALUES(?,?,?,?)";

	    try {
			
		    
		    //아직 미완성 sql문으로 ?의 값을 전부 채워야함
		    pstmt = conn.prepareStatement(sql);
		    
			pstmt.setString(1, s.getMonsterName());
			pstmt.setInt(2, s.getMonsterNum());
			pstmt.setInt(3, s.getMonsterPower());
			pstmt.setInt(4, s.getMonsterDefensive());
			
			result =pstmt.executeUpdate();
			
			
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
	    
	    {
			
			close(pstmt);
	    }
		
	    return result;
		
		
		
	    
	    
	}
	
	public List<monstercollection> slectMoster(Connection conn) {

		ResultSet rset= null;
		ArrayList<monstercollection> list4 = new ArrayList<>();

		PreparedStatement pstmt = null;
		
		String sql = "SELECT * FROM MONSTER";
		
		try {
			
		    pstmt = conn.prepareStatement(sql);
		    rset = pstmt.executeQuery();
		    
		    while(rset.next())
		    {
		    	monstercollection a =new monstercollection();
		    	
		    	a.setMonsterName(rset.getString("MONSTER_NAME"));
	        	a.setMonsterNum(rset.getInt("MONSTER_NUM"));
	            a.setMonsterPower(rset.getInt("MONSTER_POWER"));
	            a.setMonsterDefensive(rset.getInt("MONSTER_DEFENSIVE"));
		    	list4.add(a);
		    }
		    //반복문이 끝난시점
		    //list -비어있거나 / 데이터가 들어잇거나
		    
		    
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			close(rset);
			close(pstmt);
		}
		
		
		
		return list4;
		
	}
	
	public monstercollection selectMoster(String MonsterName, Connection conn) {
		monstercollection a = null;
	    String sql = "SELECT * FROM MONSTER WHERE MONSTER_NAME = ?";
	   
	    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, MonsterName);
	        ResultSet rset = pstmt.executeQuery();

	        if (rset.next()) {
	            a = new monstercollection();
	        	a.setMonsterName(rset.getString("MONSTER_NAME"));
	        	a.setMonsterNum(rset.getInt("MONSTER_NUM"));
	            a.setMonsterPower(rset.getInt("MONSTER_POWER"));
	            a.setMonsterDefensive(rset.getInt("MONSTER_DEFENSIVE"));
	        }

	        close(rset);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return a;
	}
public int deleteMoster(monstercollection M,Connection conn) {
		
		
		
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql ="DELETE FROM MONSTER WHERE MONSTER_NAME=? ";
		

	    try {
			pstmt = conn.prepareStatement(sql);
		
			
			
			pstmt.setString(1, M.getMonsterName());
			
			
			result =pstmt.executeUpdate();
			

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
	    {
			close(pstmt);
			 
	    }

	return result;


	}
	
}
