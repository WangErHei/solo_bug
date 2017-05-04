package bug.frontstage.notice_manage.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.notice_manage.dao.NoticeDao;
import bug.frontstage.notice_manage.model.Notify;
import bug.frontstage.notice_manage.service.IAddNotifyService;

@Service("AddNotifyServiceImp")
public class AddNotifyServiceImp implements IAddNotifyService {

	@Autowired
	private NoticeDao dao;
	@Override
	public void addNotify(Notify notify) {
		dao.addNotify(notify);
	}

}
