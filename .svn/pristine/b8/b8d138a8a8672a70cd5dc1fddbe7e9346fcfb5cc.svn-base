package bug.frontstage.personal_center.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.personal_center.dao.PersonalDao;
import bug.frontstage.personal_center.service.IUpdatePassService;
@Service("UpdatePassServiceImp")
public class UpdatePassServiceImp implements IUpdatePassService {

	@Autowired
	private PersonalDao dao;
	@Override
	public void updatePass(int id, String pass) {
		dao.updatePass(id, pass);
	}

} 
