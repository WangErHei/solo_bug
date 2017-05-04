package bug.frontstage.program.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.program.dao.CreateProgram;
import bug.frontstage.program.model.Program;
import bug.frontstage.program.service.CreateProgramService;

@Service("CreateProgramSeviceimp")
public class CreateProgramSeviceimp  implements  CreateProgramService{

	@Autowired
	private CreateProgram  createProgram;
	
	@Override
	public void createProgram(Program program,int   id,String buser_email ) {
		 createProgram.createProgram(program, id,buser_email);
		
	}
   
     public int getProgramId(int  bid, Program program){
    	 int pid = createProgram.getId(bid,program);
    	 return pid;
     }
	
	public  void insertUserRoleMain(int  bid,int pid){
		createProgram.insertUserRoleMain(bid,pid);
	}
     
     
}
