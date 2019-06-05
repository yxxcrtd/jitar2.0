package cn.edustar.jitar.service;

import cn.edustar.jitar.pojos.Meetings;

public interface MeetingsService {
	
	public Meetings getMeetingsByObjAndObjId(String obj, int objId);
	
	public void openMeetings(String obj, int objId);
	
	public void closeMeetings(String obj, int objId);
	
}
