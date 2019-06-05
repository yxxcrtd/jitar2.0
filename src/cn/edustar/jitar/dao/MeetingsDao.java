package cn.edustar.jitar.dao;

import cn.edustar.jitar.pojos.Meetings;

public interface MeetingsDao extends Dao {
	
	public Meetings getMeetingsByObjAndObjId(String obj, int objId);
	
	public void saveMeetings(Meetings meetings);
	
	public void delMeetings(Meetings meetings);

}
