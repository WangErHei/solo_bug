package bug.frontstage.login.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.login.dao.Login;
import bug.frontstage.login.model.Buser;
import bug.frontstage.login.service.LoginService;

@Service("LoginServiceImp")
public class LoginServiceImp implements LoginService {

	@Autowired
	private Login login;

	@Override
	public int Login(Buser buser) {
		int i = login.loginDao(buser);
		return i;
	}

	@Override
	public int findId(Buser buser) {
		int i = login.getId(buser);
		return i;
	}

	@Override
	public List<Map<String, Object>> selectName(int id) {
		List<Map<String, Object>>  list = login.slectName(id);
		return list;
	}
	
	public  String selectHead(int id) {

		return login.slectHead(id);
	}

	public void setPropFlag(){
		login.setPropFlag();
	}
}
