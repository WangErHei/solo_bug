package bug.frontstage.project_info.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.project_info.dao.SelectProgram;
import bug.frontstage.project_info.service.CommBugService;

@Service("CommBugServiceimp")
public class CommBugServiceimp  implements CommBugService{

	@Autowired
	private SelectProgram  selectProgram;
	
	@Override
	public List<Map<String, Object>> comm(int comm_id) {
		
		return selectProgram.comm(comm_id);
	}

	@Override
	public void commSub(String content, String photo, String fu, String fu_name, int comm_id) {
		selectProgram.commSub(content, photo, fu, fu_name, comm_id);	
	}

	@Override
	public void delComm(int comm_id) {
		selectProgram.delComm(comm_id);
		
	}

}
