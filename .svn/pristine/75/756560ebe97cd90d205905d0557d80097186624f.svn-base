package bug.frontstage.notice_manage.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.notice_manage.dao.NoticeDao;
import bug.frontstage.notice_manage.model.Notify_Comment;
import bug.frontstage.notice_manage.service.ICommentNotyService;

@Service("CommentNotyServiceImp")
public class CommentNotyServiceImp implements ICommentNotyService {

	@Autowired
	private NoticeDao dao;
	
	@Override
	public List<Map<String, Object>> showAllNotifyComment(int notyId) {
		return dao.showAllNotifyComment(notyId);
	}

	@Override
	public  void addNotifyComment(Notify_Comment notyComm) {
		dao.addNotifyComment(notyComm);
	}

	@Override
	public void deleteOneNotyComm(int commId) {
		dao.deleteOneNotyComm(commId);
	}

	@Override
	public void deleteNotyComm(int notyId) {
		dao.deleteNotyComm(notyId);
	}

	@Override
	public void deleteProNotyComm(int pid) {
		dao.deleteProNotyComm(pid);
	}

	@Override
	public void updateNotifyComment(Notify_Comment notyComm) {
		dao.updateNotifyComment(notyComm);
	}

	public String name(int bid){
	   return 	dao.name(bid);
	}
	
}
