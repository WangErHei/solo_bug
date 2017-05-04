package bug.frontstage.project_info.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.project_info.dao.SelectProgram;
import bug.frontstage.project_info.service.NotPassService;

@Service("NotPassServiceimp")
public class NotPassServiceimp  implements NotPassService  {

	@Autowired
	private  SelectProgram  selectProgram;
	
	@Override
	public void notPass(int bug_id, String content, int bid, String photo, String fu, String fu_name) {
		selectProgram.notPass(bug_id, content, bid, photo, fu, fu_name);
		
	}

	@Override
	public List<Map<String, Object>> log(int bug_id) {
		
		return selectProgram.log(bug_id);
	}

	public String head(int  bid){
		return  selectProgram.head(bid);
	}
	
}
