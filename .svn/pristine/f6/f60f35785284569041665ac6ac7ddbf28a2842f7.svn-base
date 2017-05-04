package bug.frontstage.bug_info.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.bug_info.dao.Bug;
import bug.frontstage.bug_info.service.IFilterBugInfoService;
@Service("FilterBugInfoServiceImp")
public class FilterBugInfoServiceImp implements IFilterBugInfoService {

	@Autowired
	private Bug dao;
	
	@Override
	public List<Map<String, Object>> filterActiveBug(String type, String state, String prop, String maker, int pid,
			String currpage, String everycount) {
		return dao.filterActiveBug(type, state, prop, maker, pid, currpage, everycount);
	}

	@Override
	public int countFilterActive(String type, String state, String prop, String maker,int pid) {
		return dao.countFilterActive(type, state, prop, maker, pid);
	}

	@Override
	public List<Map<String, Object>> activeMaker(String type, String state, String prop, int pid) {
		return dao.activeMaker(type, state, prop, pid);
	}
	
	@Override
	public List<Map<String, Object>> filterAllBug(String type, String state, String prop, String maker, String signer,
			String creater, int pid, String currpage, String everycount) {
		return dao.filterAllBug(type, state, prop, maker, signer, creater, pid, currpage, everycount);
	}

	@Override
	public int countFilterAll(String type, String state, String prop, String maker, String signer, String creater,
			int pid) {
		return dao.countFilterAll(type, state, prop, maker, signer, creater, pid);
	}

	@Override
	public List<Map<String, Object>> allMaker(String type, String state, String prop, String signer, String creater,
			int pid) {
		return dao.allMaker(type, state, prop, signer, creater, pid);
	}

	@Override
	public List<Map<String, Object>> allSigner(String type, String state, String prop, String maker, String creater,
			int pid) {
		return dao.allSigner(type, state, prop, maker, creater, pid);
		
	}

	@Override
	public List<Map<String, Object>> allCreater(String type, String state, String prop, String maker, String signer,
			int pid) {
		return dao.allCreater(type, state, prop, maker, signer, pid);
	}

	

}
