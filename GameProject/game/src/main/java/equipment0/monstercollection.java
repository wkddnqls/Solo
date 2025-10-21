package equipment0;

public class monstercollection {
String monsterName ;
int monsterNum;
int monsterPower ;
int monsterDefensive;

public monstercollection(String monsterName) {
	super();
	this.monsterName = monsterName;
}

public monstercollection(String monsterName, int monsterNum, int monsterPower, int monsterDefensive) {
	super();
	this.monsterName = monsterName;
	this.monsterNum = monsterNum;
	this.monsterPower = monsterPower;
	this.monsterDefensive = monsterDefensive;
}

public monstercollection() {
	super();
}

public String getMonsterName() {
	return monsterName;
}

public void setMonsterName(String monsterName) {
	this.monsterName = monsterName;
}

public int getMonsterNum() {
	return monsterNum;
}

public void setMonsterNum(int monsterNum) {
	this.monsterNum = monsterNum;
}

public int getMonsterPower() {
	return monsterPower;
}

public void setMonsterPower(int monsterPower) {
	this.monsterPower = monsterPower;
}

public int getMonsterDefensive() {
	return monsterDefensive;
}

public void setMonsterDefensive(int monsterDefensive) {
	this.monsterDefensive = monsterDefensive;
}

@Override
public String toString() {
	return "몬스터 정보 [몬스터 이름 =" + monsterName + ", 몬스터 체력 =" + monsterNum + ", 몬스터 공격력 = "
			+ monsterPower + ", 몬스터 방어력 = " + monsterDefensive + "]";
}
	
}
