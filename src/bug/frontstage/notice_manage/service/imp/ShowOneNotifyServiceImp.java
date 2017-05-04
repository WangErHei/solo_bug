package bug.frontstage.notice_manage.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.notice_manage.dao.NoticeDao;
import bug.frontstage.notice_manage.service.IShowOneNotifyService;
@Service("ShowOneNotifyServiceImp")
public class ShowOneNotifyServiceImp implements IShowOneNotifyService {

	@Autowired
	private NoticeDao dao;
	@Override
	public List<Map<String,Object>> showOneNotify(int notyId) {
		
		return dao.showOneNotify(notyId);
	}

	
	public int right(int bid,int pid){
		return	dao.right(bid, pid);
		}
}
