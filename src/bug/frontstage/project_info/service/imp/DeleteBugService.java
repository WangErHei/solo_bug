package bug.frontstage.project_info.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import bug.frontstage.project_info.dao.SelectProgram;

@Service("DeleteBugService")
public class DeleteBugService {

	
	
	@Autowired
	private SelectProgram selectProgram;
	
	
	public  void   deleteBug(int bug_id){
		selectProgram.delete(bug_id);		
	}
}
