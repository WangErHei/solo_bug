package bug.frontstage.test_case.service;

import java.util.List;
import java.util.Map;

public interface IShowProMemberService {

	//查询组员
	public List<Map<String,Object>> showProgramMemberList(int pid);
}
