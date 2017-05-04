package bug.frontstage.bug_info.service;

import java.util.List;
import java.util.Map;

public interface SelectPageService {
	public String totalDao();
	public List<Map<String,Object>> selectPageDao(String currpage,String everycount);
}
