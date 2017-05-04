package bug.frontstage.notice_manage.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.notice_manage.dao.NoticeDao;
import bug.frontstage.notice_manage.model.Notify;
import bug.frontstage.notice_manage.service.IUpdateNotifyService;
@Service("UpdateNotifyServiceImp")
public class UpdateNotifyServiceImp implements IUpdateNotifyService {

	@Autowired
	private NoticeDao dao;
	@Override
	public void updateNotify(Notify notify) {
		dao.updateNotify(notify);

	}

}
