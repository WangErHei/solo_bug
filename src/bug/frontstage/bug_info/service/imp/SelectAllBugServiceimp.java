package bug.frontstage.bug_info.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.bug_info.dao.Bug;
import bug.frontstage.bug_info.service.SelectAllBugService;

@Service("SelectAllBugServiceimp")
public class SelectAllBugServiceimp  implements SelectAllBugService{

	@Autowired
	private  Bug bug;
	
	@Override
	public List<Map<String, Object>>allBug(int pid,String currpage, String everycount) {
		// TODO Auto-generated method stub
		List<Map<String, Object>>  allbug =  bug.allBug(pid,currpage,everycount);
		
		return allbug;
	}

	public  int allBugNum(int pid){
		return bug.allBugNumber(pid);
	}
	
}
