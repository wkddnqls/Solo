package attack0;

import static JDBC.common.close;
import static JDBC.common.commit;
import static JDBC.common.rollback;

import java.sql.Connection;
import java.util.Scanner;

import Controller0.attackCotroller;
import JDBC.common;
import Service0.attackService01;
import equipment0.humancollection;
import equipment0.monstercollection;
import Dao0.armorDao;
import Dao0.attackDao;
import Dao0.humanDao;
import Dao0.monsterDao;
import Dao0.shieldDao;
import Dao0.swordDao;

public class attackService02 {
	Scanner sc= new Scanner(System.in);
	 
	 private swordDao sd = new swordDao();
	 private shieldDao SED = new shieldDao();
	 private armorDao AM = new armorDao();
    private attackDao AD = new attackDao();
    private humanDao HD = new humanDao();
    private monsterDao MD = new monsterDao();
  
    
    public int attack100(humancollection H, monstercollection M) {
        Connection conn = common.go();
        attackService01 service = new attackService01();
        boolean fighting = true;

        while (fighting) {
            if (service.parryingattack("공격", 4)) {  // 확률 25%
                int result = AD.attackMonster(M.getMonsterName(), H.getHumanPower(),M.getMonsterDefensive(), conn);
                if (result > 0) commit(conn); else rollback(conn);
            } else {
                if (!service.parryingattack("방어", 3)) {  // 방어도 33%
                    int result = AD.parryingHuman(H.getHumanName(), M.getMonsterPower(),H.getHumanDefensive(), conn);
                    if (result > 0) commit(conn); else rollback(conn);
                }
            }

            service.printStatus(H, M, conn);

            humancollection result1 = HD.selectHuman(H.getHumanName(), conn);
            monstercollection result2 = MD.selectMoster(M.getMonsterName(), conn);

            if (result2.getMonsterNum() <= 0 || result1.getHumanNum() <= 0) {
                fighting = false;
            }
        }

        humancollection result1 = HD.selectHuman(H.getHumanName(), conn);
        monstercollection result2 = MD.selectMoster(M.getMonsterName(), conn);

        if (result2.getMonsterNum() <= 0) {
        	    System.out.println("        \\\\(•̀ᴗ•́)//");
        	    System.out.println("          (   )   🎉");
        	    System.out.println("          <   >");
        	    System.out.println("================================");
        	    System.out.println("        전투 승리!!!");
        	    System.out.println("   당신은 몬스터를 처치했습니다!");
        	    System.out.println("================================");
        	    System.out.println();
        } else if (result1.getHumanNum() <= 0) {
            System.out.println("     ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖");
            System.out.println("   ✖      유저 전투 불능 …      ✖");
            System.out.println("     ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖");
            System.out.println("        (x_x)   💀   ⚔️");
            System.out.println();
        }

        close(conn);
        return 0;
    }

	

	 public int attack200(humancollection H, monstercollection M) {
		    Connection conn = common.go();
		    attackService01 service = new attackService01();
		    boolean fighting = true;

		    while (fighting) {
		        if (service.parryingattack("공격", 3)) {  // 확률 33%
		            int result = AD.attackMonster(M.getMonsterName(), H.getHumanPower(),M.getMonsterDefensive(), conn);
		            if (result > 0) commit(conn); else rollback(conn);
		        } else {
		            if (!service.parryingattack("방어", 2)) {  // 방어도 50%
		                int result = AD.parryingHuman(H.getHumanName(), M.getMonsterPower(),H.getHumanDefensive(), conn);
		                if (result > 0) commit(conn); else rollback(conn);
		            }
		        }

		        service.printStatus(H, M, conn);

		        humancollection result1 = HD.selectHuman(H.getHumanName(), conn);
		        monstercollection result2 = MD.selectMoster(M.getMonsterName(), conn);

		        if (result2.getMonsterNum() <= 100 || result1.getHumanNum() <= 0) {
		            fighting = false;
		        }
		    }

		    humancollection result1 = HD.selectHuman(H.getHumanName(), conn);
		    monstercollection result2 = MD.selectMoster(M.getMonsterName(), conn);

		    if (result2.getMonsterNum() <= 100) {
		    	System.out.println("   ⚠️  ⚔️  ⚠️  ⚔️  ⚠️");
		        System.out.println("================================");
		        System.out.println("   몬스터 체력 100 이하!!");
		        System.out.println("   마지막 단계 전환 중...");
		        System.out.println("================================");
		        System.out.println("   (ง •̀_•́)ง  →  🎲  →  ⚔️");
		        System.out.println();
		        attack100(H, M);
		    } else if (result1.getHumanNum() <= 0) {
		    	System.out.println("     ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖");
	            System.out.println("   ✖      유저 전투 불능 …      ✖");
	            System.out.println("     ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖");
	            System.out.println("        (x_x)   💀   ⚔️");
	            System.out.println();
		    }

		    close(conn);
		    return 0;
		}

	 
	 
