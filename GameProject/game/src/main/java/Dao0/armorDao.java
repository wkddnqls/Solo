package Dao0;

import static JDBC.common.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import JDBC.PageInfo;
import JDBC.common;
import equipment0.armorcollection;
import equipment0.shieldcollection;
import equipment0.swordcollection;

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





public ArrayList<armorcollection> selectkeywordarmor(armorcollection item, Connection conn) {
	
	ArrayList<armorcollection> list3 = new ArrayList<>();
	ResultSet rset= null;
	

	PreparedStatement pstmt = null;
	
	String sql = "SELECT * FROM ARMOR WHERE ARMOR_NAME LIKE'%' || ? ||'%'";
	
	try {
		
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, item.getArmorName());
	    rset = pstmt.executeQuery();
	    
	    while(rset.next())
	    {
       
	    	armorcollection a =new armorcollection();
	    	a.setArmorName(rset.getString("ARMOR_NAME"));
        	a.setArmorNum(rset.getInt("ARMOR_NUM"));
            a.setArmorInitial(rset.getString("ARMOR_INITIASL"));
        	a.setArmorDate(rset.getTimestamp("ARMOR_DATE").toLocalDateTime());
           a.setArmorUse(rset.getString("ARMOR_USE"));
           list3.add(a);
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
	
	
	
	return list3;
	
}


public int updatearmor(armorcollection s,Connection conn) {
	
	
	
	
	int result = 0;
	PreparedStatement pstmt = null;
	
	String sql ="UPDATE ARMOR SET ARMOR_USE =? WHERE ARMOR_NAME=?";
	

    try {
		pstmt = conn.prepareStatement(sql);
	
		
		
		pstmt.setString(1, s.getArmorUse());
		pstmt.setString(2, s.getArmorName());
		
		
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






// 강화 기능


	public armorcollection selectamor(String armorName, Connection conn) {
		armorcollection armor = null;
	    String sql = "SELECT ARMOR_NAME, ARMOR_NUM, ARMOR_INITIASL,ARMOR_DATE, ARMOR_USE FROM ARMOR WHERE ARMOR_NAME = ?";
	   
	    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, armorName);
	        ResultSet rset = pstmt.executeQuery();

	        if (rset.next()) {
	        	armor = new armorcollection();
	        	armor.setArmorName(rset.getString("ARMOR_NAME"));
	        	armor.setArmorNum(rset.getInt("ARMOR_NUM"));
	        	armor.setArmorInitial(rset.getString("ARMOR_INITIASL"));
	        	armor.setArmorDate(rset.getTimestamp("ARMOR_DATE").toLocalDateTime());
	        	armor.setArmorUse(rset.getString("ARMOR_USE"));
	        
	        }

	        close(rset);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return armor;
	}
	
	
	public int enhancearmor(String armorName, Connection conn) {
	    int result = 0;
	    String sql = "UPDATE ARMOR SET ARMOR_NUM = ARMOR_NUM + 1 WHERE ARMOR_NAME = ?";

	    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, armorName);
	        result = pstmt.executeUpdate(); 
	   
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

