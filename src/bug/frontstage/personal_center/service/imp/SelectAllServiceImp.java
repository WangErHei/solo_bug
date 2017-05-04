package bug.frontstage.personal_center.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.personal_center.dao.PersonalDao;
import bug.frontstage.personal_center.service.SelectAllService;


@Service("SelectAllServiceImp")
public class SelectAllServiceImp  implements SelectAllService{

	@Autowired
	private PersonalDao dao;
	
	@Override
	public List<Map<String, Object>> selectAll(int id) {
		List<Map<String, Object>> list = dao.selectAll(id);
		return list;
	}

}
