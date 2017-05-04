package bug.frontstage.test_case.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.test_case.dao.TestCaseDao;
import bug.frontstage.test_case.service.IFilterTestCaseService;
@Service("FilterTestCaseServiceImp")
public class FilterTestCaseServiceImp implements IFilterTestCaseService {

	@Autowired
	private  TestCaseDao dao;
	
	@Override
	public List<Map<String, Object>> showFilterTestCase(String group,String prop,String manager,String state,String produce,int pid, String currpage, String everycount ) {
		return dao.showFilterTestCase(group, prop, manager, state,produce,pid, currpage, everycount);
	}

	@Override
	public int countTestCaseFilter(String group, String prop, String manager, String state, String produce,int pid) {
		return dao.countTestCaseFilter(group, prop, manager, state, produce,pid);
	}

	@Override
	public List<Map<String, Object>> managerFilterList(String group, String prop, String state, String produce,int pid) {
		return dao.managerFilterList(group, prop, state, produce,pid);
	}

	@Override
	public List<Map<String, Object>> goupFilterList(String manager, String prop, String state,String produce, int pid) {
		return dao.goupFilterList(manager, prop, state, produce,pid);
	}

	@Override
	public List<Map<String, Object>> produceFilterList(String group, String manager, String prop, String state,int pid) {
		return dao.produceFilterList(group, manager, prop, state, pid);
	}

}
