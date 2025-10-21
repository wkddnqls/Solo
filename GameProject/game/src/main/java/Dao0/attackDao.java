package Dao0;

import static JDBC.common.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import equipment0.armorcollection;
import equipment0.humancollection;

public class attackDao {
        
	
	public int attackMonster(String MonsterName, double Humanpower ,double MonsterDefensive,  Connection conn) {
	    int result = 0;
	    String sql = "UPDATE MONSTER SET MONSTER_NUM = MONSTER_NUM - (?*3) + ? WHERE MONSTER_NAME = ?";

	    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	       
	        pstmt.setDouble(1, Humanpower);
	        pstmt.setDouble(2, MonsterDefensive);
	        pstmt.setString(3, MonsterName);
	        result = pstmt.executeUpdate(); // 1이면 성공, 0이면 실패
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return result;
	}
	
	public int parryingHuman(String HumanName, double monsterPower , double HumanDefensive,  Connection conn) {
	    int result = 0;
	    String sql = "UPDATE HUMAN SET HUMAN_NUM = HUMAN_NUM - (?*2) + ? WHERE HUMAN_NAME = ?";

	    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	       
	        pstmt.setDouble(1, monsterPower);
	        pstmt.setDouble(2, HumanDefensive);
	        pstmt.setString(3, HumanName);
	        result = pstmt.executeUpdate(); // 1이면 성공, 0이면 실패
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return result;
	}
}
