package bug.frontstage.project_info.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.project_info.dao.SelectProgram;
import bug.frontstage.project_info.service.UpdateBugService;

@Service("UpdateBugServiceimp")
public class UpdateBugServiceimp  implements UpdateBugService {

@Autowired
private SelectProgram  selectProgram;
	
	
	@Override
	public List<Map<String, Object>> updateBug(int bug_id) {
		
		return selectProgram.updateBug(bug_id);
	}

}
