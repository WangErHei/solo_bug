package bug.frontstage.bug_info.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.bug_info.dao.Bug;
import bug.frontstage.bug_info.service.SelectActiveBugService;


@Service("SelectActiveBugServiceimp")
public class SelectActiveBugServiceimp implements  SelectActiveBugService{

	@Autowired
	private Bug bug;
	
	@Override
	public List<Map<String, Object>> activeBug(int pid,String currpage, String everycount) {
		 List<Map<String, Object>> activebug = 	bug.activeBug(pid,currpage, everycount);
		return activebug;
	}

	public int activeNum(int pid){
		
		return bug.activeBugNumber(pid);
	}
	
	public int activeAllNum(int pid){
		return bug.activeBugAllNumber(pid);
	}
}
