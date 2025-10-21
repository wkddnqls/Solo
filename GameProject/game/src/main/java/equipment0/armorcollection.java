package equipment0;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class armorcollection {
    private String armorName;
    private int armorNum;
    private String armorInitial;
    private LocalDateTime armorDate;
    private String armorUse;

    // DB 저장용 생성자 (날짜 제외, num 포함)
    public armorcollection(String armorName, int armorNum, String armorInitiasl, String armorUse) {
        this.armorName = armorName;
        this.armorNum = armorNum;
        this.armorInitial = armorInitiasl;
        this.armorUse = armorUse;
    }

    // DB 저장용 생성자 (날짜 제외, num 없이)
    public armorcollection(String armorName, String armorInitiasl, String armorUse) {
        this.armorName = armorName;
        this.armorInitial = armorInitiasl;
        this.armorUse = armorUse;
    }

    // 이름 + 이니셜 생성자
    public armorcollection(String armorName, String armorInitiasl) {
        this.armorName = armorName;
        this.armorInitial = armorInitiasl;
    }

    // 이름만 생성자
    public armorcollection(String armorName) {
        this.armorName = armorName;
    }
}
