package cn.edustar.jitar.dao.hibernate;

import java.util.List;

import cn.edustar.jitar.dao.MeetingsDao;
import cn.edustar.jitar.pojos.Meetings;

@SuppressWarnings("unchecked")
public class MeetingsDaoHibernate extends BaseDaoHibernate implements MeetingsDao {

	public Meetings getMeetingsByObjAndObjId(String obj, int objId) {
		List<Meetings> list = this.getSession().createQuery("FROM Meetings WHERE obj = ? AND objId = ?").setString(0, obj).setInteger(1, objId).list();
		return (Meetings) ((null != list && list.size() > 0) ? list.get(0) : null);
	}
	
	public void saveMeetings(Meetings meetings) {
		this.getSession().save(meetings);
	}
	
	public void delMeetings(Meetings meetings) {
		this.getSession().delete(meetings);
	}

	@Override
	public void evict(Object object) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void flush() {
		// TODO Auto-generated method stub
		
	}
	
}
