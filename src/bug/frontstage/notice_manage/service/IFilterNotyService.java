package bug.frontstage.notice_manage.service;

import java.util.List;
import java.util.Map;

public interface IFilterNotyService {

	public List<Map<String,Object>> showNotyBySearch(String info,int pid,String currpage,String everycount);

	public List<Map<String,Object>> showNotyByFilter(String typeInfo,String creater,int pid,String currpage,String everycount);

//	public List<Map<String,Object>> showNotyByFilter(String typeInfo,String creater,String search,int pid,String currpage,String everycount);

}
