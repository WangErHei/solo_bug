package bug.frontstage.login.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.login.dao.Login;
import bug.frontstage.login.service.SelectProgramService;

@Service("SelectProgramLoginServiceimp")
public class SelectProgramLoginServiceimp implements SelectProgramService {

	
	@Autowired
	private Login login;
	@Override
	public List<Map<String, Object>> selectAllProgram(int bid) {
		List<Map<String, Object>> list=  login.programAll(bid);
		return list;
	}

}
