package equipment0;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.NonNull;

@Data // getter, setter, toString, equals, hashCode 자동 생성
@NoArgsConstructor // 기본 생성자
@RequiredArgsConstructor
@AllArgsConstructor
public class humancollection {

    @NonNull
    private String humanName;

    private double humanNum;
    private double humanPower;
    private double humanDefensive;
    private String humanSpecslist;

    
    public humancollection(String humanName, double humanNum, double humanPower, double humanDefensive) {
        this.humanName = humanName;
        this.humanNum = humanNum;
        this.humanPower = humanPower;
        this.humanDefensive = humanDefensive;
    }
    // 특정 필드만 포함하는 생성자는 @RequiredArgsConstructor 활용 가능
    // 예: humanName만 필수로 하는 생성자
    // @RequiredArgsConstructor
    // private String humanName;
}
