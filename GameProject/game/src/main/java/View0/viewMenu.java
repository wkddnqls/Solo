
/*
package View0;

import java.util.List;
import java.util.Scanner;

import Controller0.Cotroller1;
import Controller0.attackCotroller;
import Controller0.humanController;
import Controller0.monsterController;
import Service0.Service;
// import enforce.program.enforce1;
import enforce.program0.enforce00;
import equipment0.armorcollection;
import equipment0.shieldcollection;
import equipment0.swordcollection;

public class viewMenu {
   Scanner sc= new Scanner(System.in);
   Service ss = new Service(); 
   Cotroller1 SC = new Cotroller1();
   monsterController MC = new monsterController();
   humanController HC = new humanController();
   attackCotroller AC = new attackCotroller();
    //enforce1 ex = new enforce1();
	public void Menu() {
		while(true) {
		System.out.println("========= 강화 관리 프로그램 ==============");
		System.out.println("1. 강화하기 ");
		System.out.println("2. 강화한 전체 목록 조회 (전체출력기능)");
		System.out.println("3. 강화할 장비 이름 저장 (저장기능)");
		System.out.println("4. 강화목록 삭제하기( 삭제기능) ");
		System.out.println("5. 강화한 목록 키워로 검색 ( 검색 기능) ");
		System.out.println("6. 강화 목록 사용처 수정하기 (수정기능)");
		System.out.println("7. 유저에 대한 옵션 보기 ");
		System.out.println("8. 몬스터 옵션 보기 ");
	    System.out.println("9. 몬스터 사냥하기");
		System.out.println("10. 프로그램 종료 ");
		System.out.println("메뉴 번호 입력 : ");
		int a = sc.nextInt();
		sc.nextLine();
		
		switch(a){
		case 1 : enforce(); break;	
		case 2 : SC.selectAll(); break;
		case 3 : insert(); break;
		case 4: delete(); break;
		case 5: selectkeyword(); break;
		case 6: update(); break;   
		case 7 : Human(); break;
		case 8 : Monster(); break;
		case 9 : Monsterattack(); break;
		case 10: System.out.println("프로그램을 종료합니다."); return;
		default: System.out.println("잘못 입력하셨습니다. ");
		}
		System.out.println();
		
		
	}
	}
	
	
	
	// 1. 강화하기 
	public void enforce() {
		
		System.out.println(" =============강화할 장비 선택============ ");
		System.out.println(" 1 소드 / 2 방패 / 3 방어구 : ");
		int a = sc.nextInt();
		sc.nextLine();
		
			
		
		switch(a){
		case 1 : 
			System.out.println(" 강화할 소드 이름  : ");
			String swordName = sc.nextLine();
			ss.enforceSword(swordName); break;	
			
		case 2 : 
			System.out.println(" 강화할 방패 이름  : ");
		    String shieldName = sc.nextLine();
		    ss.enforceshield(shieldName); 
		break;
		
		case 3 : 
			System.out.println(" 강화할 방어구 이름  : ");
		    String armorName = sc.nextLine();
		    ss.enforcearmor(armorName); 
			
			break;
		}
		
		
		
	}

	
	//3. 저장하기 데이터 저장 넣기 
	public void insert() {
		System.out.println(" =============추가할 장비 선택============ ");
		System.out.println(" 1 소드 / 2 방패 / 3 방어구 : ");
		int a = sc.nextInt();
		sc.nextLine();
		
		 Object item = null;
		
		switch(a){
		case 1 : 
			System.out.println("소드 이름 : ");
			String swordName = sc.nextLine();
			
			System.out.println("소드에 새길 이니셜 : ");
			String swordInitiasl = sc.nextLine();
			
			item = new swordcollection(swordName,swordInitiasl);
			
			SC.insert(item);
			
			
			break;
		case 2 : 
			System.out.println("방패 이름 : ");
			String shieldName = sc.nextLine();
			
			System.out.println("방패에 새길 이니셜 : ");
			String shieldInitiasl = sc.nextLine();
			
            item = new shieldcollection(shieldName,shieldInitiasl);
			
			SC.insert(item);
			
		break;
		
		case 3 : 
			System.out.println("방어구 이름 : ");
			String armorName = sc.nextLine();
			
			System.out.println("방어구에 새길 이니셜 : ");
			String armorInitiasl = sc.nextLine();
			
			item = new armorcollection(armorName,armorInitiasl);
			
			SC.insert(item);
			
			break;
		}
		
		
		
		
		
		
	}
	
	// 4. 삭제기능
	public void delete() {
		
		
		System.out.println(" =============삭제할 장비 선택============ ");
		System.out.println(" 1 소드 / 2 방패 / 3 방어구 : ");
		int a = sc.nextInt();
		sc.nextLine();
		Object item = null;
		
		switch(a){
		case 1 : 
			System.out.println(" ---------- 소드삭제 --------------- ");
			
			System.out.println(" 삭제할 소드 이름 : ");
			String swordName= sc.nextLine();

			item = new swordcollection(swordName);
			  
			SC.delete(swordName);	
			break;
		case 2 : 
            System.out.println(" ---------- 방패삭제 --------------- ");
			
			System.out.println(" 삭제할 방패 이름 : ");
			String shieldName= sc.nextLine();
			
		item = new shieldcollection(shieldName);
			
			
			SC.delete(item);	
		break;
		
		case 3 :  
	  System.out.println(" ---------- 방어구 삭제 --------------- ");
		
		System.out.println(" 삭제할 방어구 이름 : ");
		String armorName= sc.nextLine();

		item = new armorcollection(armorName);
		  
		SC.delete(armorName);	
		break;
		}
	
		
	}	
	
	
	
	// 5 .검색 
	public void selectkeyword() {
		
		System.out.println(" =============찾을 장비 선택============ ");
		System.out.println(" 1 소드 / 2 방패 / 3 방어구 : ");
		int a = sc.nextInt();
		sc.nextLine();
		Object item = null ;
		switch(a){
		case 1 : 
            System.out.println(" ---------- 소드에서 검색 --------------- ");
			
			System.out.println(" 찾을 소드(키워드) 이름 : ");
			String swordName= sc.nextLine();

			item = new swordcollection(swordName);
			  
			SC.selectkeyword(item);	
			
			break;
		
		case 2 : 
			
           System.out.println(" ---------- 방패에서 검색 --------------- ");
			
			System.out.println(" 찾을 방패(키워드) 이름 : ");
			String shieldName= sc.nextLine();

			item = new shieldcollection(shieldName);
			  
			SC.selectkeyword(item);	
			
			break;	
	
		
		case 3 : 
			
            System.out.println(" ---------- 방어구에서 검색 --------------- ");
			
			System.out.println(" 찾을 방어구(키워드) 이름 : ");
			String armorName= sc.nextLine();

			item = new armorcollection(armorName);
			  
			 SC.selectkeyword(item);	
			
			break;
			
			
		}
		
		
	}
	
	// 6 . 수정 업데이트
	public void update() {
		System.out.println(" =============수정할 장비 선택============ ");
		System.out.println(" 1 소드 / 2 방패 / 3 방어구 : ");
		int a = sc.nextInt();
		sc.nextLine();
		Object item = null;
		switch(a){
		case 1 : 
			System.out.println(" ----------업데이트 --------------- ");
			System.out.println(" 수정할 소드(Name) : ");
			String swordName= sc.nextLine();
			
			
			System.out.println(" 수정할 소드 사용처 : ");
			String swordUse= sc.nextLine();
			
			item = new swordcollection(swordName);
			  
			SC.update(item,swordUse);	
		
			break;
		case 2 : 
			System.out.println(" ---------- 업데이트 --------------- ");
			System.out.println(" 수정할 방패(Name) : ");
			String shieldName= sc.nextLine();
			
			
			System.out.println(" 수정할 방패 사용처 : ");
			String shieldUse= sc.nextLine();
			
			item = new swordcollection(shieldName);
			  
			SC.update(item,shieldUse);	
		
		break;
		
		case 3 : 
			System.out.println(" ---------- 업데이트 --------------- ");
			System.out.println(" 수정할 방어구(Name) : ");
			String armorName= sc.nextLine();
			
			
			System.out.println(" 수정할 방어구 사용처 : ");
			String armorUse= sc.nextLine();
			item = new swordcollection(armorName);
			  
			SC.update(item,armorUse);	
break;
		}
	
	}
	
	
	
	public void Human() {
		System.out.println(" =============유저(휴먼) 옵션 선택 ============ ");
		System.out.println(" 1 생성  /  2 정보보기 / 3. 장비 장착하기 / 4. 유저 삭제 ");
		int a = sc.nextInt();
		sc.nextLine();
		
		
		
		switch(a) {
		
		case 1 : 
		System.out.println(" ============= 유저(휴먼) 생성 ============ ");
		System.out.println(" 이름 : ");
		String HumanName = sc.nextLine();
	
		System.out.println(" 체력 : ");
		int HumanNum = sc.nextInt();
		sc.nextLine();
		System.out.println(" 공격력 : ");
		int HumanPower = sc.nextInt();
		sc.nextLine();
		System.out.println(" 방어력 : ");
		int HumanDefensive = sc.nextInt();
		sc.nextLine();
		
		HC.insertHuman(HumanName,HumanNum,HumanPower,HumanDefensive );
	     break;
	     
		case 2:
			HC.selectHuman();
			break;
		case 3 : 
			System.out.println(" ============= 장착할 유저 선택 ============ ");
			System.out.println(" 유저 이름 : ");
			String humanName = sc.nextLine();
			
			
			
			
			System.out.println(" ============= 장착할 장비 선택 ============ ");
			System.out.println(" 1 소드 / 2 방패 / 3 방어구 / 4 종료 : ");
			int b = sc.nextInt();
			sc.nextLine();
			
			switch(b) {
			case 1 : 
				System.out.println(" ============= 장착할 소드 선택 ============ ");
				System.out.println(" 소드 이름 : ");
				String swordName = sc.nextLine();
				
				
				HC.swordupdate(swordName,humanName);
				break;
			case 2 :
				System.out.println(" ============= 방패 선택 ============ ");
				System.out.println(" 방패 이름 : ");
				String shieldName = sc.nextLine();
				
				
				HC.shieldupdate(shieldName,humanName);
				break;
			case 3 :
				System.out.println(" ============= 방어구 선택 ============ ");
				System.out.println(" 방어구 이름 : ");
				String armorName = sc.nextLine();
				
				
				HC.armorupdate(armorName,humanName);
				break;
			case 4 : System.out.println("장착 취소 (종료)"); return;	
			}
			 break;
		case 4:
			System.out.println(" ============= 유저 삭제 ============ ");
			System.out.println(" 삭제할 유저 이름 : ");
			String deleteHumanName = sc.nextLine();
			
			
			HC.deleteHuman(deleteHumanName);
			break;	
		
		
		
		}
	}
	
	//몬스터 생성하기 
	public void Monster() {
		System.out.println(" =============몬스터 옵션 선택 ============ ");
		System.out.println(" 1 생성  /  2 몬스터 정보보기  / 3 . 몬스터 삭제 ");
		int a = sc.nextInt();
		sc.nextLine();
		
		
		
		switch(a) {
		
		case 1 : 
		System.out.println(" ============= 몬스터 생성 ============ ");
		System.out.println(" 이름 : ");
		String monsterName = sc.nextLine();
	
		System.out.println(" 체력 : ");
		int monsterNum = sc.nextInt();
		sc.nextLine();
		System.out.println(" 공격력 : ");
		int monsterPower = sc.nextInt();
		sc.nextLine();
		System.out.println(" 방어력 : ");
		int monsterDefensive = sc.nextInt();
		sc.nextLine();
		MC.insertMonster(monsterName,monsterNum,monsterPower,monsterDefensive );
	     break;
	     
		case 2:
			MC.slectMoster();
			break;
		case 3:
			System.out.println(" ============= 몬스터 삭제 ============ ");
			System.out.println(" 삭제할 몬스터 이름 : ");
			String deletemonsterName = sc.nextLine();
			
			
			MC.deleteMoster(deletemonsterName);
			break;	
		}
	}
		
		
	//몬스터와 싸우기 
	public void Monsterattack() {
		
		System.out.println(" =============몬스터 선택 ============ ");
		System.out.println(" 1 몬스터 이름을 입력하세요 : ");
		String MonsterName = sc.nextLine();
		
		MC.selectMoster(MonsterName);
		System.out.println();
		System.out.println(" =============유저 선택 ============ ");
		System.out.println(" 1 유저 이름을 입력하세요 : ");
		String HumanName = sc.nextLine();
		
		HC.selectHuman(HumanName);
		
		System.out.println();
		System.out.println(" ============= 행동 선택 ============ ");
		System.out.println(" 1 레이드(공격) /  2 도망가기 : ");
		int a = sc.nextInt();
		sc.nextLine();
		
        switch(a) {
		
		case 1 : 
		 AC.attack0(MonsterName,HumanName);
	     break;
	     
		case 2:
			System.out.println(" 도망가기 "); return;
		}
		
		}
	
		
		
		
		
	
	
	
	
	public static void displayList(List list , String title) {
		System.out.println("=================="+title+" ================");

		for (Object item : list) {
		    System.out.println(item);
		}
		
	}
	
	
}
*/

