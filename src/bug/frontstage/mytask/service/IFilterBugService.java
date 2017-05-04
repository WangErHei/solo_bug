package bug.frontstage.mytask.service;

import java.util.List;
import java.util.Map;

public interface IFilterBugService {

	//分配给我：筛选bug
	public List<Map<String,Object>> filterNeedToDo(String type ,String state,String prop,int bid,int pid,String currpage,String everycount);

	//分配给我：筛选后Bug数量
	public int countFilterNeedToDo(String type ,String state,String prop,int bid,int pid);
	
	
	
	//分配给我：筛选bug
	public List<Map<String,Object>> filterMyAllTask(String type ,String state,String prop,String signer,int bid,int pid,String currpage,String everycount);

	//分配给我：筛选后Bug数量
	public int countFilterMyAllTask(String type ,String state,String prop,String signer,int bid,int pid);
	//分配给我：处理人列表
	public List<Map<String,Object>> myAllTaskMaker(String type ,String state,String prop,int bid,int pid);
		
	
	
	//我的分配：筛选bug
	public List<Map<String,Object>> filterAssignOthers(String type ,String state,String prop,String maker,int bid,int pid,String currpage,String everycount);

	//我的分配：筛选后Bug数量
	public int countFilterAssignOthers(String type ,String state,String prop,String maker,int bid,int pid);
	//我的分配：处理人列表
	public List<Map<String,Object>> assignOthersMaker(String type ,String state,String prop,int bid,int pid);
	
	
	
}
