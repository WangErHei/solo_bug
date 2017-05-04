package bug.frontstage.notice_manage.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.notice_manage.dao.NoticeDao;
import bug.frontstage.notice_manage.service.IShowIndexNoticeService;
@Service("ShowIndexNoticeServiceImp")
public class ShowIndexNoticeServiceImp implements IShowIndexNoticeService {

	@Autowired
	private NoticeDao dao;
	@Override
	public List showIndexNotice(int proId) {
		return dao.showIndexNotice(proId);
	}

}
