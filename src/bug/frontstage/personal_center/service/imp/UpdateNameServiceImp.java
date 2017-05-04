package bug.frontstage.personal_center.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.personal_center.dao.PersonalDao;
import bug.frontstage.personal_center.service.IUpdateNameService;
@Service("UpdateNameServiceImp")
public class UpdateNameServiceImp implements IUpdateNameService {

	@Autowired
	private PersonalDao dao;
	
	@Override
	public void updateName(int id, String name) {
		dao.updateName(id, name);
	}
	
	public boolean isName(String name){
		return  dao.Exit(name);
	}
}