	 public int attack300(humancollection H, monstercollection M) {
		    Connection conn = common.go();
		    attackService01 service = new attackService01(); // 유틸 메서드 사용
		    boolean fighting = true;

		    while (fighting) {
		        // 공격 시도
		    	
		        if (service.parryingattack("공격", 2)) {
		            int result = AD.attackMonster(M.getMonsterName(), H.getHumanPower(),M.getMonsterDefensive(), conn);
		            if (result > 0) commit(conn); else rollback(conn);
		        } 
		        // 공격 실패 → 방어 시도
		        
		        else {
		            if (!service.parryingattack("방어", 2)) {
		                int result = AD.parryingHuman(H.getHumanName(), M.getMonsterPower(),H.getHumanDefensive(), conn);
		                if (result > 0) commit(conn); else rollback(conn);
		            }
		        }

		        
		        // 현재 상태 출력
		        service.printStatus(H, M, conn);

		        // 갱신된 상태 확인
		        humancollection result1 = HD.selectHuman(H.getHumanName(), conn);    
		        monstercollection result2 = MD.selectMoster(M.getMonsterName(), conn);

		        // 전투 종료 조건
		        if (result2.getMonsterNum() <= 200 || result1.getHumanNum() <= 0) {
		            fighting = false;
		        }
		    }

		    // 전투 종료 후 결과 처리
		    humancollection result1 = HD.selectHuman(H.getHumanName(), conn);    
		    monstercollection result2 = MD.selectMoster(M.getMonsterName(), conn);

		    if (result2.getMonsterNum() <= 200) {
		    	System.out.println("   ⚠️  ⚔️  ⚠️  ⚔️  ⚠️");
		        System.out.println("================================");
		        System.out.println("   몬스터 체력 200 이하!!");
		        System.out.println("   공격 확률 조정 중...");
		        System.out.println("================================");
		        System.out.println("   (ง •̀_•́)ง  →  🎲  →  ⚔️");
		        System.out.println();
		        attack200(H, M);
		    } else if (result1.getHumanNum() <= 0) {
		    	System.out.println("     ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖");
	            System.out.println("   ✖      유저 전투 불능 …      ✖");
	            System.out.println("     ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖ ✖");
	            System.out.println("        (x_x)   💀   ⚔️");
	            System.out.println();
		    }

		    close(conn);
		    return 0;
		}
	 
/*
	 public int attack300(humancollection H , monstercollection M ) {
		    
		    Connection conn = common.go();
		   boolean A = true;
		    
		    
		    while(A) {
		    
		    int randomNumber = (int)(Math.random() * 2) + 1; 
		    System.out.println("===================================================");
		    System.out.println("공격 시도 1~2 선택하세요 (확률 50 %).");
		    System.out.println("공격을 포기하려면 0을 입력하세요.");
		    System.out.print("입력: ");
		    int number = sc.nextInt();

		    
		    if(number == 0) { 
	            System.out.println("공격을 포기했습니다.");
	            break;
	        }
		    
		    if(number == randomNumber) {
		    	
		    	
		    	
		    	int result = AD.attackMonster(M.getMonsterName(),H.getHumanPower(),conn);
		    	humancollection result1 = HD.selectHuman(H.getHumanName(),conn);    
		    	  monstercollection result2 = MD.selectMoster(M.getMonsterName(),conn);
	            
		    	  if(result > 0) {
	                commit(conn);
	                System.out.println("공격 성공 " );
	                System.out.println(result2.getMonsterName() + " 현제 체력 : " + result2.getMonsterNum());
	                System.out.println("/////////////////////////////////////////////////////");
	                System.out.println(result1.getHumanName() + " 유저 현제 체력 : " + result1.getHumanNum());
	               
	            } else {
	                rollback(conn);
	                System.out.println("DB 업데이트 실패 😢");
	            }
	           
	            
                
	        } 
		    else {
	        	System.out.println("공격 실패 … 😢 (정답: " + randomNumber + ")");
	        	int randomNum = (int)(Math.random() * 2) + 1; 
			    System.out.println("=================공격 실패 방어 시도 중====================");
			    System.out.println("방어 시도 1~2 선택하세요 (확률 50 %).");
			    System.out.println("방어를 포기하려면 0을 입력하세요.");
			    System.out.print("입력: ");
			    int num = sc.nextInt();
	           
			    if(num == 0) { 
		            System.out.println("방어를 포기했습니다.");
		            int result = AD.parryingHuman(H.getHumanName(),M.getMonsterPower(),conn);
		           
		              humancollection result1 = HD.selectHuman(H.getHumanName(),conn);    
			    	  monstercollection result2 = MD.selectMoster(M.getMonsterName(),conn);
			    	  System.out.println(result2.getMonsterName() + " 현제 체력 : " + result2.getMonsterNum());
		                System.out.println("/////////////////////////////////////////////////////");
		                System.out.println(result1.getHumanName() + " 유저 현제 체력 : " + result1.getHumanNum());
		           
		        }
			    
			    if(num == randomNum) {
			    	humancollection result1 = HD.selectHuman(H.getHumanName(),conn);    
			    	  monstercollection result2 = MD.selectMoster(M.getMonsterName(),conn);
			    	System.out.println("=================   방어 성공 ======================" );
			    	System.out.println(result2.getMonsterName() + " 현제 체력 : " + result2.getMonsterNum());
	                System.out.println("/////////////////////////////////////////////////////");
	                System.out.println(result1.getHumanName() + " 유저 현제 체력 : " + result1.getHumanNum());
		            
			    }else {
			    	System.out.println("방어 실패 … 😢 (정답: " + randomNum + ")");
                   
			    	int  result = AD.parryingHuman(H.getHumanName(),M.getMonsterPower(),conn);
			    	humancollection result1 = HD.selectHuman(H.getHumanName(),conn);    
			    	  monstercollection result2 = MD.selectMoster(M.getMonsterName(),conn);
			    	if(result > 0) {
		                commit(conn);
		                
		                System.out.println("방어 실패 " );
		                
		            } else {
		                rollback(conn);
		                System.out.println("오류 발생");
		            }
			    	
			    	System.out.println(result2.getMonsterName() + " 현제 체력 : " + result2.getMonsterNum());
	                System.out.println("/////////////////////////////////////////////////////");
	                System.out.println(result1.getHumanName() + " 유저 현제 체력 : " + result1.getHumanNum());
		           
			    }
			    
			    
			    }
		      humancollection result1 = HD.selectHuman(H.getHumanName(),conn);    
	    	  monstercollection result2 = MD.selectMoster(M.getMonsterName(),conn);
		    if(result2.getMonsterNum()<=200 || result1.getHumanNum()<=0) {
		     A= false;
		    }
		   
		    
		    
		    
		    
		    }
	        
		    humancollection result1 = HD.selectHuman(H.getHumanName(),conn);    
	    	  monstercollection result2 = MD.selectMoster(M.getMonsterName(),conn);
		    
		    if(result2.getMonsterNum()<=200) {
		    System.out.println("몬스터가 체력이 200 이하입니다 공격 확률이 조정됩니다. ");
		    attack200(H, M);
		    }else if (result1.getHumanNum()<=0) {
		    	System.out.println("유저 전투 불능 종료합니다.  ");
		    	
		    }
		    close(conn);
		    
			return 0;
			
	    } */




















}
