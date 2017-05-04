package bug.frontstage.project_info.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.project_info.dao.SelectProgram;
import bug.frontstage.project_info.model.Bug;
import bug.frontstage.project_info.service.AddProgramService;

@Service("AddProgramServiceimp")
public class AddProgramServiceimp implements   AddProgramService {

	@Autowired
	private SelectProgram  selectProgram;
	
	public  void addBug(Bug bug,int pid,int bid){
		selectProgram.addBug(bug,pid,bid);
		
	}
	
	public String buserName(int bid){
		return selectProgram.buserName(bid);
		
	}
	
}



