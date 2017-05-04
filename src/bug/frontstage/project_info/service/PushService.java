package bug.frontstage.project_info.service;

import java.util.List;
import java.util.Map;

public interface PushService {
	public void push(int  bug_id,String content,int bid);
	public   List<Map<String,Object>> log(int bug_id);
}
