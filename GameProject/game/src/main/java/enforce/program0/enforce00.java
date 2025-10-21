package enforce.program0;

import java.sql.Connection;
import java.util.Scanner;
import static JDBC.common.*;
import JDBC.common;
import Service0.Service;
import equipment0.swordcollection;
import Dao0.armorDao;
import Dao0.shieldDao;
import Dao0.swordDao;

public class enforce00 {
	 Scanner sc= new Scanner(System.in);
	 
	 private swordDao sd = new swordDao();
	 private shieldDao SED = new shieldDao();
	 private armorDao AM = new armorDao();
	 
	 
	 public void enforce0(String Name , int type) {
		    
		    Connection conn = common.go();

		    
		   
		   
		 
		    while(true) {
		    	
		    int randomNumber = (int)(Math.random() * 2) + 1; 
		    System.out.println("===================================================");
		    System.out.println("강화 시도! 1~2 중 숫자를 맞추세요 (확률 50 %).");
		    System.out.println("강화를 포기하려면 0을 입력하세요.");
		    System.out.print("입력: ");
		    int num = sc.nextInt();

		    
		    if(num == 0) { 
	            System.out.println("강화를 포기했습니다.");
	            break;
	        }
		    
		    if(num == randomNumber) {
		    	
		    	int result = 0 ;
		    	
		    	if(type == 1) {
	                result = sd.enhanceSword(Name, conn);
	            } else if(type == 2) {
	                result = SED.enhanceshield(Name, conn);
	            } else if(type == 3) {
	                result = AM.enhancearmor(Name, conn);
	            } 
	            
		    	
	            if(result > 0) {
	                commit(conn);
	                
	                System.out.println("강화 성공! SWORD_NUM +1");
	                break;
	            } else {
	                rollback(conn);
	                System.out.println("DB 업데이트 실패 😢");
	            }
	        } else {
	            System.out.println("강화 실패… 😢 (정답: " + randomNumber + ")");
	        }
		    }
	        
		    
		    close(conn);
	    }
	

