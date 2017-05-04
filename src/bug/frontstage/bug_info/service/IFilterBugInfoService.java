package bug.frontstage.bug_info.service;

import java.util.List;
import java.util.Map;

public interface IFilterBugInfoService {
	
	//活动Bug：筛选
	public List<Map<String,Object>> filterActiveBug(String type,String state,String prop,String maker,int pid,String currpage, String  everycount);
	//活动Bug：筛选后数量
	public int countFilterActive(String type,String state,String prop,String maker,int pid);
	//活动Bug：处理人列表
	public List<Map<String,Object>> activeMaker(String type,String state,String prop,int pid);
						
	
	
	//所有Bug： 筛选
	public List<Map<String,Object>> filterAllBug(String type,String state,String prop,String maker,String signer,String creater,int pid,String currpage, String  everycount);
	//所有Bug： 筛选后数量
	public int countFilterAll(String type,String state,String prop,String maker,String signer,String creater,int pid);
	//所有Bug：处理人列表
	public List<Map<String,Object>> allMaker(String type,String state,String prop,String signer,String creater,int pid);
	//所有Bug：分配人列表
	public List<Map<String,Object>> allSigner(String type,String state,String prop,String maker,String creater,int pid);
	//所有Bug：创建人列表
	public List<Map<String,Object>> allCreater(String type,String state,String prop,String maker,String signer,int pid);
			
			

}
