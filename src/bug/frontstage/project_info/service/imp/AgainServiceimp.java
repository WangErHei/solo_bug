package bug.frontstage.project_info.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.project_info.dao.SelectProgram;
import bug.frontstage.project_info.service.AgainService;

@Service("AgainServiceimp")
public class AgainServiceimp  implements AgainService{

	@Autowired
	private  SelectProgram  selectProgram;
	
	@Override
	public void again(String buser_name, int bug_id, String content, int bid, String photo, String fu, String fu_name) {
		selectProgram.again(buser_name, bug_id, content, bid, photo, fu, fu_name);
		
	}

	@Override
	public List<Map<String, Object>> log(int bug_id) {
		
		return selectProgram.log(bug_id);
	}

	public String head(int  bid){
		return  selectProgram.head(bid);
	}
	
	
}
