
package equipment0;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor    
@AllArgsConstructor
public class swordcollection {
    private String swordName;       // SWORD_NAME
    private int swordNum;           // SWORD_NUM
    private String swordInitial;    // SWORD_INITIAL
    private LocalDateTime swordDate; // SWORD_DATE
    private String swordUse;        // SWORD_USE

    // DB 저장용 생성자 (날짜 제외)
    public swordcollection(String swordName, String swordInitial, int swordNum, String swordUse) {
        this.swordName = swordName;
        this.swordInitial = swordInitial;
        this.swordNum = swordNum;
        this.swordUse = swordUse;
    }

    // DB 저장용 생성자 (날짜 제외, num 없이)
    public swordcollection(String swordName, String swordInitial, String swordUse) {
        this.swordName = swordName;
        this.swordInitial = swordInitial;
        this.swordUse = swordUse;
    }
}





/*package equipment0;

import java.time.LocalDateTime;

public class swordcollection {
    private String swordName;       // SWORD_NAME
    private int swordNum;           // SWORD_NUM
    private String swordInitial;    // SWORD_INITIAL
    private LocalDateTime swordDate; // SWORD_DATE
    private String swordUse;        // SWORD_USE

    // 기본 생성자
    public swordcollection() {}

    // DB 저장용 생성자 (날짜 제외, DB에서 자동 입력됨)
    public swordcollection(String swordName, String swordInitial, int swordNum, String swordUse) {
        this.swordName = swordName;
        this.swordInitial = swordInitial;
        this.swordNum = swordNum;
        this.swordUse = swordUse;
    }
    
    public swordcollection(String swordName, String swordInitial, String swordUse) {
        this.swordName = swordName;
        this.swordInitial = swordInitial;
        this.swordUse = swordUse;
    }

    // 전체 생성자 (날짜까지)
    public swordcollection(String swordName, String swordInitial, int swordNum, LocalDateTime swordDate, String swordUse) {
        this.swordName = swordName;
        this.swordInitial = swordInitial;
        this.swordNum = swordNum;
        this.swordDate = swordDate;
        this.swordUse = swordUse;
    }

    // getter / setter
    public String getSwordName() { return swordName; }
    public void setSwordName(String swordName) { this.swordName = swordName; }

    public int getSwordNum() { return swordNum; }
    public void setSwordNum(int swordNum) { this.swordNum = swordNum; }

    public String getSwordInitial() { return swordInitial; }
    public void setSwordInitial(String swordInitial) { this.swordInitial = swordInitial; }

    public LocalDateTime getSwordDate() { return swordDate; }
    public void setSwordDate(LocalDateTime swordDate) { this.swordDate = swordDate; }

    public String getSwordUse() { return swordUse; }
    public void setSwordUse(String swordUse) { this.swordUse = swordUse; }

    @Override
    public String toString() {
        return "SwordCollection [swordName=" + swordName + 
               ", swordNum=" + swordNum + 
               ", swordInitial=" + swordInitial + 
               ", swordDate=" + swordDate + 
               ", swordUse=" + swordUse + "]";
    }
}*/