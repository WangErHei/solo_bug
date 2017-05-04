package bug.frontstage.project_info.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.project_info.dao.SelectProgram;
import bug.frontstage.project_info.model.Bug;
import bug.frontstage.project_info.service.UpdateSubmitService;


@Service("UpdateSubmitServiceimp")
public class UpdateSubmitServiceimp implements UpdateSubmitService{

	@Autowired
    private SelectProgram selectProgram;
	

	public void updateSubmit(int bug_id, Bug bug, int pid, int bid) {
		selectProgram.updateSubmit(bug_id, bug, pid, bid);
		
	}

	@Override
	public List<Map<String, Object>> log(int bug_id) {
		
		return selectProgram.log(bug_id);
	}

	
	public String head(int  bid){
		return  selectProgram.head(bid);
	}
}
