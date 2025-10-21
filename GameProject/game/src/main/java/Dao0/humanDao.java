package Dao0;

import static JDBC.common.close;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import JDBC.common;
import equipment0.armorcollection;
import equipment0.humancollection;
import equipment0.monstercollection;
import equipment0.shieldcollection;
import equipment0.swordcollection;

public class humanDao {
	
public int insertHuman(humancollection s,Connection conn) {
		
        int result = 0; 
		
		PreparedStatement pstmt = null;

		//실행할 SQL (sql뒤에 ; 없어야함 !!)
	    String sql = "INSERT INTO HUMAN VALUES(?,?,?,?,NULL)";

	    try {
			
		    
		    //아직 미완성 sql문으로 ?의 값을 전부 채워야함
		    pstmt = conn.prepareStatement(sql);
		    
			pstmt.setString(1, s.getHumanName());
			pstmt.setDouble(2, s.getHumanNum());
			pstmt.setDouble(3, s.getHumanPower());
			pstmt.setDouble(4, s.getHumanDefensive());
			
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
	
	public List<humancollection> selectHuman(Connection conn) {

		ResultSet rset= null;
		ArrayList<humancollection> list5 = new ArrayList<>();

		PreparedStatement pstmt = null;
		
		String sql = "SELECT * FROM HUMAN";
		
		try {
			
		    pstmt = conn.prepareStatement(sql);
		    rset = pstmt.executeQuery();
		    
		    while(rset.next())
		    {
		    	humancollection a =new humancollection();
		    	
		    	a.setHumanName(rset.getString("HUMAN_NAME"));
	        	a.setHumanNum(rset.getDouble("HUMAN_NUM"));
	            a.setHumanPower(rset.getDouble("HUMAN_POWER"));
	            a.setHumanDefensive(rset.getDouble("HUMAN_DEFENSIVE"));
	            a.setHumanSpecslist(rset.getString("HUMAN_SPECSLIST"));
		    	list5.add(a);
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
		
		
		
		return list5;
		
		
	}

	public int swordupdate(humancollection m,swordcollection S,Connection conn) {
		
		
			
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql ="UPDATE HUMAN " +
                "SET HUMAN_SPECSLIST = HUMAN_SPECSLIST || ? || ',', " +
                "HUMAN_POWER = HUMAN_POWER + ? " +
                "WHERE HUMAN_NAME = ?";
		

	    try {
			pstmt = conn.prepareStatement(sql);
		
			
			
			pstmt.setString(1, S.getSwordName());

	     
	        pstmt.setInt(2, S.getSwordNum());

	       
	        pstmt.setString(3, m.getHumanName());
			
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
	
	public int shieldupdate(humancollection m,shieldcollection S,Connection conn) {
		
		
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql ="UPDATE HUMAN " +
                "SET HUMAN_SPECSLIST = HUMAN_SPECSLIST || ? || ',', " +
                "HUMAN_NUM = HUMAN_NUM + (?*2) " +
                "WHERE HUMAN_NAME = ?";
		

	    try {
			pstmt = conn.prepareStatement(sql);
		
			
			
			pstmt.setString(1, S.getShieldName());

	     
	        pstmt.setInt(2, S.getShieldNum());

	       
	        pstmt.setString(3, m.getHumanName());
			
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
	
	
	public int armorupdate(humancollection m,armorcollection S,Connection conn) {
		
		
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql ="UPDATE HUMAN " +
                "SET HUMAN_SPECSLIST = HUMAN_SPECSLIST || ? || ',', " +
                "HUMAN_DEFENSIVE = HUMAN_DEFENSIVE + (?*0.5) " +
                "WHERE HUMAN_NAME = ?";
		

	    try {
			pstmt = conn.prepareStatement(sql);
		
			
			
			pstmt.setString(1, S.getArmorName());

	     
	        pstmt.setInt(2, S.getArmorNum());

	       
	        pstmt.setString(3, m.getHumanName());
			
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
	
	public humancollection selectHuman(String HumanName, Connection conn) {
		humancollection a = null;
	    String sql = "SELECT * FROM HUMAN WHERE HUMAN_NAME = ?";
	   
	    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, HumanName);
	        ResultSet rset = pstmt.executeQuery();

	        if (rset.next()) {
	            a = new humancollection();
	            a.setHumanName(rset.getString("HUMAN_NAME"));
	        	a.setHumanNum(rset.getDouble("HUMAN_NUM"));
	            a.setHumanPower(rset.getDouble("HUMAN_POWER"));
	            a.setHumanDefensive(rset.getDouble("HUMAN_DEFENSIVE"));
	            a.setHumanSpecslist(rset.getString("HUMAN_SPECSLIST"));
	        }

	        close(rset);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return a;
	}
public int deleteHuman(humancollection H,Connection conn) {
		
		
		
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql ="DELETE FROM HUMAN WHERE HUMAN_NAME=? ";
		

	    try {
			pstmt = conn.prepareStatement(sql);
		
			
			
			pstmt.setString(1, H.getHumanName());
			
			
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
	
	
	
	
	

