package bug.frontstage.test_case.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.test_case.dao.TestCaseDao;
import bug.frontstage.test_case.model.TestGroup;
import bug.frontstage.test_case.service.ITestGroupService;
@Service("TestGroupServiceImp")
public class TestGroupServiceImp implements ITestGroupService {

	@Autowired
	private  TestCaseDao dao;
	@Override
	public List<Map<String, Object>> showTestGroup(int pid) {
		return dao.showTestGroup(pid);
	}

	@Override
	public void addTestGroup(TestGroup testGroup) {
		dao.addTestGroup(testGroup);
	}

	@Override
	public void updateTestGroup(TestGroup testGroup) {
		dao.updateTestGroup(testGroup);
	}

	@Override
	public boolean deleteOneGroup(int id) {
		return dao.deleteOneGroup(id);
	}

	@Override
	public List<Map<String, Object>> showOneTestGroup(int gid) {
		return dao.showOneTestGroup(gid);
	}
	
	@Override
	public List<Map<String, Object>> showProduce(int pid) {
		return dao.showProduce(pid);
	}

	

}
