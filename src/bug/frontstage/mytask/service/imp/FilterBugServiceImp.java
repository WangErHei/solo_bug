package bug.frontstage.mytask.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.mytask.dao.MyTaskDao;
import bug.frontstage.mytask.service.IFilterBugService;
@Service("FilterBugServiceImp")
public class FilterBugServiceImp implements IFilterBugService {

	@Autowired
	private MyTaskDao dao;
	

	@Override
	public List<Map<String, Object>> filterAssignOthers(String type, String state, String prop, String maker, int bid,
			int pid, String currpage, String everycount) {
		
		return dao.filterAssignOthers(type, state, prop, maker, bid, pid, currpage, everycount);
	}

	@Override
	public int countFilterAssignOthers(String type, String state, String prop, String maker, int bid, int pid) {
		
		return dao.countFilterAssignOthers(type, state, prop, maker, bid, pid);
	}

	@Override
	public List<Map<String, Object>> assignOthersMaker(String type, String state, String prop, int bid, int pid) {
		
		return dao.assignOthersMaker(type, state, prop, bid, pid);
	}

	@Override
	public List<Map<String, Object>> filterMyAllTask(String type, String state, String prop, String signer, int bid,
			int pid, String currpage, String everycount) {
		return dao.filterMyAllTask(type, state, prop, signer, bid, pid, currpage, everycount);
	}

	@Override
	public int countFilterMyAllTask(String type, String state, String prop, String signer, int bid, int pid) {
		return dao.countFilterMyAllTask(type, state, prop, signer, bid, pid);
	}

	@Override
	public List<Map<String, Object>> myAllTaskMaker(String type, String state, String prop, int bid, int pid) {
		return dao.myAllTaskMaker(type, state, prop, bid, pid);
	}

	@Override
	public List<Map<String, Object>> filterNeedToDo(String type, String state, String prop, int bid, int pid,
			String currpage, String everycount) {
		return dao.filterNeedToDo(type, state, prop, bid, pid, currpage, everycount);
	}

	@Override
	public int countFilterNeedToDo(String type, String state, String prop, int bid, int pid) {
		return dao.countFilterNeedToDo(type, state, prop, bid, pid);
	}

}
