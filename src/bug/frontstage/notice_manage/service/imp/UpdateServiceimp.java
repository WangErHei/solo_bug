package bug.frontstage.notice_manage.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.notice_manage.dao.NoticeDao;

@Service("UpdateServiceimp")
public class UpdateServiceimp {

	@Autowired
	private NoticeDao  noticeDao;
	
	public  List<Map<String,Object>>  update(int notigy_id){
		return noticeDao.showOneNotify(notigy_id);
		
	}
	
	
}
