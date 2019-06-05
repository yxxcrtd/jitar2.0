package cn.edustar.jitar.pojos;

import java.io.Serializable;

public class Meetings implements Serializable {
	private static final long serialVersionUID = 4791301079420006109L;
	
	private int id;
	
	private String obj;
	
	private int objId;

	public Meetings() {
		//
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getObj() {
		return obj;
	}

	public void setObj(String obj) {
		this.obj = obj;
	}

	public int getObjId() {
		return objId;
	}

	public void setObjId(int objId) {
		this.objId = objId;
	}
	
}
