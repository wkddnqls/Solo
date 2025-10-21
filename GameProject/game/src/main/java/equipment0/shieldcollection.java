package equipment0;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class shieldcollection {
    private String shieldName;
    private int shieldNum;
    private String shieldInitial;
    private LocalDateTime shieldDate;
    private String shieldUse;

    // DB 저장용 생성자 (날짜 제외, num 포함)
    public shieldcollection(String shieldName, int shieldNum, String shieldInitiasl, String shieldUse) {
        this.shieldName = shieldName;
        this.shieldNum = shieldNum;
        this.shieldInitial = shieldInitiasl;
        this.shieldUse = shieldUse;
    }

    // DB 저장용 생성자 (날짜 제외, num 없이)
    public shieldcollection(String shieldName, String shieldInitiasl, String shieldUse) {
        this.shieldName = shieldName;
        this.shieldInitial = shieldInitiasl;
        this.shieldUse = shieldUse;
    }

    // 이름 + 이니셜 생성자
    public shieldcollection(String shieldName, String shieldInitiasl) {
        this.shieldName = shieldName;
        this.shieldInitial = shieldInitiasl;
    }

    // 이름만 생성자
    public shieldcollection(String shieldName) {
        this.shieldName = shieldName;
    }
}