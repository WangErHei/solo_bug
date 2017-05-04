package bug.frontstage.notice_manage.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.notice_manage.dao.NoticeDao;
import bug.frontstage.notice_manage.service.IDeleteNotifyService;
@Service("DeleteNotifyServiceImp")
public class DeleteNotifyServiceImp implements IDeleteNotifyService {

	@Autowired
	private NoticeDao dao;
	@Override
	public void deleteNotify(int notifyId) {
		dao.delete(notifyId);

	}

}
