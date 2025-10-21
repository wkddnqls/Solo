package Service0;

import java.sql.Connection;
import java.util.Scanner;

import equipment0.humancollection;
import equipment0.monstercollection;
import Dao0.humanDao;
import Dao0.monsterDao;

public class attackService01 {

    private Scanner sc = new Scanner(System.in);
    private humanDao HD = new humanDao();
    private monsterDao MD = new monsterDao();

    /**
     * 전투 후 현재 상태 출력
     */
    public void printStatus(humancollection H, monstercollection M, Connection conn) {
        humancollection result1 = HD.selectHuman(H.getHumanName(), conn);    
        monstercollection result2 = MD.selectMoster(M.getMonsterName(), conn);
        
      
        System.out.println(result2.getMonsterName() + " 현제 체력 : " + result2.getMonsterNum());
        System.out.println("/////////////////////////////////////////////////////");
        System.out.println(result1.getHumanName() + " 유저 현제 체력 : " + result1.getHumanNum());
        System.out.println();
    }

    /**
     * 공격 또는 방어 시도 (랜덤 확률)
     * @param action "공격" 또는 "방어"
     * @param range 선택 가능한 숫자 범위 (ex: 2 → 1~2 중 선택)
     * @return true → 성공, false → 실패 or 포기
     */
    
    public boolean parryingattack(String action, int range) {
        int randomNum = (int)(Math.random() * range) + 1;
        
        System.out.println(action + " 시도 1~" + range + " 선택하세요 (확률 " + (100/range) + "%).");
        System.out.println("포기하려면 0 입력");
        System.out.print("입력: ");
        int num = sc.nextInt();

        if (num == 0) {
            System.out.println(action + "을(를) 포기했습니다.");
            System.out.println();
            return false;
        }
        if (num == randomNum) { // ✅ 성공한 경우
            if (action.equals("공격")) {
                System.out.println("      (ง •̀_•́)ง");
                System.out.println("    =====================");
                System.out.println("       ⚔️  공격 성공! ⚔️");
                System.out.println("    =====================");
                System.out.println("        몬스터에게 타격!");
                System.out.println();
            } else if (action.equals("방어")) {
                System.out.println("       🛡️  ( •̀ᴗ•́ )و");
                System.out.println("    =====================");
                System.out.println("         방어 성공! ");
                System.out.println("    =====================");
                System.out.println("       [피해 없음!]");
                System.out.println();
            }
            System.out.println();
            return true;
        } else { // ❌ 실패한 경우
            if (action.equals("공격")) {
                System.out.println("     (；￣Д￣) ");
                System.out.println("    =====================");
                System.out.println("        공격 실패 … 😢");
                System.out.println("    =====================");
                System.out.println("      [공격이 빗나갔습니다!]");
                System.out.println();
            } else if (action.equals("방어")) {
                System.out.println("      (×﹏×)   💥");
                System.out.println("    =====================");
                System.out.println("         방어 실패 …");
                System.out.println("    =====================");
                System.out.println("       [피해를 입었습니다!]");
                System.out.println();
            }
            System.out.println("(정답은 " + randomNum + ")");
            System.out.println();
            return false;
        }
    }

}
