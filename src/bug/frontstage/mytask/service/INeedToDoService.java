package bug.frontstage.mytask.service;

import java.util.List;
import java.util.Map;

public interface INeedToDoService {

	public List<Map<String,Object>> needToDo(int bid,int pid,String currpage,String everycount);
}
