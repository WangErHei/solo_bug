package bug.frontstage.notice_manage.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.notice_manage.dao.NoticeDao;
import bug.frontstage.notice_manage.service.IFilterNotyService;

@Service("FilterNotyServiceImp")
public class FilterNotyServiceImp implements IFilterNotyService {

	@Autowired
	private NoticeDao dao;
		
	@Override
	public List<Map<String, Object>> showNotyByFilter(String typeInfo, String creater, int pid, String currpage,
			String everycount) {
		
		return dao.showNotyByFilter(typeInfo, creater, pid, currpage, everycount);
	}
	public int countNotyByFilter(String typeInfo,String creater,int pid){
		return dao.countNotyByFilter(typeInfo, creater, pid);
	}
	@Override
	public List<Map<String, Object>> showNotyBySearch(String info, int pid, String currpage, String everycount) {
		// TODO Auto-generated method stub
		return null;
	}
}
