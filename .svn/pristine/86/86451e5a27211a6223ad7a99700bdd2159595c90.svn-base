package bug.frontstage.project_info.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.project_info.dao.SelectProgram;
import bug.frontstage.project_info.service.BugRightService;

@Service("BugRightServiceimp")
public class BugRightServiceimp  implements BugRightService {

	@Autowired
	private  SelectProgram  selectProgram;

	@Override
public String details(int bid, int bug_id, int pid) {
	
	return selectProgram.details(bid, bug_id, pid);
	}

	@Override
public int right(int bid, int pid, int bug_id) {
	
	return selectProgram.right(bid, pid, bug_id);
}
	
	
	public String state(int bug_id){
		return selectProgram.state(bug_id);
	}
	
	
	public String type(int bug_id)
	{
		return selectProgram.bugType(bug_id);
	}

}
