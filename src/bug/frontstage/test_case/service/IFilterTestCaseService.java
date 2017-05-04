package bug.frontstage.test_case.service;

import java.util.List;
import java.util.Map;

public interface IFilterTestCaseService {
	// 筛选：查询该项目测试用例
	public List<Map<String,Object>> showFilterTestCase(String group,String prop,String manager,String state,String produceF,int pid,String currpage,String everycount);
	//根据通知类型和创建者筛选后的数量
	public int countTestCaseFilter(String group,String prop,String manager,String state,String produceF,int pid);
	//管理员列表
	public List<Map<String,Object>> managerFilterList(String group,String prop,String state,String produceF,int pid);
	//测试组列表
	public List<Map<String,Object>> goupFilterList(String manager,String prop,String state,String produceF,int pid);
	//产品模块列表
	public List<Map<String,Object>> produceFilterList(String group,String managerF,String propF,String stateF,int pid);
}
