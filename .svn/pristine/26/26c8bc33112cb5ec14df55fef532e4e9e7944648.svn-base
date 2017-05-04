package bug.frontstage.program.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.program.dao.CreateProgram;
import bug.frontstage.program.service.InsertUseRoleService;

@Service("InsertUserRoleServiceimp")
public class InsertUserRoleServiceimp   implements  InsertUseRoleService  {
  
	@Autowired
	private CreateProgram  createProgram;
	
	
	@Override
	public void insertUserRole(int  bid,int pid) {
		createProgram.insertUserRole(bid,pid);
		
	}

	public void insertUserRoleMain(int  bid,int pid) {
		createProgram.insertUserRoleMain(bid,pid);
		
	}
	
}
