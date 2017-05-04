package bug.frontstage.project_info.service;

import java.util.List;
import java.util.Map;

public interface SignService {
	public   List<Map<String,Object>> log(int bug_id);
	public  void sign(String buser_name,int bug_id,String content,int bid,String path,String paths,String pathss );
}
