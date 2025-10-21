package Controller0;

import Service0.attackService01;
import Service0.humanService;
import Service0.monsterService;
import View0.viewMenu;
import attack0.attackService02;
import equipment0.humancollection;
import equipment0.monstercollection;


public class attackCotroller {
	private monsterService MS = new monsterService();
	private humanService HS = new humanService();
	private attackService01 AS = new attackService01();
	private attackService02 AA = new attackService02();

	
	public void attack0(String MonsterName , String HumanName  ) {
		
		
		monstercollection M = MS.selectMoster(MonsterName);
		M.setMonsterName(MonsterName);
		humancollection H = HS.selectHuman(HumanName);
		H.setHumanName(HumanName);
		
		
	if(M.getMonsterNum()<=0) {
		System.out.println("       (x_x)   ⚔️");
	    System.out.println("================================");
	    System.out.println("   몬스터는 이미 쓰러졌습니다!");
	    System.out.println("   다른 대상을 선택해주세요.");
	    System.out.println("================================");
	    System.out.println();
	    return;
	    }else if(M.getMonsterNum()<=100) {
			    AA.attack100(H,M);
		}else if(100<M.getMonsterNum() && M.getMonsterNum()<=200) {
				AA.attack200(H, M);
		}else if(M.getMonsterNum()>200) {
			    AA.attack300(H, M);
		}
	
   }
}
