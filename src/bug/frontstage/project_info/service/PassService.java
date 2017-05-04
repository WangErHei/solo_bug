package bug.frontstage.project_info.service;

import java.util.List;
import java.util.Map;

public interface PassService {
	public void  pass(int bug_id,String content,int bid,String photo,String fu,String fu_name);
	public   List<Map<String,Object>> log(int bug_id);
}
