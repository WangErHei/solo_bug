package bug.frontstage.notice_manage.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.notice_manage.dao.NoticeDao;
import bug.frontstage.notice_manage.service.IShowCreaterNameService;
@Service("ShowCreaterNameServiceImp")
public class ShowCreaterNameServiceImp implements IShowCreaterNameService {

	@Autowired
	private NoticeDao dao;
	
	@Override
	public List showNameList(String typeInfo, int pid) {
		
		return dao.nameList(typeInfo, pid);
	}


}
