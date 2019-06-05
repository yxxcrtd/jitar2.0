package cn.edustar.jitar.service.impl;

import cn.edustar.jitar.dao.MeetingsDao;
import cn.edustar.jitar.pojos.Meetings;
import cn.edustar.jitar.service.MeetingsService;

public class MeetingsServiceImpl implements MeetingsService {

	private MeetingsDao meetingsDao;
	
	public void setMeetingsDao(MeetingsDao meetingsDao) {
		this.meetingsDao = meetingsDao;
	}

	@Override
	public Meetings getMeetingsByObjAndObjId(String obj, int objId) {
		return meetingsDao.getMeetingsByObjAndObjId(obj, objId);
	}

	@Override
	public void openMeetings(String obj, int objId) {
		if (null == meetingsDao.getMeetingsByObjAndObjId(obj, objId)) {
			Meetings meetings = new Meetings();
			meetings.setObj(obj);
			meetings.setObjId(objId);
			meetingsDao.saveMeetings(meetings);
		}
	}

	@Override
	public void closeMeetings(String obj, int objId) {
		Meetings meetings = meetingsDao.getMeetingsByObjAndObjId(obj, objId);
		if (null != meetings) {
			meetingsDao.delMeetings(meetings);
		}
	}
	
}
