package equipment0;

public class humancollection {
	String humanName ;
	double humanNum;
	double humanPower ;
	double humanDefensive;
	String humanSpecslist;
	public humancollection(String humanName, int humanNum, int humanPower, int humanDefensive) {
		super();
		this.humanName = humanName;
		this.humanNum = humanNum;
		this.humanPower = humanPower;
		this.humanDefensive = humanDefensive;
	}
	public humancollection() {
		super();
	}
	public humancollection(String humanName) {
		super();
		this.humanName = humanName;
	}
	public humancollection(String humanName, int humanNum, int humanPower, int humanDefensive, String humanSpecslist) {
		super();
		this.humanName = humanName;
		this.humanNum = humanNum;
		this.humanPower = humanPower;
		this.humanDefensive = humanDefensive;
		this.humanSpecslist = humanSpecslist;
	}
	public String getHumanName() {
		return humanName;
	}
	public void setHumanName(String humanName) {
		this.humanName = humanName;
	}
	public double getHumanNum() {
		return humanNum;
	}
	public void setHumanNum(double humanNum) {
		this.humanNum = humanNum;
	}
	public double getHumanPower() {
		return humanPower;
	}
	public void setHumanPower(double humanPower) {
		this.humanPower = humanPower;
	}
	public double getHumanDefensive() {
		return humanDefensive;
	}
	public void setHumanDefensive(double humanDefensive) {
		this.humanDefensive = humanDefensive;
	}
	public String getHumanSpecslist() {
		return humanSpecslist;
	}
	public void setHumanSpecslist(String humanSpecslist) {
		this.humanSpecslist = humanSpecslist;
	}
	@Override
	public String toString() {
		return "유저 정보 [유저 이름 = " + humanName + ", 유저 체력 =" + humanNum + ", 유저 공격력 =" + humanPower
				+ ", 유저 방어력 =" + humanDefensive + ", 유저 장착장비 = " + humanSpecslist + "]";
	}
	
	
}
