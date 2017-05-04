package bug.frontstage.project_info.service.imp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.project_info.dao.SelectProgram;
import bug.frontstage.project_info.service.ProgramService;

@Service("ProgramServiceimp")
public class ProgramServiceimp implements  ProgramService{

	@Autowired
private SelectProgram selectProgram ;
	
	
	@Override
	public List<Map<String, Object>> selectAllProgram(int bid) {
		List<Map<String, Object>> list = selectProgram.programAll(bid);
		return list;
	}


	@Override
	public List<Map<String, Object>> selectAllMember(int pid) {
		return  selectProgram.selectAllMember(pid);
	
	}
	

public List<Map<String, Object>> selectAllProduce(int pid){
	return  selectProgram.selectAllProduce(pid);
	
}













}




