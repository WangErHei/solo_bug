package bug.frontstage.personal_center.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.personal_center.dao.PersonalDao;
import bug.frontstage.personal_center.service.IJudgePassService;
@Service("JudgePassServiceImp")
public class JudgePassServiceImp implements IJudgePassService {
	
	@Autowired
	private PersonalDao dao;
	@Override
	public boolean isPass(int id, String pass) {
		boolean isPass = dao.isPass(id, pass);
		return isPass;
	}

}
