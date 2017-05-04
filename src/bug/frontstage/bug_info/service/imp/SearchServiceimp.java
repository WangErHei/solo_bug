package bug.frontstage.bug_info.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bug.frontstage.bug_info.dao.Bug;
import bug.frontstage.bug_info.service.SearchService;

@Service("SearchServiceimp")
public class SearchServiceimp  implements SearchService{

	@Autowired
	private Bug bug;
	
	
	@Override
	public List<Map<String, Object>> search(int pid, String currpage, String everycount, String content) {
		
		return bug.search(pid, currpage, everycount, content);
	}


	@Override
	public int searchSum(int pid,  String content) {
		
		return bug.searchSum(pid, content);
	}

}