	 public void enforce1(String Name , int type) {

		    Connection conn = common.go();
		    Scanner sc = new Scanner(System.in);

		   
		    

		    while(true) {
		    	int randomNumber = (int)(Math.random() * 3) + 1; 
		    	System.out.println("===================================================");
		        System.out.println("강화 시도! 1~3 중 숫자를 맞추세요 (확률 33 %).");
		        System.out.println("강화를 포기하려면 0을 입력하세요.");
		        System.out.print("입력: ");
		        int num = sc.nextInt();
		        sc.nextLine();

		        if(num == 0) { 
		            System.out.println("강화를 포기했습니다.");
		            break;
		        }

		        if(num == randomNumber) {
		        	int result = 0 ;
			    	
		        	if(type == 1) {
		                result = sd.enhanceSword(Name, conn);
		            } else if(type == 2) {
		                result = SED.enhanceshield(Name, conn);
		            } else if(type == 3) {
		                result = AM.enhancearmor(Name, conn);
		            } 
		            
		            
		            if(result > 0) {
		                commit(conn);
		               
		                System.out.println("강화 성공! SWORD_NUM +1");
		                break;
		            } else {
		                rollback(conn);
		                System.out.println("DB 업데이트 실패 😢");
		            }
		                    
		        } else {
		            System.out.println("강화 실패… 😢 (정답: " + randomNumber + ")");
		        }
		    }
	 }


public void enforce2(String Name , int type) {

    Connection conn = common.go();
    Scanner sc = new Scanner(System.in);

   

    while(true) {
    	
    	int randomNumber = (int)(Math.random() * 4) + 1;
    	System.out.println("===================================================");
        System.out.println("강화 시도! 1~4 중 숫자를 맞추세요.(확률 25 %)");
        System.out.println("강화를 포기하려면 0을 입력하세요.");
        System.out.print("입력: ");
        int num = sc.nextInt();
        sc.nextLine(); 

        if(num == 0) {
            System.out.println("강화를 포기했습니다.");
            break;
        }

        if(num == randomNumber) {
        	
        	int result = 0 ;
        	if(type == 1) {
                result = sd.enhanceSword(Name, conn);
            } else if(type == 2) {
                result = SED.enhanceshield(Name, conn);
            } else if(type == 3) {
                result = AM.enhancearmor(Name, conn);
            } 
            
            
            if(result > 0) {
                commit(conn);
                
                System.out.println("강화 성공! SWORD_NUM +1");
                break;
            } else {
                rollback(conn);
                System.out.println("DB 업데이트 실패 😢");
            }
                    
        } else {
            System.out.println("강화 실패… 😢 (정답: " + randomNumber + ")");
        }
    }
}

public void enforce3(String Name , int type) {

    Connection conn = common.go();
    Scanner sc = new Scanner(System.in);


    while(true) {
    	int randomNumber = (int)(Math.random() * 5) + 1; 
    	System.out.println("===================================================");
        System.out.println("강화 시도! 1~5 중 숫자를 맞추세요. (확률 20 %) ");
        System.out.println("강화를 포기하려면 0을 입력하세요.");
        System.out.print("입력: ");
        int num = sc.nextInt();
        sc.nextLine();

        if(num == 0) { 
            System.out.println("강화를 포기했습니다.");
            break;
        }

        if(num == randomNumber) {
        	int result = 0 ;
        	
        	if(type == 1) {
                result = sd.enhanceSword(Name, conn);
            } else if(type == 2) {
                result = SED.enhanceshield(Name, conn);
            } else if(type == 3) {
                result = AM.enhancearmor(Name, conn);
            } 
            
            
            if(result > 0) {
                commit(conn);
                
                System.out.println("강화 성공! SWORD_NUM +1");
                break;
            } else {
                rollback(conn);
                System.out.println("DB 업데이트 실패 😢");
            }
                    
        } else {
            System.out.println("강화 실패… 😢 (정답: " + randomNumber + ")");
        }
    }
}



public void enforce4(String Name , int type) {

    Connection conn = common.go();
    Scanner sc = new Scanner(System.in);

   

    while(true) {
    	int randomNumber = (int)(Math.random() * 6) + 1; 
    	System.out.println("===================================================");
        System.out.println("강화 시도! 1~6 중 숫자를 맞추세요.(확률 16 %)");
        System.out.println("강화를 포기하려면 0을 입력하세요.");
        System.out.print("입력: ");
        int num = sc.nextInt();
        sc.nextLine(); 

        if(num == 0) { 
            System.out.println("강화를 포기했습니다.");
            break;
        }

        if(num == randomNumber) {
        	int result = 0 ;
	    	
        	if(type == 1) {
                result = sd.enhanceSword(Name, conn);
            } else if(type == 2) {
                result = SED.enhanceshield(Name, conn);
            } else if(type == 3) {
                result = AM.enhancearmor(Name, conn);
            } 
            
            
            if(result > 0) {
                commit(conn);
               
                System.out.println("강화 성공! SWORD_NUM +1");
                break;
            } else {
                rollback(conn);
                System.out.println("DB 업데이트 실패 😢");
            }
                    
        } else {
            System.out.println("강화 실패… 😢 (정답: " + randomNumber + ")");
        }
    }
}




public void enforce5(String Name , int type) {

    Connection conn = common.go();
    Scanner sc = new Scanner(System.in);

    

    while(true) {
    	 int randomNumber = (int)(Math.random() * 7) + 1; 
    	 System.out.println("===================================================");
        System.out.println("강화 시도! 1~7 중 숫자를 맞추세요.(확률 14 %)");
        System.out.println("강화를 포기하려면 0을 입력하세요.");
        System.out.print("입력: ");
        int num = sc.nextInt();
        sc.nextLine(); 

        if(num == 0) { 
            System.out.println("강화를 포기했습니다.");
            break;
        }

        if(num == randomNumber) {
        	int result = 0 ;
	    	
        	if(type == 1) {
                result = sd.enhanceSword(Name, conn);
            } else if(type == 2) {
                result = SED.enhanceshield(Name, conn);
            } else if(type == 3) {
                result = AM.enhancearmor(Name, conn);
            } 
            
            
            if(result > 0) {
                commit(conn);
               
                System.out.println("강화 성공! SWORD_NUM +1");
                break;
            } else {
                rollback(conn);
                System.out.println("DB 업데이트 실패 😢");
            }
                    
        } else {
            System.out.println("강화 실패… 😢 (정답: " + randomNumber + ")");
        }
    }
}


























}