package bug.frontstage.bug_info.service;

import java.util.List;
import java.util.Map;

public interface SelectBugInfoService {

	
	public   List<Map<String,Object>>  activeBug(int pid,String currpage,String  everycount);
	public int activeBugNumber(int pid);
	public int waitBugNumber(int pid);
	public int  refuseBugNumber(int pid);
	public int  doneBugNumber(int pid);
	public int  pushBugNumber(int pid);
	public int  closeBugNumber(int pid);
	public  int  member(int  pid);
	public  int produce(int pid );
	public List<Map<String,Object>> notify(int pid);
}
