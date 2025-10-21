package equipment0;

import java.util.ArrayList;
import java.util.List;

public class equipmentcollection {
  
	private List<swordcollection> swords;
    private List<shieldcollection> shields;
    private List<armorcollection>  armor;
 
    public List<armorcollection> getArmor() {
		return armor;
	}

	public void setArmor(List<armorcollection> armor) {
		this.armor = armor;
	}

	
	public equipmentcollection() {
	    this.swords = new ArrayList<>();
	    this.shields = new ArrayList<>();
	    this.armor = new ArrayList<>();
	}
	public equipmentcollection(List<swordcollection> swords) {
		super();
		this.swords = swords;
	}

	  public equipmentcollection(List<swordcollection> swords, List<shieldcollection> shields, List<armorcollection> armor) {
	        this.swords = (swords != null) ? swords : new ArrayList<>();
	        this.shields = (shields != null) ? shields : new ArrayList<>();
	        this.armor = (armor != null) ? armor : new ArrayList<>();
	    }
	public equipmentcollection(List<swordcollection> swords, List<shieldcollection> shields) {
        this.swords = swords;
        this.shields = shields;
    }

    public void setSwords(List<swordcollection> swords) {
		this.swords = swords;
	}

	public void setShields(List<shieldcollection> shields) {
		this.shields = shields;
	}

	public List<swordcollection> getSwords() {
        return swords;
    }

    public List<shieldcollection> getShields() {
        return shields;
    }
   



}

