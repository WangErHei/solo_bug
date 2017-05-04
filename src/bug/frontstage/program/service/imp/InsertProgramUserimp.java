package bug.frontstage.program.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.program.dao.CreateProgram;
import bug.frontstage.program.service.InsertProgramUserService;


@Service("InsertProgramUserimp")
public class InsertProgramUserimp  implements   InsertProgramUserService {

	@Autowired
	private CreateProgram  createProgram;
	
	
	@Override
	public void insertProgramUser(int  pid, int  bid) {
		createProgram.insertProgramBuser(pid, bid);
		
	}

}
