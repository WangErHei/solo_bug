package bug.frontstage.project_info.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.project_info.dao.SelectProgram;
import bug.frontstage.project_info.service.BugDetailsService;

@Service("BugDetailsServiceimp")
public class BugDetailsServiceimp  implements BugDetailsService{

	@Autowired
	private SelectProgram selectprogram;
	
	@Override
	public List<Map<String, Object>> bug(int bug_id) {
		return	selectprogram.bug(bug_id);
	
	}
	
	public String programName(int pid){
		
		return selectprogram.programName(pid);
	}
	

}
