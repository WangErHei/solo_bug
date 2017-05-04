package bug.frontstage.project_info.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.project_info.dao.SelectProgram;
import bug.frontstage.project_info.service.CommentsService;

@Service("CommentsServiceimp")
public class CommentsServiceimp  implements  CommentsService{

	@Autowired
	private SelectProgram   selectProgram;
	
	
	@Override
	public List<Map<String, Object>> log(int bug_id) {
	
		return 	selectProgram.log(bug_id);
	}

	@Override
	public void comments(int bug_id, int bid, String result, String content, String results, String resultss) {
	
		selectProgram.comments(bug_id, bid, result, content, results, resultss);
		
	}

	public String head(int  bid){
		return  selectProgram.head(bid);
	}
	
	
}
