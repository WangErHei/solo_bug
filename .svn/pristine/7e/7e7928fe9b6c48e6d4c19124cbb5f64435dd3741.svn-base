package bug.frontstage.project_info.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.project_info.dao.SelectProgram;
import bug.frontstage.project_info.service.PushService;

@Service("PushServiceimp")
public class PushServiceimp implements  PushService {

	@Autowired
	private SelectProgram  selectProgram;
	
	@Override
	public void push(int bug_id, String content, int bid) {
		selectProgram.push(bug_id, content, bid);
		
	}

	@Override
	public List<Map<String, Object>> log(int bug_id) {
	return selectProgram.log(bug_id);
	}

	public String head(int  bid){
		return  selectProgram.head(bid);
	}
	
}
