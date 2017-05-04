package bug.frontstage.project_info.service;

import java.util.List;
import java.util.Map;

import bug.frontstage.project_info.model.Bug;

public interface UpdateSubmitService {
	public void  updateSubmit(int bug_id,Bug bug,int pid,int bid );
	public   List<Map<String,Object>> log(int bug_id);
}
