package bug.frontstage.notice_manage.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.notice_manage.dao.NoticeDao;
import bug.frontstage.notice_manage.service.CommService;


@Service("CommServiceimp")
public class CommServiceimp implements CommService{

	@Autowired
	private NoticeDao  noticeDao;
	
	
	@Override
	public void comm(int comm_id, String content) {
		noticeDao.comm(comm_id, content);
		
	}

	@Override
	public void deleteComm(int comm_id) {
		noticeDao.deleteComm(comm_id);		
	}

}
