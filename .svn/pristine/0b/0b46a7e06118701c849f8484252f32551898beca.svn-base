package bug.frontstage.notice_manage.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.notice_manage.dao.NoticeDao;
import bug.frontstage.notice_manage.service.IShowNoticeService;
@Service("ShowNoticeServiceImp")
public class ShowNoticeServiceImp implements IShowNoticeService {

	@Autowired
	private NoticeDao dao;
	@Override
	public List showNotice(int proId,String currpage,String everycount) {
		return dao.SelectAll(proId,currpage,everycount);
	}
	
	public int allNotifyNum(int pid){
		
		return dao.allNotifyNum(pid);
	}
	
	
	
}
