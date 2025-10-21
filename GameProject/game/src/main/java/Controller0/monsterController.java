package Controller0;

import java.util.List;

import Service0.Service;
import Service0.monsterService;
import View0.viewMenu;
import equipment0.monstercollection;

public class monsterController {
	private Service ss = new Service();
	private monsterService MS = new monsterService();
	public void insertMonster(String monsterName,int monsterNum , int monsterPower , int monsterDefensive ) {
		 
		monstercollection M = new monstercollection(monsterName,monsterNum , monsterPower , monsterDefensive);
		
		
		  int result = MS.instertMonster(M);
		  
		  if(result>0) {
			   System.out.println("성공적으로 몬스터가 추가되었습니다 ");
		   }else {
			   System.out.println(" 추가실패 ");
		   }
	}

 public List<monstercollection> slectMoster() {
 
	 List<monstercollection> list4 = MS.slectMoster();
 
 if(list4.isEmpty()) {
	 System.out.println(" 실패 ");
  }else {
	  viewMenu.displayList(list4 , "몬스터 조회완료");
  }
 return list4;
}
 
 
 public void selectMoster(String MonsterName) {
	 
	 
	 
	 monstercollection result = MS.selectMoster(MonsterName);
	 
	 if(result == null) {
		    System.out.println("해당 몬스터가 존재하지 않습니다.");
		    return;
		} else {
		    System.out.println("몬스터 이름 : " + result.getMonsterName());
		    System.out.print(" 체력 : " + result.getMonsterNum());
		    System.out.print(" / 공격력 : " + result.getMonsterPower());
		    System.out.println(" / 방어력 : " + result.getMonsterDefensive());
		}
	 
	 
 }
 
 public void deleteMoster(String delectmonsterName) {
	
	
	 monstercollection M = new monstercollection(delectmonsterName);
	 
	 M.setMonsterName(delectmonsterName);
	 
	 int result = MS.deleteMoster(M);
	
	 if(result>0) {
		   System.out.println("성공적으로 몬스터가 삭제되었습니다 ");
	   }else {
		   System.out.println(" 삭제실패 ");
	   }
 }
 
 
 
 
 
 
 
 
 
}
