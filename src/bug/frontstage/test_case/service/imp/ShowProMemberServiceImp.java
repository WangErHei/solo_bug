package bug.frontstage.test_case.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.test_case.dao.TestCaseDao;
import bug.frontstage.test_case.service.IShowProMemberService;

@Service("ShowProMemberServiceImp")
public class ShowProMemberServiceImp implements IShowProMemberService {

	@Autowired
	private  TestCaseDao dao;
	
	@Override
	public List<Map<String, Object>> showProgramMemberList(int pid) {
		return dao.showProgramMemberList(pid);
	}

}
