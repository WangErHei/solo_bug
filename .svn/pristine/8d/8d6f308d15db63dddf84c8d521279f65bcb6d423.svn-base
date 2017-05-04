package bug.frontstage.test_case.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.test_case.dao.TestCaseDao;
import bug.frontstage.test_case.model.TestCase;
import bug.frontstage.test_case.service.ITestCaseService;
@Service("TestCaseServiceImp")
public class TestCaseServiceImp implements ITestCaseService {
	
	@Autowired
	private  TestCaseDao dao;
	
	
	@Override
	public List<Map<String, Object>> showAllTestCase(int pid, String currpage, String everycount) {
		return dao.showAllTestCase(pid, currpage, everycount);
	}

	@Override
	public int countTestCase(int pid) {
		return dao.countTestCase(pid);
	}

	@Override
	public List<Map<String, Object>> showOneTestCase(int cid) {
		return dao.showOneTestCase(cid);
	}

	@Override
	public void addTestCase(TestCase testCase) {
		dao.addTestCase(testCase);
	}

	@Override
	public void updateTestCase(TestCase testCase) {
		dao.updateTestCase(testCase);
	}

	@Override
	public void deleteOneCase(int id) {
		dao.deleteOneCase(id);
	}

	@Override
	public List<Map<String, Object>> showCaseBug(int pid, int cid) {
		return dao.showCaseBug(pid, cid);
	}
	
	@Override
	public int showByGroupId(int gid) {
		return dao.showByGroupId(gid);
	}
}
